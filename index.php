<?php 
  //page controller
  $pageUi='index';
  include_once 'config.php';
?>
<!doctype html>
<html dir="rtl">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.rtl.min.css" integrity="sha384-trxYGD5BY4TyBTvU5H23FalSCYwpLA0vWEvXXGm5eytyztxb+97WzzY+IWDOSbav" crossorigin="anonymous">
    
    
    

    

    <title>فلورا</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css" integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css" integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A==" crossorigin="anonymous" />
    <link rel="stylesheet" href="assets/css/index.css">
    <!-- Fontawesome kit -->
    <script src="https://kit.fontawesome.com/2370aca281.js" crossorigin="anonymous"></script>
  </head>
  <body class="">
    <!----------------------------- headers ------------------------------------>
    <header>

        <div class="container-fluid">
          <!----------------------------- fisrt header ------------------------------------>
          <div class="row">

            <div class="d-flex flex-row justify-content-between align-items-end bg-light p-3 pb-2">
              <div class="col-md-4 ms-2">
                <a href="#"><img src="assets/images/logo/flora.png" alt="" width="200px"></a>
              </div>
              <div class="d-flex align-items-center">
              <a href="enterphn.php" class="btn btn-outline-dark rounded-pill me-2">وارد شوید<i class="fas fa-user ms-1"></i></a> 
              </a> <i class="me-2">|</i>
              <a href="cart.php"><i class="fas fa-shopping-cart cart-cart"></i></a>
              
              </div>
            </div>

          </div>
          <!----------------------------- first header ------------------------------------>

          <!----------------------------- second header ------------------------------------>
          <div class="row" style="background-color: coral;">
            <div class="p-3">categories</div>
          </div>
          <!----------------------------- second header ------------------------------------>

        </div>
    
    </header>
    <!----------------------------- headers ------------------------------------>
    <!----------------------------- carousel + category cards + products ------------------------------------>
    <main>
    
      <!-- carousel -->
      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3" class="active" aria-current="true"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <!-- <svg class="d-block w-100" width="800" height="400" aria-label="Placeholder: First slide" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#555" dy=".3em">First slide</text></svg>
            -->
            <a href="#"><img src="<?php echo $slider1->getImgUrl(); ?>" class="d-block w-100" width="100%", style="max-height:500px"  alt=""></a>
          </div>
          <div class="carousel-item">
            <a href="#"><img src="<?php echo $slider2->getImgUrl(); ?>" class="d-block w-100" width="100%", style="max-height:500px"  alt=""></a>
          </div>
          <div class="carousel-item">
            <a href="#"><img src="<?php echo $slider3->getImgUrl(); ?>" class="d-block w-100" width="100%", style="max-height:500px"  alt=""></a>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button> 
      </div>
      <!-- carousel -->

      <!-- most purchased -->
      <div class="container p-3" >
        <!-- header -->
        <div class="row p-3 border-bottom border-secondary border-3">
          <div class="col-md-10">
            <p class="h5">پرفروش ترین محصولات</p>
          </div>

        </div>
        <!-- header -->

        <!-- slider -->
        <div class="row slider" style="direction: ltr">
          
            <?php if($mostSelesProducts): ?>
              <?php foreach($mostSelesProducts as $mostSelesProduct): 
                  $mostSelesProductId=$mostSelesProduct['id'];
                  $mostSelesProductTitle=$mostSelesProduct['title'];
              ?>
              <a href="<?php echo DOMAIN."product.php?pid=$mostSelesProductId&slug=$mostSelesProductTitle"?>">
                <div class="col-md-12 p-3">
                  <div class="card product-sliding-item">
                    <img src="<?php echo $mostSelesProduct['image'] ?>" class="card-img-top" alt="<?php echo $mostSelesProduct['image_alt'] ?>">
                    <div class="card-body p-1">
                      <p class="card-title text-center mb-3" style="font-weight:bold;"><?php echo $mostSelesProduct['title'] ?></p>
                      <div class="d-flex" style="color: coral;">
                        <p class="ms-1 m-0">تومان</p>
                        <p class="m-0"><?php echo number_format($mostSelesProduct['price']) ?></p>
                      </div>
                    </div>
                  </div>
                </div>
              </a>
               <?php endforeach; ?>
            <?php else: ?>
                <p>محصولی پیدا نشد</p>
            <?php endif; ?>

            <!-- slider -->
            
        </div>
      </div>
      <!-- most purchased -->

      <?php if($indexCategories): ?>
        <?php foreach($indexCategories as $indexCategory): 
            $categoryObj=new Category($indexCategory['id']);
            $products=$categoryObj->getProducts("instock>0");
        ?>
            <!-- category 1 -->
            <div class="container p-3" >
                <!-- header -->
                <div class="row p-3 border-bottom border-secondary border-3">
                  <div class="col-md-10">
                    <p class="h5"><?php echo $categoryObj->getName(); ?></p>
                  </div>
                </div>
                <!-- header -->
                <!-- slider -->
                <div class="row slider" style="direction: ltr">
            
                    <?php foreach($products as $product):
                        $productId=$product['id'];
                        $productTitle=$product['title'];
                    ?>
                      <a href="<?php echo DOMAIN."product.php?pid=$productId&slug=$productTitle" ?>">
                        <div class="col-md-12 p-3">
                          <div class="card product-sliding-item">
                            <img src="<?php echo $product['image'] ?>" class="card-img-top" alt="<?php echo $product['image_alt']; ?>">
                            <div class="card-body p-1">
                              <p class="card-title text-center mb-3" style="font-weight:bold;"><?php echo $product['title']; ?></p>
                              <div class="d-flex" style="color: coral;">
                                <p class="ms-1 m-0">تومان</p>
                                <p class="m-0"><?php echo number_format($product['price']); ?></p>
                              </div>
                            </div>
                          </div>
                        </div>
                        </a>
                    <?php endforeach; ?>
                </div>
            </div>
         <!-- category 1 -->
        <?php endforeach ?>

      <?php else: ?>
            <p>دسته بندی خالی است</p>
      <?php endif;?>


      <!-- new products -->
      <div class="container p-3" >
        <!-- header -->
        <div class="row p-3 border-bottom border-secondary border-3">
          <div class="col-md-10">
            <p class="h5">جدید ترین محصولات</p>
          </div>

        </div>
        <!-- header -->

          <!-- slider -->
          <div class="row slider" style="direction: ltr">
            
              <?php if($latestProducts): ?>
                <?php foreach($latestProducts as $latestProduct):
                      $latestProductId=$latestProduct['id'];
                      $latestProductTitle=$latestProduct['title'];
                ?>
                <a href="<?php echo DOMAIN."product.php?pid=$latestProductId&slug=$latestProductTitle" ?>">
                  <div class="col-md-12 p-3">
                    <div class="card product-sliding-item">
                      <img src="<?php echo $latestProduct['image'] ?>" class="card-img-top" alt="<?php echo $latestProduct['image_alt'] ?>">
                      <div class="card-body p-1">
                        <p class="card-title text-center mb-3" style="font-weight:bold;"><?php echo $latestProduct['title'] ?></p>
                        <div class="d-flex" style="color: coral;">
                          <p class="ms-1 m-0">تومان</p>
                          <p class="m-0"><?php echo number_format($latestProduct['price']) ?></p>
                        </div>
                      </div>
                    </div>
                  </div>
                </a>
                <?php endforeach; ?>
              <?php else: ?>
                  <p>محصولی پیدا نشد</p>
              <?php endif; ?>

              <!-- slider -->
              
          </div>
      </div>
      <!-- new products -->
    
    </main>
    <!----------------------------- carousel + category cards + products ------------------------------------>

    <!-- footer -->
    <footer>
      <div class="container-fluid">
      <div class="row" style="background-color: grey;">
        <div class="col-md-12">footer</div>
      </div>
      </div>
      
    </footer>
    <!-- footer -->

    


    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <!-- slick carousel needed files -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js" integrity="sha512-HGOnQO9+SP1V92SrtZfjqxxtLmVzqZpjFFekvzZVWoiASSQgSr4cw9Kqd2+l8Llp4Gm0G8GIFJ4ddwZilcdb8A==" crossorigin="anonymous"></script>
    <!-- slick carousel script TEMPORARY -->
    <script type="text/javascript">
        $(document).ready(function(){
          $('.slider').slick({
            dots: true,
            infinite: false,
            speed: 300,
            slidesToShow: 7,
            slidesToScroll: 4,
            responsive: [
              {
                breakpoint: 1024,
                settings: {
                  slidesToShow: 3,
                  slidesToScroll: 3,
                  infinite: true,
                  dots: true
                }
              },
              {
                breakpoint: 600,
                settings: {
                  slidesToShow: 2,
                  slidesToScroll: 2
                }
              },
              {
                breakpoint: 480,
                settings: {
                  slidesToShow: 1,
                  slidesToScroll: 1
                }
              }
              // You can unslick at a given breakpoint now by adding:
              // settings: "unslick"
              // instead of a settings object
            ]
          });
                  });
      </script>
  </body>
</html>