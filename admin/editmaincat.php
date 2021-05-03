<?php 
  //page controller
  $pageUi='editCategory';
  include_once '../config.php';
?>
<?php

include 'adminheader.php';

?>

    <div class="container-fluid">
  <div class="row">

  <!----------------------------- sidebar --------------------------->

    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse" style="">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">

          <li class="nav-item">
            <a class="nav-link border-bottom" aria-current="page" href="#">
            <i class="fas fa-home"></i>
            خانه
            </a>
          </li>
          <li class="nav-item border-bottom">
            <a class="nav-link" href="#">
            <i class="fas fa-users feather"></i>
            کاربران
            </a>
          </li>
          <li class="nav-item border-bottom">
            <a class="nav-link" href="#">
            <i class="fas fa-cart-arrow-down feather"></i>
            سفارشات
            </a>
          </li>
          <li class="nav-item border-bottom">
            <a class="nav-link" href="#">
            <i class="fas fa-receipt feather"></i>
            فاکتورها
            </a>
          </li>
          <li class="nav-item border-bottom">
            <a class="nav-link" href="addproduct.php">
            <i class="fas fa-plus feather"></i>
            افزودن محصول
            </a>
          </li>
          <li class="nav-item border-bottom">
            <a class="nav-link" href="#">
            <i class="fas fa-shopping-bag feather"></i>
            محصولات
            </a>
          </li>
          <li class="nav-item border-bottom">
            <a class="nav-link active" href="#">
            <i class="fas fa-archive feather"></i>
            دسته بندی ها
            </a>
          </li>
          <li class="nav-item border-bottom">
            <a class="nav-link" href="#">
            <i class="fas fa-truck feather"></i>
            تنظیمات ارسال
            </a>
          </li>
          <li class="nav-item border-bottom">
            <a class="nav-link" href="#">
            <i class="fas fa-comment-alt feather"></i>
            پنل پیامک
            </a>
          </li>
          <li class="nav-item border-bottom">
            <a class="nav-link" href="#">
            <i class="fas fa-image feather"></i>
            اسلاید ها
            </a>
          </li>
          <li class="nav-item border-bottom">
            <a class="nav-link" href="#">
            <i class="fas fa-map-marked-alt feather"></i>
            تنظیمات نقشه
            </a>
          </li>

        </ul>
        
      </div>
    </nav>

    <!----------------------------- left panel --------------------------->

    <!-- ++++++++++++++++++++++++++ edit sub-category +++++++++++++++++++++++ -->

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="container">
        <div class="row">
          <div class="col-md g-3">
            <div class="col-12 p-3 border-bottom border-3 d-flex flex-row align-items-center">
              <i class="fas fa-edit feather mx-2"></i>
              <p class="h5">ویرایش دسته</p>
            </div>
            <form action="" method="post">
              <div class="col-12 my-2">
                <label for="firstName" class="form-label">نام دسته بندی :</label>
                <input name="name" type="text" class="form-control" id="cat-name" placeholder="گیاهان آپارتمانی ..." value="<?php echo $category->getName() ?>" required="">
              </div>
              <div class="col-12 my-2">
                <label for="state" class="form-label">دسته مادر :</label>
                <select disabled class="form-select" id="state" required="">
                  <option selected>دسته اصلی</option>
                  
                </select>
              </div>
              <div class="my-4">
                  <button name="editCategory" type="submit" class="btn btn-success">ثبت تغییرات</button>
                  <button name="cancelEditCategory" type="submit" class="btn btn-danger mx-2">لغو</button>
              </div>
            </form>
          </div>

           <!-- ++++++++++++++++++++++++++ categories +++++++++++++++++++++++ -->

           <div class="col-md g-3">

<!-- ++++++ header START ++++++ -->

  <div class="col-12 p-3 border-bottom border-3 d-flex flex-row align-items-center">
    <i class="fas fa-list mx-2"></i>
    <p class="h5">دسته بندی ها</p>
  </div>

<!-- ++++++ header END ++++++ -->

<!-- ++++++ Listing categories START ++++++ -->

  <ul class="list-group">
    <?php
    //CHECK CATEGORY IS FULL OR EMPTY
      if($categories):
    ?>
        <?php
            //LIST CATEGORIS
            foreach($categories as $category):
        ?>
        <?php
            //GET SUBCATEGORY OF CURRENT CATEGORY
            $categoryObject=new Category($category['id']);
            $subCategories=$categoryObject->getSubCategories();
        ?>
            <?php
                //CHECK SUB_CATEGORY IS FULL OR EMPTY
                if($subCategories):
            ?>
                  <!-- +++++++ collapse example for sub-categories START ++++++++ -->
                  <li class="list-group-item d-flex text-nowrap justify-content-between lh-sm align-items-center">
                    <div>
                      <a class="text-decoration-none text-dark" data-bs-toggle="collapse" href="#collapse<?php echo $category['id']?>" role="button" aria-expanded="false" aria-controls="collapse<?php echo $category['id']?>">
                        <div class="d-flex flex-row align-items-center">
                          <h6 class="my-0"><?php echo $category['name']; ?></h6>
                          <i class="fas fa-chevron-down mx-2"></i>
                        </div>
                      </a>
                    </div>
                    <div>
                      <button type="button" class="btn btn-outline-warning mx-2">ویرایش</button>
                      <button type="button" class="btn btn-outline-danger">حذف</button>
                    </div>
                  </li>

                  <!-- ++++++ Collapsing Section START ++++++ -->
                  
                  <div class="collapse" id="collapse<?php echo $category['id']?>">
              <?php 
                  //LIST SUB CATEGORIES OF CURRENT CATEGORY
                  foreach($subCategories as $subCategory):
              ?>
                    <li class="list-group-item d-flex text-nowrap justify-content-between lh-sm align-items-center">
                      <div class="d-flex flex-row align-items-center">
                        <i class="fas fa-minus mx-3"></i>
                        <h6 class="my-0"><?php echo $subCategory['name'];?></h6>
                      </div>
                      <div>
                        <button type="button" class="btn btn-outline-warning btn-sm mx-2">ویرایش</button>
                        <button type="button" class="btn btn-outline-danger btn-sm">حذف</button>
                      </div>
                    </li>
              <?php
                //END OF LIST SUB CATEGORIES 
                  endforeach;
              ?>
                  </div>

                  <!-- ++++++ Collapsing Section End ++++++ -->

                  <!-- collapse example for sub-categories End -->


            <?php else: ?>
                  <li class="list-group-item d-flex text-nowrap justify-content-between lh-sm align-items-center">
                  <div>
                    <h6 class="my-0"><?php echo $category['name'] ?></h6>
                  </div>
                  <div>
                    <button type="button" class="btn btn-outline-warning mx-2">ویرایش</button>
                    <button type="button" class="btn btn-outline-danger">حذف</button>
                  </div>
                </li>
            <?php endif; ?>


        <?php endforeach; ?>

    <?php 
      else: echo 'دسته بندی ای وجود ندارد';
    ?>

    <?php endif; ?>

  </ul>

  <!-- ++++++ Listing categories End ++++++ -->

</div>


      </div>
    </main>
  </div>
</div>

    
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

  </body>
</html>