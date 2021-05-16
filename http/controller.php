<?php
use Database\Db;

if(isset($pageUi)){
    if($pageUi=='addCategory'){

        if(isset($_GET['rm_cat'])){
            $category=new Category($_GET['rm_cat']);
            $category->delete();
            $category->deleteSubCategories();
 
           // $category->getMessageHandler()->showMessages();
        }elseif(isset($_GET['rm_sub'])){
            $subCategory=new SubCategory($_GET['rm_sub']);
            $subCategory->delete();
            
           // $subCategory->getMessageHandler()->showMessages();
        }elseif(isset($_POST['addCategory'])){
            $catName=isset($_POST['name']) ? $_POST['name'] : "";
            $catType=isset($_POST['catType']) ? $_POST['catType'] : "";
            
            if($catType!=""){
                if($catType=='parent'){
                    //add category
                    Category::create(['name'=>$catName,'creator_id'=>1],$message);
                    //$message->showMessages();
                }else{
                    //add sub category
                    SubCategory::create(['name'=>$catName,'creator_id'=>1,'category_id'=>$catType]);
                }
            }
        }
        
        //get categories and sub categories
        $categories=Category::getCategories();
    }elseif($pageUi=='addProduct'){

        if(isset($_POST['addProduct'])){
            //add product actions
            $title=isset($_POST['title']) ? $_POST['title'] : null;
            $price=isset($_POST['price']) ? $_POST['price'] : null;
            $description=isset($_POST['description']) ? $_POST['description'] : null;
            $image=isset($_FILES['img']) ? $_FILES['img'] : null;
            $image_alt=isset($_POST['image_alt']) ? $_POST['image_alt'] : null;
            $instock=isset($_POST['instock']) ? $_POST['instock'] : null;
            $subCategoryId=isset($_POST['subCategoryId']) ? $_POST['subCategoryId'] : null;
            //admin Id
            $creator_id=1;
            $product_id=Product::create(['title'=>$title,'price'=>$price,'description'=>$description,'image'=>$image,'image_alt'=>$image_alt,'instock'=>$instock,'creator_id'=>$creator_id],$message);
            
            //add subcategory_product
            if($product_id && $subCategoryId){
                $subCategoryObj=new SubCategory($subCategoryId);
                $result=Db::insert(SUB_CATEGORY_PRODUCT_TABLE_NAME,['product_id'=>$product_id,'subcategory_id'=>$subCategoryId]);
                $result=Db::insert(CATEGORY_PRODUCT_TABLE_NAME,['product_id'=>$product_id,'category_id'=>$subCategoryObj->getCategory()->getCategoryId()]);
            }
        }

        //get categories 
        $categories=Category::getCategories();
    }elseif($pageUi=='editProduct'){
        if(isset($_POST['cancelEditProduct'])){
            redirectTo("products.php");
        }
        if(isset($_GET['id'])){

            $product=new Product($_GET['id']);

            if(isset($_POST['editProduct'])){
                //add product actions
                $title=isset($_POST['title']) ? $_POST['title'] : null;
                $price=isset($_POST['price']) ? $_POST['price'] : null;
                $description=isset($_POST['description']) ? $_POST['description'] : null;
                $image=isset($_FILES['img']['name']) && $_FILES['img']['name']!="" ? $_FILES['img'] : null;
                $image_alt=isset($_POST['image_alt']) ? $_POST['image_alt'] : null;
                $instock=isset($_POST['instock']) ? $_POST['instock'] : null;
                $subCategoryId=isset($_POST['subCategoryId']) ? $_POST['subCategoryId'] : null;
                //admin Id
                $creator_id=1;
                $result=$product->update(['title'=>$title,'price'=>$price,'description'=>$description,'image'=>$image,'image_alt'=>$image_alt,'instock'=>$instock,'creator_id'=>$creator_id],$message);
                
                
                //add subcategory_product
                if($result && $subCategoryId){
                    $product_id=$product->getId();
                    $result=Db::update(SUB_CATEGORY_PRODUCT_TABLE_NAME,['product_id'=>$product->getId(),'subcategory_id'=>$subCategoryId],"product_id='$product_id'");
                }
                //or redirect to list
                redirectTo("products.php");
            }


            //get categories 
            $categories=Category::getCategories();
        }
    }elseif($pageUi=='editCategory'){

        if(isset($_GET['id']) ){
            //cancel edit
            if(isset($_POST['cancelEdit'])){
                redirectTo("categories.php");
            }

            //do edit
            $category=new Category($_GET['id']);
            if(isset($_POST['cancelEditCategory'])){
                $category->update(['name'=>$_POST['name']]);
                redirectTo("categories.php");
            }
        }

        //get updated category
        $category=new Category($_GET['id']);

        //get categories 
        $categories=Category::getCategories();
    }elseif($pageUi=='editSubCategory'){

        //cancel edit sub category
        if(isset($_POST['cancelEditSubCategory'])){
            redirectTo("categories.php");
        }

        if(isset($_GET['id']) ){
            $subCategory=new SubCategory($_GET['id']);
            if(isset($_POST['editSubCategory'])){
                $subCategory->update(['name'=>$_POST['name'],'category_id'=>$_POST['category_id']]);
            }
        }
        $subCategory=new SubCategory($_GET['id']);

        //get categories 
        $categories=Category::getCategories();
    }elseif($pageUi=='listProducts'){

        if(isset($_GET['del_pro'])){
            $productObj=new Product($_GET['del_pro']);
            $productObj->delete();
        }

        if(isset($_GET['term'])){
            $term=Db::correctTermFormat($_GET['term']);
            $products=Db::simpleSearch(PRODUCT_TABLE_NAME,"title LIKE '%$term%'");
        }else{
            $products=Product::getProducts();
        }
        
        $categories=Category::getCategories();


    }
    //INDEX
    elseif($pageUi=='index'){
        $mostSelesProducts=Product::getProducts("instock>0","sales","DESC",20);
        $indexCategories=Category::getCategories("show_index='yes'",$message);
        $latestProducts=Product::getProducts("instock>0","id","DESC",10);
    }
    //PRODUCT DETAILS
    elseif($pageUi=='product'){
        if(isset($_GET['pid']) && isset($_GET['slug'])){
            $slug=$_GET['slug'];
            $productId=$_GET['pid'];

            $findProduct=Db::select(PRODUCT_TABLE_NAME,"title='$slug' AND id='$productId'",'single');
            if($findProduct){
                $product=new Product($findProduct['id']);
            }else{
                $product=false;
            }
            
        }
    }
    //CART
    elseif($pageUi=='cart'){
        if(isset($_SESSION['cart']) && $_SESSION['cart']['products']){
            $productsId=$_SESSION['cart']['products'];
        }
    }
    //ENTER PHONE
    elseif($pageUi=='enterphn'){

        if(isset($_POST['phone'])){

            $_SESSION['phone']=$_POST['phone'];
            $phone=$_POST['phone'];
            
            //check user sign up or not
            $checkUserExistsOrNot=Db::checkExists('users',"phone='$phone'","is_varified");

            if($checkUserExistsOrNot==true){
                //create a register code
                $registerCode=rand(1000,9999);

                //update register code in db
                Db::update(USER_TABLE_NAME,['register_code'=>$registerCode],"phone='$phone'");

                //send register code
                sendMessageTrez($phone,"کد شما: $registerCode");

                //redirect to check code page
                redirectTo("entercode.php");
            }else{
                //create register code
                $registerCode=rand(1000,9999);

                //create init account
                $account=new Account();
                $account->createInitialaizeAccount($phone,$registerCode);

                //send register code
                sendMessageTrez($phone,"کد ثبت نام شما: $registerCode");
                //redirect to check code page
                redirectTo("signup.php");
            }
        }
        
    }
    //SIGNUP USER
    elseif($pageUi=='signup'){

        if(isset($_POST['signup'])){

            if(isset($_SESSION['phone'])){
                $phone=$_SESSION['phone'];
                $code=isset($_POST['code']) && $_POST['code'] ? $_POST['code'] : "";
                $FName=isset($_POST['first_name']) && $_POST['first_name'] ? $_POST['first_name'] : "";
                $LName=isset($_POST['last_name']) && $_POST['last_name'] ? $_POST['last_name'] : "";

                //get init account data
                $initAccount=Db::select(USER_TABLE_NAME,"phone='$phone'","single");
                if(!$initAccount){
                    redirectTo("enterphn.php");
                }

                if($code==$initAccount['register_code']){
                    //ACCOUNT OBJECT
                    $account=new Account();
                    $result=$account->create($phone,$FName,$LName,$messages);
                    if($result){
                        //do login
                        
                        //redirect to dashboard
                    }else{
                        //show err
                    }
                }else{
                    echo 'کد وارد شده اشتباه است';
                }

            }else{
                redirectTo("enterphn.php");
            }
        }
    }elseif($pageUi=='entercode'){
        if(isset($_POST['login'])){

            $phone=$_SESSION['phone'];
            $code=isset($_POST['code']) && $_POST['code'] ? $_POST['code'] : "";

            //ACCOUNT OBJECT
            $account=new Account();
            $account->login($phone,$code);
            
        }
    }


}