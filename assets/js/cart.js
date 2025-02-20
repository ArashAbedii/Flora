var DOMAIN="http://localhost:8000/";
function addToCart(productId){
    var number=$("#"+productId+"_number").val();
    
    $.post(DOMAIN+"inc/ajaxRequests/cart.php",{productid:productId,number:number},function(response){
        var response=JSON.parse(response);
        
        $("#badgetxt").text(response['countProducts']);
        alert("محصول مورد نظر به سبد خرید اضافه شد");

    });
}

function updateNumberOfCart(productId,type,maxInstock){
    //get number of products
    var number=$("#"+productId+"_number").val();
 
    if(type=='increase'){
        number= parseInt(number)+1;
    }else if(type=='decrease'){
        number=parseInt(number)-1;
    }

    if(number<1){
        number=1;
    }

    if(number>maxInstock){
        number=maxInstock;
    }


    //update number input value
    $("#"+productId+"_number").val(number);

    $.post(DOMAIN+"inc/ajaxRequests/cart.php",{productid:productId,number:number},function(response){
        var response=JSON.parse(response);
        
        //update price text
        if(response['orgsum']!="none"){
            $("#"+productId+"_orgprice").text(response['orgprice']);
        }
        
        $("#"+productId+"_sumprice").text(response['sumprice']+" تومان ");
        $("#fullsum").text(response['fullsum']+" تومان");
       
    });
}

function controllStockRange(productId,maxInstock,type){
    var number=$("#"+productId+"_number").val();
   
    if(type=='increase'){
        number= parseInt(number)+1;
    }else if(type=='decrease'){
        number=parseInt(number)-1;
    }
    
    if(number<1){
        number=1;
    }

    if(number>maxInstock){
        number=maxInstock;
    }
   
    //update number input value
    $("#"+productId+"_number").val(number);
    
}
function deleteFromCart(productId){
    $.post(DOMAIN+"inc/ajaxRequests/cart.php",{delcart:productId},function(response){
        var response=JSON.parse(response);
        //console.log(response);
        $("#delcart_"+productId).remove();
        $("#fullsum").text(response['fullsum']+" تومان");
        $("#badge").text(response['countProducts']);
    });
}