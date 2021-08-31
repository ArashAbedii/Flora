-- phpMyAdmin SQL Dump
-- version 5.0.4deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 28, 2021 at 03:02 PM
-- Server version: 10.5.10-MariaDB-2
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flora`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `FName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` enum('admin','master') COLLATE utf8mb4_unicode_ci NOT NULL,
  `admined_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `FName`, `LName`, `email`, `password`, `phone`, `permission`, `admined_by`, `created_at`, `updated_at`) VALUES
(18, 'flora', 'flora', 'flora@gmail.com', '62dd97305921119d3a3dd1e70060cecb2b0da9a8', '09111111111', 'master', 1, '2021-06-25 19:57:27', '2021-06-25 19:57:27'),
(19, 'ttest', 'testy', 'test@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', '09111111112', 'admin', 1, '2021-07-27 19:58:02', '2021-07-27 19:58:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int(11) NOT NULL,
  `visibility` enum('visible','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'visible',
  `show_index` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `creator_id`, `visibility`, `show_index`, `created_at`, `updated_at`) VALUES
(3, 'گیاهان آپارتمانی', 1, 'visible', 'yes', '2021-05-14 13:51:49', '2021-05-14 13:51:49'),
(4, 'کاکتوس ها', 1, 'visible', 'yes', '2021-05-14 13:51:57', '2021-05-14 13:51:57'),
(5, 'فضای باز', 1, 'visible', 'yes', '2021-05-14 13:52:12', '2021-05-14 13:52:12'),
(6, 'هدیه', 1, 'visible', 'no', '2021-05-14 21:21:48', '2021-05-14 21:21:48'),
(12, 'نهال', 1, 'visible', 'no', '2021-06-23 08:13:46', '2021-06-23 08:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id`, `product_id`, `category_id`) VALUES
(5, 5, 3),
(7, 7, 5),
(9, 9, 5),
(10, 10, 3),
(11, 11, 4),
(12, 12, 5),
(13, 13, 3),
(14, 14, 3),
(15, 15, 3),
(26, 30, 3),
(27, 31, 3),
(28, 32, 4),
(29, 33, 4),
(30, 34, 4),
(31, 35, 4),
(32, 36, 3),
(33, 37, 12),
(34, 38, 12),
(35, 39, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `payment_method_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `sum_price` double NOT NULL,
  `postal_price` double NOT NULL,
  `status` enum('doing','done','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_id` int(11) NOT NULL,
  `order_date` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_time` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `code`, `customer_id`, `customer_role`, `payment_method_id`, `shipping_id`, `sum_price`, `postal_price`, `status`, `address_id`, `order_date`, `order_time`, `created_at`, `updated_at`) VALUES
(52, 3872, 18, 'admin', 1, 1, 498750, 0, 'canceled', 21, '', '', '2021-06-25 20:08:21', '2021-06-25 20:08:21'),
(53, 3281, 18, 'admin', 1, 2, 28000, 6000, 'canceled', 22, 'دوشنبه ۱۴۰۰/۰۴/۰۷', '13 تا 24 (بعد از ظهر)', '2021-06-25 20:09:10', '2021-06-25 20:09:10'),
(54, 6025, 27, 'user', 1, 2, 228250, 0, 'done', 23, 'یکشنبه ۱۴۰۰/۰۴/۰۶', '8 تا 12 (صبح)', '2021-06-25 20:13:28', '2021-06-25 20:13:28'),
(55, 3124, 28, 'user', 1, 2, 346250, 0, 'doing', 20, 'جمعه ۱۴۰۰/۰۵/۰۸', '13 تا 24 (بعد از ظهر)', '2021-07-27 19:47:53', '2021-07-27 19:47:53'),
(56, 5113, 18, 'admin', 1, 1, 500000, 0, 'doing', 22, '', '', '2021-07-28 14:48:14', '2021-07-28 14:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ordered_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `sum_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `ordered_price`, `quantity`, `sum_price`) VALUES
(59, 52, 15, 175000, 3, 498750),
(60, 53, 10, 22000, 1, 22000),
(61, 54, 36, 20000, 2, 40000),
(62, 54, 10, 22000, 1, 22000),
(63, 54, 15, 175000, 1, 166250),
(64, 55, 37, 180000, 1, 180000),
(65, 55, 15, 175000, 1, 166250),
(66, 56, 12, 250000, 2, 500000);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('disable','active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `status`) VALUES
(1, 'پرداخت در محل', 'active'),
(2, 'پرداخت آنلاین', 'disable');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_alt` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `discount` int(11) DEFAULT 0,
  `sales` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` enum('hide','visible') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'visible',
  `instock` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `image`, `image_alt`, `price`, `discount`, `sales`, `description`, `visibility`, `instock`, `creator_id`, `created_at`, `updated_at`) VALUES
(5, 'رشته مروارید', 'upload/images/product-sample-coral.jpg', 'رشته مروارید', 47000, 0, 0, 'گیاه رشته مروارید (String of Pearls) چه گیاه خانگی بی‌نظیری است! مطمئنا از زیبایی شاخه‌های ظریف و مهره‌های گِرد و خوش فرمی که از آن آویزان شده است به وجد می‌آیید. ترکیب گیاه Senecio rowleyanus برای آویز شدن از سقف یا قرار گرفتن بر روی استند بسیار مناسب است.                                                           ', 'visible', 10, 8, '2021-05-14 19:56:48', '2021-05-14 19:56:48'),
(7, 'درخت موز', 'upload/images/product-sample-yellow.jpg', 'درخت موز', 55000, 0, 0, 'اگر شما به دنبال یک کاکتوسی هستید تا فضای خانه‌تان را تغییر دهد و خیلی راحت و بی‌دردسر رشد کند این گیاه همان چیزی هست که شما می‌خواهید. کاکتوس گوش خرگوشی برای رشد به نور زیاد و آبدهی منظم نیاز دارد. این گیاه را در یک گلدان سنگی با شن‌ها و سنگ‌های رنگی تصور کنید، فوق العاده می‌شود.                      ', 'visible', 22, 1, '2021-05-14 21:03:58', '2021-05-14 21:03:58'),
(9, 'کاج نوئل', 'upload/images/product-sample-seablue.jpg', 'کاج نوئل', 150000, 0, 0, 'این گیاه میوه هم می‌دهد! میوه‌ی آن شبیه به آناناس است و از زمان جوانه زدن تا رسیدن، حدود یکسال زمان نیاز دارد. این گیاه گرمسیری با ظاهر زیبایش، خانه شما را بسیار جذاب و مدرن جلوه می‌دهد.                      ', 'visible', 39, 1, '2021-05-14 21:06:01', '2021-05-14 21:06:01'),
(10, 'پتوس', 'upload/images/product-sample.jpg', 'پتوس', 22000, 0, 0, 'رای طراحی دکور داخلی یک گزینه‌ی ایده‌آل است. با انتخاب مناسب گلدان، می‌توان سرعت رشد و قد کشیدن فیکوس لیراتا را تحت کنترل قرار داد. درختچه‌ی فیوکوس نور غیر مستقیم را دوست دارد.                      ', 'visible', 25, 1, '2021-05-14 21:06:55', '2021-05-14 21:06:55'),
(11, 'کراوسولا', 'upload/images/product-sample-purple.jpg', 'کراسولا', 17000, 0, 0, 'یکی دیگر از معروف ترین انواع ساکولنت مخملی کراسولا است. این ساکولنت به دلیل نگهداری آسان هم مناسب داخل منزل و هم مناسب بالکن و فضای آزاد است. تکثیر و هرس کراسولا برای رسیدن به فرم دلخواه به راحتی انجام می‌شود  که یکی دیگر از مزیت های آن است. کراسولا برگ های گوشتی و ساقه های ضخیم دارد که با قرار دادن                       ', 'visible', 60, 1, '2021-05-14 21:08:29', '2021-05-14 21:08:29'),
(12, 'فیکوس', 'upload/images/product-sample-seablue.jpg', 'فیکوس', 250000, 0, 0, 'گیاه فیکوس (Ficous elastic) با قرار گرفتن در معرض نور غیر مستقیم، خاک مرطوب و هوای مرطوب یک درختچه‌ی با وقار و باشکوه خواهد بود. برگ‌های براق آن با قرار گرفتن در معرض نور کافی، خیلی عالی خودنمایی می‌کند. درختچه Rubber برای سالن‌هایی با سقف بلند مناسب است                      ', 'visible', 24, 1, '2021-05-14 21:18:29', '2021-05-14 21:18:29'),
(13, 'کالاتیا', 'upload/images/product-sample-purple.jpg', 'کالاتیا', 55000, 0, 0, 'رگه‌های سفید روی برگ‌های سبز شفاف گیاه کالاتیا اوربیفولیا، مانند یک نقاشی زنده خودنمایی می‌کند. گیاه کالاتیا اوربیفولیا در مقایسه با سایر گیاهان کمی به وسواس و دقت نیاز دارد                                                                  ', 'visible', 0, 8, '2021-05-14 21:19:17', '2021-05-14 21:19:17'),
(14, 'استرلیتزیا', 'upload/images/7568product-sample-coral.jpg', 'استرلیتزیا', 60000, 0, 0, 'گیاه پرنده بهشتی یا (Strelitzia Nicolai) فقط با اسمش چقدر به جان و روح آدم می‌نشیند چه برسد به ظاهر زیبایش! درختچه‌ی استریلیزیا در شرایط عالی، تا بیش از ۶ متر رشد می‌کند و نگهداشتن آن را در خانه‌ با چالش روبه رو می‌سازد. اگرچه بیشتر گیاهان با نور مستقیم خورشید                                                                                                                                                                                                                                                                                                                    ', 'visible', 78, 8, '2021-05-14 21:21:26', '2021-05-14 21:21:26'),
(15, 'باکس رز سفید', 'upload/images/4185product-sample-yellow.jpg', 'باکس رز سفید', 175000, 5, 0, 'همانند بقیه ساکولنت ها، جنس سدوم نیز آب را داخل برگ هایش ذخیره می‌کند. برگ ها به صورت خوشه ای در اطراف یک ساقه ضخیم رشد می‌کنند. در حالی که بعضی از برگ ها کاملا براق هستند، سطح بقیه برگ ها با پرز پوشیده شده اند. انواع مختلفی از نظر اندازه و ظاهر در این جنس ساکولنتی وجود دارد.                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 'visible', 100, 8, '2021-05-14 21:23:04', '2021-05-14 21:23:04'),
(30, 'بونسای جنسینگ', 'upload/images/5640product-sample-seablue.jpg', 'بونسای جنسینگ', 499000, 0, 0, 'یاه فیکوس جنسینگ که به آن بونسای جنسینگ هم گفته می شود، معروفترین نوع بونسای در ایران هست. گیاهی با ریشه های ضخیم و مستحکم که عمر طولانی دارد.\r\nاین گیاه نام های دیگری نیز دارند: فیکوس تایوانی ، انجیر بانیان و انجیر هندی\r\n\r\nاین گیاه همراه با گلدانی که در عکس مشاهده می کنید ارسال خواهد گردید.', 'visible', 10, 11, '2021-06-23 08:20:10', '2021-06-23 08:20:10'),
(31, 'بونسای دارک', 'upload/images/4218product-sample-yellow.jpg', 'بونسای دارک', 248000, 0, 0, 'بونسای این نماد زیبای طبیعت امروزه در بسیاری از مکان‌ها دیده می‌شود. این درختچه کوچک و زیبا نمونه‌ای کوچک و مینیاتوری از درختان است. بهترین مکان برای نگهداری بونسای می‌تواند پشت پنجره یا در مقابل نور غیرمستقیم آفتاب باشد. اگر نور کافی به بونسای نرسد خیلی زود برگ‌هایش شروع به ریختن خواهند کرد. این گیاه در گلدان به آبیاری زیادی نیاز ندارد و باید به شکل منظم و متوسط آبیاری شود. اما در تراریوم شرایط گیاه به گونه‌ای تنظیم شده است که نیازی به آبیاری ندارد.', 'visible', 5, 11, '2021-06-23 08:24:00', '2021-06-23 08:24:00'),
(32, 'دیش گاردن', 'upload/images/6826product-sample-coral.jpg', 'دیش گاردن', 100000, 0, 0, 'نیاز آبی کاکتوس‌ ها و ساکولنت ها در مقایسه با دیگر گیاهان کمتر بوده و با توجه به تغییر می‌یابد. هر چه هوا آفتابی‌تر و رطوبت کمتر باشد، نیاز آبی این گیاهان بیشتر می‌شود. به تاخیر افتادن زمان آبیاری دشواری چندانی برای گیاه ﭘدید نمی‌آورد. در فصل های بهار و تابستان هرگاه مشاهده کردید که خاک گیاه کاملا خشک شده است، آن را آبیاری کنید؛ اما در فصل زمستان و اواخر پاییز چون زمان استراحت گیاه است، آبیاری را کاهش دهید.\r\nولی آبیاری زیاده از حد گیاه ﭘوسیدگی آن را درﭘﯽ دارد.', 'visible', 20, 11, '2021-06-23 08:26:39', '2021-06-23 08:26:39'),
(33, 'گاستریا', 'upload/images/7298product-sample.jpg', 'گاستریا', 120000, 0, 0, 'گاستریا –  از کلمه gaster – به معناي شکم اقتباس شده و اشاره به حالت ورم کرده ي برگ های گیاه دارد.\r\n\r\nاین ساکولنت پاجوش هاي بسیاری تولید می‌کند تا جاییکه مجموعه آن‌ها بوته‌ای به گستردگی ۱ متر مربع تشکیل می‌دهد.\r\n\r\nنام دیگر گاستریا به علت شباهت گیاه به زبان گاو، به ساکولنت زبان گاوی هم معروف است. گل های آن به رنگ قرمز و لوله ای شکل ظاهر می‌شود. گاستریا معمولاً در فصل‌های خنک رشد می‌کند. و در بهار و پاییز گل می‌دهد. میوه این گیاه بصورت کپسول هایی به طول ۱۵ تا ۲۳ میلی متر و قطر ۷ میلی متر هستند.', 'visible', 33, 11, '2021-06-23 08:27:42', '2021-06-23 08:27:42'),
(34, 'آگاو ابلق', 'upload/images/2635product-sample-pink.jpg', 'آگاو ابلق', 60000, 20, 0, 'برای مشاهده سایز دقیق گلدان ها به صفحه راهنمای سایز گلدان مراجعه نمائید.\r\n\r\nارسال این محصول از طریق باربری به سراسر ایران می‌باشد.\r\n\r\nبرای آشنایی با گونه های مختلف کاکتوس و ساکولنت ها به وب سایت مرجع کاکتوس پدیا رجوع نمائید.\r\n\r\nدر هر شهری که هستید می‌توانید اقدام به سفارش پک میکس کاکتوس و ساکولنت بذری 25 عددی از فروشگاه کاکتی استور نمائید.                      ', 'visible', 5, 11, '2021-06-23 08:29:09', '2021-06-23 08:29:09'),
(35, 'اچوریا', 'upload/images/1712product-sample-yellow.jpg', 'اچوریا', 99000, 0, 0, 'اچوریا که با نام‌های آشوریا و ساق عروس هم شناخته می‌شود یک گونه از حدود 150 گونهٔ ساکولنت از خانواده گل‌نازیان است.\r\nاین گیاه، بومی مناطق نیمه بیابانی مکزیک، آمریکای مرکزی و آمریکای جنوبی است.\r\nاچوریا تاکنون با گیاهان مختلفی پیوند خورده است به همین خاطر علاوه بر گونه اصلی، صدها گونه پیوند خورده دیگر در رنگ‌ها، شکل‌ها و اندازه‌های مختلف دارد که اغلب آن‌ها گل دارند.\r\nنام این گیاه به افتخار گیاه‌شناس مکزیکی قرن هجدهم، آتاناسیو اچوریا وای گودوی انتخاب شده است.', 'visible', 7, 11, '2021-06-23 08:31:23', '2021-06-23 08:31:23'),
(36, 'آدنیوم', 'upload/images/6451product-sample-purple.jpg', 'آدنیوم', 20000, 0, 0, 'گیاه آدنیوم ( Adenium ) بومی شرق و جنوب آفریقا است و تایلند بزرگترین پرورش دهنده این گل در کل دنیا می‌باشد.\r\n\r\nاین گل نیز مانند دیگر اعضای خانواده خود سمی می‌باشد و باید دور از دسترس کودکان و حیوانات خانگی قرار دهید. این گل آپارتمانی زیبا دارای ساقه های گوشتی با ویژگی ذخیره کردن آب درون خود است و برگ های کشیده و سبز آن حتی بدون گل نیز خودنمایی کرده و زیبایی خود را حفظ می‌کنند. گل های درشت و شیپوری مانند آن در طیف رنگهای صورتی و قرمز در اواخر زمستان می‌رویند و از بذر آنها می‌توان برای تکثیر این گل استفاده کرد. ساقه ضخیم و متورم آدنیوم را می‌توان با کمی دقت و تجربه به یک بونسای زیبا تبدیل کرد و یا در ابتدا آن را برای تبدیل شدن به بونسای پرورش داد.', 'visible', 70, 11, '2021-06-23 08:33:41', '2021-06-23 08:33:41'),
(37, 'فیسالیس', 'upload/images/1035product-sample-coral.jpg', 'فیسالیس', 180000, 0, 0, 'میوه فیسالیس (Physalis) دارای بافتی همچون گوجه فرنگی و ترکیبی از طعم میوه های توت فرنگی ، گیلاس ، گوجه فرنگی و کیوی و آناناس است. این میوه از رده گیاهان تک لپه ای و از رسته بادنجان سانان است که به دلیل قرار گرفتن در لفاف کاغذی شکل فاقد هرگونه آلودگی و عوامل بیماری زا است و بدون نگهداری در یخچال بیش از 10 روز ماندگاری دارد و در صورت نگهداری در یخچال حدود 2 ماه مدت زمان ماندگاری این میوه نیز افزایش می یابد.', 'visible', 18, 11, '2021-06-23 08:39:19', '2021-06-23 08:39:19'),
(38, 'ماکادمیا', 'upload/images/7509product-sample-yellow.jpg', 'ماکادمیا', 450000, 0, 0, 'ماکادمیا درختی است که میوه آن گرانترین و مرغوب ترین خشکبار جهان به شمار می رود .این گیاه بومی استرالیا است .در جنگلهای بارانی و در مکانهای مرطوب نزدیک نهر ها رشد خوبی دارد .آفتاب کامل با اندکی سایه برای گیاه مناسب است و عملکرد مغز را افزایش می دهد .اما اگر کشت تجاری آن مطرح نباشد سایه را به خوبی می تواند تحمل کند .گیاه به خشکی مقاوم است .باد ,سرمای شدید و شوری را نمی تواند بپذیرد.همچنین نیازی به خاک حاصلخیز ندارد .در هر ترکیب خاک از سبک تا سنگین اما با زهکشی خوب می تواند رشد کند .', 'visible', 15, 11, '2021-06-23 08:40:49', '2021-06-23 08:40:49'),
(39, 'برگ بیدی', 'upload/images/4467product-sample-coral.jpg', 'برگ بیدی', 50000, 0, 0, 'گلدان برگ بیدی آبکشت گیاهی با کیفیت و ماندگاری بالاست به گونه‌ای که در شرایط نه چندان مناسب نیز قابل نگهداری است. اگر در محیط زندگی خود شرایط ایده آل جهت نگهداری گیاهان مختلف را ندارید و در جستجوی گیاهان بادوام هستید، این محصول را به شما پیشنهاد می‌کنیم.                      ', 'visible', 12, 8, '2021-06-23 08:43:56', '2021-06-23 08:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `shipping_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('disable','active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `shipping_type`, `description`, `status`, `price`) VALUES
(1, 'ارسال فوری', 'تحویل در 4 الی 24 ساعت', 'active', 15000),
(2, 'ارسال عادی', 'تحویل در 7 روز کاری', 'active', 6000);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image_url`, `creator_id`, `created_at`, `updated_at`) VALUES
(1, 'assets/images/slider/26178574slider-s1.jpg', 1, '2021-06-12 07:02:03', '2021-06-12 07:02:03'),
(2, 'assets/images/slider/7367slider-s3.jpg', 1, '2021-06-12 07:02:03', '2021-06-12 07:02:03'),
(3, 'assets/images/slider/3206slider-s2.jpg', 1, '2021-06-12 07:02:03', '2021-06-12 07:02:03');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory_product`
--

CREATE TABLE `subcategory_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategory_product`
--

INSERT INTO `subcategory_product` (`id`, `product_id`, `subcategory_id`) VALUES
(5, 5, 6),
(7, 7, 4),
(9, 9, 5),
(10, 10, 6),
(11, 11, 3),
(12, 12, 5),
(13, 13, 6),
(14, 14, 7),
(27, 15, 6),
(28, 30, 15),
(29, 31, 15),
(30, 32, 3),
(31, 33, 3),
(32, 34, 3),
(33, 35, 3),
(34, 37, 16),
(35, 38, 16),
(36, 39, 7);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` enum('visible','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'visible',
  `creator_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `visibility`, `creator_id`, `created_at`, `updated_at`) VALUES
(3, 4, 'ساکولنت', 'visible', 1, '2021-05-14 14:34:08', '2021-05-14 14:34:08'),
(4, 5, 'درخت میوه', 'visible', 1, '2021-05-14 19:53:33', '2021-05-14 19:53:33'),
(5, 5, 'درختچه', 'visible', 1, '2021-05-14 19:54:10', '2021-05-14 19:54:10'),
(6, 3, 'آویز', 'visible', 1, '2021-05-14 19:55:57', '2021-05-14 19:55:57'),
(7, 3, 'گلدانی', 'visible', 1, '2021-05-14 21:20:26', '2021-05-14 21:20:26'),
(8, 6, 'باکس گل', 'visible', 1, '2021-05-14 21:21:56', '2021-05-14 21:21:56'),
(15, 3, 'بونسای', 'visible', 1, '2021-06-23 08:11:57', '2021-06-23 08:11:57'),
(16, 12, 'استوایی', 'visible', 1, '2021-06-23 08:14:11', '2021-06-23 08:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `FName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LName` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_varified` enum('none','done') COLLATE utf8mb4_unicode_ci NOT NULL,
  `register_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `FName`, `LName`, `phone`, `password`, `email`, `is_varified`, `register_code`, `created_at`, `updated_at`) VALUES
(27, 'user2', 'test', '09112235687', NULL, '', 'done', 'expired', '2021-06-25 20:11:22', '2021-06-25 20:11:22'),
(28, 'arash', 'abedi1', '09215919027', NULL, NULL, 'done', 'expired', '2021-07-27 19:44:08', '2021-07-27 19:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `users_address`
--

CREATE TABLE `users_address` (
  `id` int(11) NOT NULL,
  `user_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_explain` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_address`
--

INSERT INTO `users_address` (`id`, `user_phone`, `address`, `unit`, `floor`, `postal_code`, `title`, `address_explain`, `created_at`, `updated_at`) VALUES
(11, '09360795096', 'مازندران، قائم شهر، خزر ۱۵ شهید باهنر، خزر 13، شاکری 2', '9', '4', '8512569', 'خانه2', 'ok ', '2021-05-31 18:25:19', '2021-05-31 18:25:19'),
(20, '09215919027', 'مازندران، قائم شهر، یاس ۶ مبارزان', '6', '4', '544444', 'خانه', '', '2021-06-20 15:52:48', '2021-06-20 15:52:48'),
(21, '09111111111', 'مازندران، قائم شهر، یاس ۵، مجتمع پزشکی و تجاری', '2', '3', '215689745', 'خانه', '', '2021-06-25 20:08:07', '2021-06-25 20:08:07'),
(22, '09111111111', 'مازندران، قائم شهر، مولوی ۱، آزادی، تاکسی سرویس ایثار گشت', '4', '3', '12569875', 'اداره', '', '2021-06-25 20:08:53', '2021-06-25 20:08:53'),
(23, '09112235687', 'مازندران، قائم شهر، خیابان امام خمینی، تلار ۹ شهید مستوری بامداد، بامداد', '3', '2', '458687423', 'خانه', '', '2021-06-25 20:13:16', '2021-06-25 20:13:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory_product`
--
ALTER TABLE `subcategory_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_address`
--
ALTER TABLE `users_address`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `subcategory_product`
--
ALTER TABLE `subcategory_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users_address`
--
ALTER TABLE `users_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
