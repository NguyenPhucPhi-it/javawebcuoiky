-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2026 at 09:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `javawebcuoiky`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand_name`) VALUES
(1, 'casio'),
(2, 'Smart Watch'),
(3, 'BENYAR'),
(4, 'Carnival'),
(6, 'heheh');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `created_at`, `id_order`, `id_product`, `id_user`, `message`, `rating`, `status`) VALUES
(1, '2026-06-11 20:37:42.000000', 1, 9, 2, 'sp tot', 5, 1),
(2, '2026-06-12 15:57:10.000000', 7, 12, 2, 'ok', 4, 1),
(3, '2026-06-16 16:46:27.000000', 1, 8, 2, 'qua ok', 5, 1),
(4, '2026-06-18 14:33:05.000000', 9, 1, 2, 'sản phầm quá chất lượng', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `receiver_email` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `address`, `id_user`, `order_date`, `receiver_email`, `receiver_name`, `receiver_phone`, `status`) VALUES
(1, 'nha 11,xom An Lac, tinh Dong Nai', 2, '2026-06-16 08:25:31', 'anh@gmail.com', 'Anh', '0328859476', 'Đang giao'),
(2, 'xom 3, xa Van Tu, tinh Nghe An', 3, '2026-06-16 14:22:22', 'ly@gmail.com', 'Ly', '0356654345', 'Chờ xác nhận'),
(3, 'xom 12, huyen Ky Anh, tinh Vung Tau', 3, '2026-06-16 14:24:49', 'ly@gmail.com', 'Ly', '0328859476', 'Chờ xác nhận'),
(4, 'số 113, Ngũ Hành Sơn, Đà Nẵng', 2, '2026-06-16 20:46:55', 'anh@gmail.com', 'Anh', '0567748576', 'Chờ xác nhận'),
(5, 'số 113, Ngũ Hành Sơn, Đà Nẵng', 2, '2026-06-16 20:48:39', 'anh@gmail.com', 'Anh', '098754676', 'Chờ xác nhận'),
(6, 'số 114, Hà Nội', 2, '2026-06-16 20:50:45', 'anh@gmail.com', 'Anh', '0356654345', 'Đã hủy'),
(7, 'xom 11, van tu, nghe an', 2, '2026-06-16 15:55:36', 'anh@gmail.com', 'Anh', '035223067', 'Chờ xác nhận'),
(8, 'xom12, xa Tan An, Tinh Ha Tinh', 2, '2026-06-16 16:31:52', 'anh@gmail.com', 'Anh', '0328859476', 'Chờ xác nhận'),
(9, 'so 112, Dien Ban, Quang Nam', 2, '2026-06-16 16:32:29', 'anh@gmail.com', 'Anh', '0356654345', 'Chờ xác nhận'),
(10, 'xom 13, xa cong thanh, tinh nghe an', 2, '2026-06-16 22:29:49', 'anh@gmail.com', 'Anh', '0567748576', 'Chờ xác nhận'),
(11, 'xóm 1 , cong thanh, yen thanh, nghe an', 2, '2026-06-17 07:46:48', 'anh@gmail.com', 'Anh', '0328859476', 'Chờ xác nhận'),
(12, 'nhà 11, tỉnh Quảng Nam', 2, '2026-06-18 14:32:26', 'anh@gmail.com', 'Anh', '0356654345', 'Chờ xác nhận');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `discount` double NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `shipping_fee` double NOT NULL,
  `unit_price` double NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `discount`, `id_order`, `id_product`, `quantity`, `shipping_fee`, `unit_price`, `status`) VALUES
(1, 0, 1, 8, 2, 0, 1234567890, 'Hoàn thành'),
(2, 0, 1, 6, 1, 0, 123456789, 'Hoàn thành'),
(3, 0, 1, 9, 2, 0, 1234567879, 'Hoàn thành'),
(4, 0, 1, 12, 1, 0, 174000, 'Đã hủy'),
(5, 0, 1, 1, 2, 0, 869000, 'Đã xác nhận'),
(6, 0, 2, 12, 1, 0, 174000, 'Hoàn thành'),
(7, 0, 3, 2, 3, 0, 3000000, 'Hoàn thành'),
(8, 0, 4, 1, 1, 0, 869000, 'Chờ xác nhận'),
(9, 0, 4, 4, 2, 0, 15900000, 'Chờ xác nhận'),
(10, 0, 4, 7, 1, 0, 1234567890, 'Chờ xác nhận'),
(11, 0, 5, 1, 1, 0, 869000, 'Chờ xác nhận'),
(12, 0, 5, 4, 2, 0, 15900000, 'Hoàn thành'),
(13, 0, 5, 7, 1, 0, 1234567890, 'Hoàn thành'),
(14, 0, 6, 2, 1, 0, 3000000, 'Hoàn thành'),
(15, 0, 7, 12, 1, 0, 174000, 'Hoàn thành'),
(16, 0, 7, 2, 1, 0, 3000000, 'Chờ xác nhận'),
(17, 0, 8, 12, 1, 0, 174000, 'Chờ xác nhận'),
(18, 0, 8, 8, 1, 0, 1000000, 'Hoàn thành'),
(19, 0, 8, 6, 1, 0, 500000, 'Hoàn thành'),
(20, 0, 9, 1, 1, 0, 869000, 'Hoàn thành'),
(21, 0, 10, 1, 1, 0, 869000, 'Đang giao'),
(22, 0, 10, 2, 1, 0, 3000000, 'Đã hủy'),
(23, 0, 11, 7, 1, 0, 2000000, 'Chờ xác nhận'),
(24, 0, 12, 7, 1, 0, 2000000, 'Hoàn thành');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `payment_date` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `amount`, `created_at`, `id_order`, `note`, `payment_date`, `payment_method`, `payment_status`, `transaction_id`) VALUES
(1, 1267236890, '2026-06-10 20:48:39', 5, '', '2026-06-10 20:48:39', 'COD', 'Chờ thu tiền', 'TXN-5-1781099319301'),
(2, 3000000, '2026-06-10 20:50:45', 6, '', '2026-06-10 20:50:45', 'COD', 'Chờ thu tiền', 'TXN-6-1781099445044'),
(3, 3174000, '2026-06-12 15:55:36', 7, '', '2026-06-12 15:55:36', 'COD', 'Chờ thu tiền', 'TXN-7-1781254536898'),
(4, 1674000, '2026-06-16 16:31:52', 8, '', '2026-06-16 16:31:52', 'COD', 'Chờ thu tiền', 'TXN-8-1781602312194'),
(5, 869000, '2026-06-16 16:32:29', 9, '', '2026-06-16 16:32:29', 'COD', 'Chờ thu tiền', 'TXN-9-1781602349197'),
(6, 3869000, '2026-06-16 22:29:49', 10, '', '2026-06-16 22:29:49', 'COD', 'Chờ thu tiền', 'TXN-10-1781623789455'),
(7, 2000000, '2026-06-17 07:46:48', 11, '', '2026-06-17 07:46:48', 'COD', 'Chờ thu tiền', 'TXN-11-1781657208106'),
(8, 2000000, '2026-06-18 14:32:26', 12, '', '2026-06-18 14:32:26', 'COD', 'Chờ thu tiền', 'TXN-12-1781767946196');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `content`, `created_at`, `image`, `status`, `title`) VALUES
(1, 'MỤC LỤC\r\n\r\n› Cosmo King 797 G-DB-541 – Thiết kế “Homage” Presidential với layout Day-Date trứ danh\r\n\r\n› Giải mã sức hút của Titoni Cosmo King 797 G-DB-541\r\n\r\n1. Bộ máy ETA 2834-2 Thụy Sỹ bền bỉ chuẩn Swiss Movt\r\n\r\n2. Kính Sapphire nguyên khối phủ AR chống chói 2 mặt\r\n\r\n3. Dây đeo “King Bracelet” 5 mắt xích – Linh hoạt, thoải mái và sang trọng\r\n\r\n4. Khả năng chống nước 100m (10ATM) – An tâm trong các hoạt động thường nhật\r\n\r\n5. Cọc số đính đá – Phong thủy và thẩm mỹ Á Đông trong một chiếc đồng hồ\r\n\r\n› Lịch sử thương hiệu Titoni – Hơn 106 năm độc lập và triết lý độc đáo\r\n\r\n› Titoni Cosmo King 797 G-DB-541 – Trải nghiệm mua sắm chuẩn Thụy Sỹ với chính sách độc quyền “Hải Triều RED Guarantee”\r\n\r\nCosmo King 797 G-DB-541 – Thiết kế “Homage” Presidential với layout Day-Date trứ danh\r\nNăm 1956, giữa thế kỷ 20, Rolex đã giới thiệu Day-Date – Chiếc đồng hồ đeo tay chronometer tự động đầu tiên trên thế giới hiển thị đầy đủ cả ngày trong tháng và thứ trong tuần.\r\n\r\nVới tính năng đột phá và thiết kế vỏ Oyster trứ danh, ngay lập tức trở thành lựa chọn hàng đầu của các nguyên thủ quốc gia, nhà lãnh đạo và những nhân vật có tầm ảnh hưởng toàn cầu.\r\n\r\nTừ đó, biệt danh huyền thoại “The President’s Watch” ra đời, định hình nên một nguyên mẫu vĩnh cửu cho quyền lực và sự thành đạt.\r\n\r\nGần 7 thập kỷ sau, Titoni kế thừa và tái hiện lại ADN của phong cách “Presidential” một cách đầy tinh tế qua hai chi tiết đặc trưng. Tôn vinh di sản, thể hiện sự am hiểu sâu sắc các giá trị kinh điển từ một nhà sản xuất Thụy Sỹ độc lập lâu đời.\r\n\r\nTitoni 797 G-DB-541 - ảnh 1\r\n\r\nChú thích: Đồng hồ “homage” là thuật ngữ chỉ những chiếc đồng hồ lấy cảm hứng và tôn vinh một thiết kế huyền thoại, nhưng vẫn giữ nguyên tên thương hiệu và bản sắc riêng. Điều này hoàn toàn khác biệt với đồng hồ giả mạo sao chép bất hợp pháp cả logo và tên gọi.\r\n\r\nĐầu tiên là vành bezel khía. Vốn có nguồn gốc chức năng để đảm bảo chống nước cho vỏ, chi tiết này nay đã trở thành một biểu tượng thẩm mỹ, tạo ra hiệu ứng ánh sáng đa chiều đầy cuốn hút mỗi khi cổ tay chuyển động.\r\n\r\nThứ hai, và cũng là linh hồn của thiết kế, là bố cục lịch Day-Date. Cửa sổ lịch Thứ dạng vòng cung ở góc 12 giờ không chỉ để xem thông tin, mà còn gợi lên hình ảnh một chiếc vương miện – Liên tưởng ý nhị đến tên gọi “Cosmo King”.\r\n\r\nBố cục này được hoàn thiện bởi ô lịch Ngày ở góc 3 giờ, phóng đại qua thấu kính cyclops để tăng cường sự rõ nét.\r\n\r\nGiải mã sức hút của Titoni Cosmo King 797 G-DB-541\r\nKiểu dáng kinh điển dễ dàng liên tưởng biểu tượng Rolex Day-Date, Titoni 797 G-DB-541 mang đến sự lựa chọn hấp dẫn hơn nhờ mức giá chỉ bằng 1/10 của siêu phẩm Rolex.\r\n\r\n1. Bộ máy ETA 2834-2 Thụy Sỹ bền bỉ chuẩn Swiss Movt\r\nBên trong Titoni Cosmo King 797 G-DB-541 là cỗ máy tự động ETA 2834-2 – khẳng định triết lý về sự bền bỉ và giá trị cốt lõi của thương hiệu.\r\n\r\nTrong ngành chế tác Thụy Sỹ, ETA, một thành viên của Swatch Group, là nhà sản xuất bộ máy lừng danh. Model 2834-2 là một biến thể từ nền tảng huyền thoại được giới chuyên môn toàn cầu mệnh danh là cỗ máy ngựa thồ.\r\n\r\nTitoni Cosmo King 797 G-DB-541 ảnh 2\r\n\r\nDanh xưng này tôn vinh ba đặc tính vàng: độ bền bỉ, khả năng vận hành chính xác và ổn định qua nhiều năm, cùng sự phổ biến giúp việc bảo dưỡng trở nên dễ dàng.\r\n\r\nTần số dao động cao 28,800 vph là một thông số nói lên đẳng cấp của bộ máy này.\r\n\r\nTạo ra chuyển động lướt mượt mà gần như tuyệt đối cho kim giây, đặc điểm của đồng hồ cơ cao cấp mà bạn có thể cảm nhận bằng mắt thường.\r\n\r\nKhi đặt lên bàn cân với các đối thủ cùng tầm giá như Tissot hay một số mẫu Longines, sự khác biệt trong triết lý lựa chọn bộ máy của Titoni trở nên rõ ràng.\r\n\r\nCác thương hiệu này thường sử dụng những bộ máy hiện đại như Powermatic 80 hay Caliber L888, vốn có ưu điểm vượt trội về mức dự trữ năng lượng (lên đến 72-80 giờ). Để đạt được điều này, nhà sản xuất đã giảm tần số dao động xuống còn 21,600 vph.\r\n\r\nTitoni Cosmo King 797 G-DB-541 ảnh 3\r\n\r\nNgược lại, Titoni với ETA 2834-2 là một lựa chọn mang tính thuần túy và truyền thống hơn. Thương hiệu ưu tiên giữ lại tần số dao động cao 28,800 vph, chấp nhận mức dự trữ năng lượng tiêu chuẩn khoảng 38-42 giờ.\r\n\r\nĐối với những người am hiểu và trân trọng giá trị cơ khí truyền thống, ETA 2834-2 chính là một máy chuẩn Swiss Movt Thụy Sỹ, một bảo chứng vàng cho sự bền bỉ và đẳng cấp.\r\n\r\n2. Kính Sapphire nguyên khối phủ AR chống chói 2 mặt\r\nTitoni trang bị cho Cosmo King 797 G-DB-541 kính sapphire nguyên khối, một tiêu chuẩn bắt buộc trong đồng hồ cao cấp.\r\n\r\nVật liệu này có độ cứng đạt 9/10 trên thang Mohs, chỉ đứng sau kim cương (10/10), vượt xa kính khoáng thông thường (5-6/10).\r\n\r\nVới khả năng chống trầy xước vượt trội, kính sapphire giữ cho mặt số luôn trong trẻo và mới mẻ dù trải qua nhiều năm sử dụng.\r\n\r\nTitoni 797 G-DB-541 - ảnh 4\r\n\r\nĐiểm khác biệt lớn nhất của Titoni là việc phủ lớp chống phản chiếu (AR) trên cả hai mặt kính.\r\n\r\nLớp phủ AR này là một màng quang học siêu mỏng, nhiều tầng, giúp loại bỏ tới 99% ánh sáng phản chiếu trên bề mặt kính.\r\n\r\nKhi nhìn vào đồng hồ dưới ánh sáng mạnh hoặc đèn điện, lớp phủ này cho cảm giác như không có kính.\r\n\r\nGiúp bạn chiêm ngưỡng trọn vẹn vẻ đẹp của mặt số mà không bị bất kỳ sự cản trở nào từ ánh sáng phản chiếu.\r\n\r\nYouTube video\r\nTừ Tissot PRX Powermatic 80 đến các dòng Mido Baroncelli hay thậm chí một số mẫu của Longines, chúng ta sẽ thấy giải pháp phổ biến là chỉ phủ AR ở mặt trong của kính.\r\n\r\nĐây là một lựa chọn hoàn toàn hợp lý, vừa giúp tối ưu chi phí, vừa đảm bảo lớp phủ không bị trầy xước từ các tác động bên ngoài.\r\n\r\nLựa chọn của Titoni đi theo một hướng khác, có thể xem là một sự đầu tư có chủ đích vào trải nghiệm thị giác thuần túy.\r\n\r\n3. Dây đeo “King Bracelet” 5 mắt xích – Linh hoạt, thoải mái và sang trọng\r\nVới Cosmo King 797 G-DB-541, có thể thấy rõ Titoni không xem dây đeo là một yếu tố phụ, mà là một phần trung tâm trong tuyên ngôn về giá trị của sản phẩm.\r\n\r\nVề cấu trúc và độ hoàn thiện, bộ dây King Bracelet là một điểm nhấn đáng chú ý.\r\n\r\nTitoni 797 G-DB-541 - ảnh 5\r\n\r\nCấu trúc 5 dải mắt xích riêng biệt, gợi nhớ đến dây Jubilee huyền thoại, vốn phức tạp và đòi hỏi độ chính xác trong gia công cao hơn hẳn loại dây 3 mắt xích Oyster phổ biến.\r\n\r\nSự tinh tế của nó nằm ở cách hoàn thiện tương phản thông minh, ba dải mắt xích trung tâm đánh bóng sáng loáng để bắt sáng, tạo hiệu ứng thị giác lấp lánh.\r\n\r\nTrong khi hai dải mắt xích bên ngoài được phay xước mờ, mang lại vẻ cứng cáp và giúp che giấu hiệu quả các vết xước nhỏ.\r\n\r\nSự kết hợp này tạo nên một tổng thể hài hòa, giúp chiếc đồng hồ linh hoạt trong nhiều bối cảnh, từ công sở lịch lãm đến các sự kiện sang trọng.\r\n\r\nTitoni Cosmo King 797 G-DB-541 ảnh 6\r\n\r\nTuy nhiên, ưu điểm lớn nhất của thiết kế này nằm ở khía cạnh công thái học. Lợi ích hữu hình của cấu trúc 5 mắt xích là sự thoải mái vượt trội.\r\n\r\nCác mắt xích nhỏ và nhiều cho phép dây uốn lượn và ôm sát theo đường cong tự nhiên của cổ tay.\r\n\r\nLàm giảm đáng kể các điểm áp lực, mang lại cảm giác nhẹ nhàng tối đa khi đeo trong thời gian dài – Yếu tố đặc biệt giá trị trong điều kiện khí hậu nóng ẩm của Việt Nam.\r\n\r\nSự cân bằng hoàn hảo giữa thẩm mỹ tinh xảo và sự thoải mái tuyệt đối đã góp phần quan trọng, nâng cao đáng kể giá trị tổng thể của Titoni Cosmo King 797 G-DB-541.\r\n\r\n4. Khả năng chống nước 100m – An tâm trong các hoạt động thường nhật\r\nKhả năng chống nước là một trong những thông số kỹ thuật thực dụng, quyết định sự an tâm của người dùng trong cuộc sống hàng ngày.\r\n\r\nỞ khía cạnh này, Titoni Cosmo King 797 G-DB-541 đã thể hiện sự vượt trội đáng kể so với định kiến về một chiếc đồng hồ thanh lịch.\r\n\r\nThông thường, các mẫu dress watch cổ điển trong cùng phân khúc, chẳng hạn như dòng Mido Baroncelli hay Frederique Constant Classics. Thường chỉ có mức chống nước tiêu chuẩn là 30m (3 ATM) hoặc 50m (5 ATM). Mức này chỉ đủ để đảm bảo an toàn khi rửa tay hoặc đi dưới mưa nhỏ.\r\n\r\nNgược lại, Titoni trang bị cho Cosmo King khả năng chống nước lên đến 100 mét (10 ATM).\r\n\r\nĐây là một con số ấn tượng, đạt được nhờ vào kết cấu vỏ được gia công chắc chắn cùng với một chi tiết kỹ thuật then chốt – Núm vặn ren.\r\n\r\nTitoni Cosmo King 797 G-DB-541 ảnh 7\r\n\r\nThiết kế này tạo ra một vòng đệm kín và an toàn hơn nhiều so với núm rút thông thường, ngăn nước xâm nhập hiệu quả.\r\n\r\nVề mặt thực tế, chỉ số 100m cho phép người dùng hoàn toàn thoải mái trong mọi hoạt động thường nhật, từ đi mưa, rửa xe, tắm vòi sen cho đến bơi lội ở bể bơi hay vùng nước nông.\r\n\r\nĐặt Cosmo King ngang hàng về độ bền bỉ với những mẫu đồng hồ mang phong cách thể thao thanh lịch như Tissot PRX Powermatic 80.\r\n\r\nTitoni Cosmo King mang đến một lựa chọn “hai trong một”. Người dùng sở hữu một chiếc đồng hồ với thiết kế Presidential sang trọng, cổ điển nhưng lại không phải đánh đổi sự bền bỉ và tính đa dụng.\r\n\r\nKhả năng chống nước 100m là minh chứng cho chất lượng chế tác của Titoni, biến Cosmo King thành một người bạn đồng hành đáng tin cậy mỗi ngày.\r\n\r\n5. Cọc số đính đá – Phong thủy và thẩm mỹ Á Đông trong một chiếc đồng hồ\r\nTrong văn hóa Á Đông, đá pha lê là vật phẩm mang năng lượng tích cực, thu hút may mắn và tài lộc. Titoni hiểu điều này sâu sắc hơn bất kỳ thương hiệu phương Tây nào – bởi vì 75% doanh thu của họ đến từ thị trường Trung Quốc và người Hoa toàn cầu.\r\n\r\nMỗi viên đá trên Cosmo King được chọn lựa kỹ càng, cắt mài đồng đều, phản chiếu ánh sáng tinh tế mà không rơi vào sự lòe loẹt giá rẻ.\r\n\r\n“Chất lượng tổng thể của chiếc đồng hồ này vượt xa những gì tôi từng trải nghiệm ở bất kỳ thương hiệu nào khác trong cùng tầm giá.” – Fratello Watches (tạp chí đồng hồ hàng đầu thế giới)\r\n\r\n“Titoni tlà một trong những thương hiệu đồng hồ Thụy Sỹ lâu đời nhất tại Trung Quốc, với sự hiện diện từ rất lâu trước khi đất nước này mở cửa cho toàn cầu hóa.” – Europa Star, tạp chí ngành đồng hồ Thụy Sỹ\r\n\r\nYouTube video\r\nKhí chất quyền lực, thiết kế đỉnh đạc, cọc số đính đá thu hút tài lộc – tất cả trong một chiếc đồng hồ dưới 60 triệu.\r\n\r\n✅ Biểu tượng của quyền lực và kết nối ngoài xã hội\r\n\r\n✅ Là thước đo kinh tế của bản thân người đeo\r\n\r\n✅ Thể hiện người đeo trân quý thời gian và tôn trọng chất lượng\r\n\r\n👉 Hãy nhìn lại chiếc Titoni Cosmo King 797 G-DB-541 một lần nữa… bạn đang có cảm giác mình phải sở hữu di sản này!\r\n\r\nLịch sử thương hiệu Titoni – Hơn 106 năm độc lập và triết lý độc đáo\r\nKhông phải tập đoàn. Không phải marketing. Chỉ là chế tác.\r\n\r\nTitoni là một trong số ít thương hiệu đồng hồ Thụy Sỹ còn tồn tại độc lập sau hơn 106 năm – không bán mình cho Swatch Group, không thuộc LVMH, không chịu sự chi phối của bất kỳ tập đoàn nào. Từ năm 1919 đến nay, bốn thế hệ nhà Schluep vẫn ngồi ở Grenchen, dãy núi Jura, tỉ mỉ từng chiếc đồng hồ như ngày đầu Fritz Schluep mở xưởng.\r\n\r\nGiống hệt Patek Philippe với gia đình Stern. Giống Hermès với tinh thần atelier độc lập. Titoni là biểu tượng hiếm có: chất lượng chế tác hàng đầu, không bị pha loãng bởi lợi nhuận ngắn hạn.\r\n\r\nLogo hoa mận (Meihua) trên mặt số không phải ngẫu nhiên. Trong văn hóa Á Đông, hoa mận nở giữa mùa đông – biểu tượng của sự kiên cường, bền bỉ và phẩm giá. Đó chính xác là những gì Titoni muốn nói với bạn mỗi lần đưa tay lên xem giờ.\r\n\r\nYouTube video\r\nVì sao Cosmo King là “chiếc Patek trong tầm giá”\r\n\r\nNgười chơi đồng hồ thế giới gọi Titoni là “The most genuine Swiss watchmaker you’ve never heard of.” Nhưng tại Trung Quốc – thị trường tiêu thụ đồng hồ xa xỉ số 1 thế giới – người ta biết Titoni rất rõ. Hơn 700 điểm bán tại Bắc Kinh, Thượng Hải, Quảng Châu. Ranking top 5 thương hiệu Thụy Sỹ được mua nhiều.\r\n\r\nĐây không phải thương hiệu mới nổi. Đây là thương hiệu mà người giàu thực sự chọn – không phải người muốn khoe là người giàu.\r\n\r\n3 DNA cốt lõi bạn sở hữu khi đeo Cosmo King:\r\n\r\nĐộc lập 106 năm: Không tập đoàn, không pha loãng bản sắc, không chạy theo xu hướng ngắn hạn. Triết lý kinh doanh giống Patek Philippe, Hermès.\r\nLogo hoa mận Meihua: Biểu tượng văn hóa châu Á được in sâu vào tiềm thức của 7 thập kỷ người dùng Trung Quốc, Hồng Kông, Singapore, Đài Loan. Khi bạn đeo, bạn đang mang một ngôn ngữ mà người thành đạt Á Đông đọc được tức thì.\r\n“Tốt hàng đầu trong tầm giá”: Titoni không marketing rầm rộ. Ngân sách không đổ vào quảng cáo mà đổ vào chất lượng vật liệu, kiểm định, và chế tác. Đây là lý do Fratello Watches – một trong những tạp chí đồng hồ uy tín nhất thế giới – viết: “Chất lượng tổng thể vượt xa những gì tôi từng trải nghiệm ở bất kỳ thương hiệu nào khác trong cùng tầm giá.”\r\nTitoni Cosmo King 797 G-DB-541 – Trải nghiệm mua sắm chuẩn Thụy Sỹ với chính sách độc quyền “Hải Triều RED Guarantee”\r\nYouTube video\r\nLà đối tác phân phối chính thức và độc quyền của Titoni tại Việt Nam. Hành trình hơn 35 năm khẳng định uy tín từ 1991 của Đồng Hồ Hải Triều là bảo chứng vững chắc nhất cho mỗi sản phẩm chính hãng. Nhưng giá trị mà chúng tôi cam kết mang lại còn đi xa hơn thế.\r\n\r\nTrải nghiệm xa xỉ từ cam kết chất lượng đến văn hóa phục vụ\r\n\r\nTại Hải Triều, chúng tôi tin rằng trải nghiệm đẳng cấp bắt đầu từ một sản phẩm hoàn hảo.\r\n\r\nMỗi chiếc đồng hồ Titoni trước khi đến tay bạn đều phải vượt qua quy trình kiểm soát chất lượng kép khắt khe và được bảo quản trong điều kiện tối ưu.\r\n\r\nTiếp nối bởi văn hóa phục vụ 5C (Chủ động – Cười – Chào – Chăm sóc – Cảm ơn) tận tâm. Đảm bảo mỗi khách hàng đều cảm nhận được sự trân trọng và khác biệt.\r\n\r\nNăng lực bảo dưỡng xứng tầm thương hiệu Thụy Sỹ\r\n\r\nYouTube video\r\nCam kết về sự “An Tâm” của chúng tôi được hiện thực hóa bằng năng lực vượt trội tại Trung tâm bảo hành Đồng Hồ Hải Triều.\r\n\r\nVới hệ thống máy móc chuyên dụng nhập khẩu từ Châu Âu, tiêu biểu là Thụy Sỹ và Đức như máy Witschi và máy ELMA. Đảm bảo chiếc đồng hồ của bạn được chăm sóc bởi chuyên gia và thiết bị hàng đầu.\r\n\r\n“Hải Triều RED Guarantee” – Đặc quyền hậu mãi toàn diện\r\n\r\nĐặc biệt, khi lựa chọn Titoni Airmaster tại Hải Triều, quý khách sẽ sở hữu đặc quyền từ chính sách hậu mãi ưu việt “Hải Triều RED Guarantee“.\r\n\r\nNhân đôi thời gian bảo hành lên đến 4 năm (bao gồm 2 năm quốc tế và 2 năm tăng thêm tại Hải Triều)\r\nTặng kèm dịch vụ đánh bóng vỏ miễn phí trong suốt 4 năm\r\nLuôn được ưu tiên trong quy trình bảo hành, giúp tiết kiệm tối đa thời gian chờ đợi.\r\n“Chọn Hải Triều – Chọn Quyền Được An Tâm”\r\n\r\nnghệ thuật chế tác của titoni\r\n100 năm chế tác độc lập\r\n106 năm chế tác độc lập, mang đậm di sản truyền thống gia đình qua 4 thế hệ – Xem thêm!\r\n\r\nSản xuất tại Thụy Sỹ với chất lượng tốt hàng đầu trong tầm giá\r\nĐược chế tác với niềm đam mê, sự tự hào và tỉ mỉ của đội ngũ thợ tại Thụy Sỹ – Xem thêm!\r\n\r\nChất lượng tốt\r\nTriết lý tạo ra những chiếc đồng hồ có chất lượng tốt hàng đầu trong tầm giá – Xem thêm!\r\n\r\nCửa hàng\r\nCó mặt tại 45+ quốc gia trên toàn cầu, mạng lưới sâu rộng tại thị trường châu Á – Xem thêm!\r\n\r\n\r\nTác giả Khánh Linh\r\n\r\nKhánh Linh\r\n\r\nRÚT GỌN\r\nChia sẻ này có hữu ích cho bạn? Hữu ích Không hữu ích\r\nTHẢO LUẬN\r\n\r\n\r\nĐể lại cảm nghĩ của bạn nhé!\r\n\r\n\r\nSản phẩm tương tự\r\n\r\nTitoni Cosmo 818 SRG-622 – Nữ – Kính Sapphire – Automatic – Mặt Số 30mm – Xà Cừ Thiên Nhiên – Mạ Vàng PVD\r\n\r\n44.770.000 ₫\r\nTitoni 729 G-DB-541 - ảnh 1Titoni 729 G-DB-541 - ảnh 2\r\nTitoni Cosmo Queen 729 G-DB-541 – Nữ – Kính Sapphire – Automatic – Mặt Số 27mm, Mạ Vàng PVD, Chống Nước 10ATM\r\n\r\n46.740.000 ₫\r\nTitoni Cosmo King 797 S-696 - ảnh 1đồng hồ Titoni Cosmo King 797 S-696 - ảnh 1\r\nTitoni Cosmo King 797 S-696 – Nam – Kính Sapphire – Automatic – Mặt Số 40mm, Chống Nước 10ATM\r\n\r\n43.010.000 ₫\r\nTitoni Cosmo Queen 729 SY-DB-722 - ảnh 1Titoni Cosmo Queen 729 SY-DB-722 - ảnh 2\r\nTitoni Cosmo Queen 729 SY-DB-722 – Nữ – Kính Sapphire – Automatic – Mặt Số 27mm, Mạ Vàng PVD, Chống Nước 10ATM\r\n\r\n46.150.000 ₫\r\n\r\nTitoni Đôi – Kính Sapphire – Automatic – (Cosmo King 797 S-307 – Cosmo Queen 729 S-DB-307) – Mặt Số 40mm – 27mm\r\n\r\n43.010.000 ₫\r\nTitoni Cosmo King 797 SY-695 - ảnh 1đồng hồ Titoni Cosmo King 797 SY-695 - ảnh 1\r\nTitoni Cosmo King 797 SY-695 – Nam – Kính Sapphire – Automatic – Mặt Số 40mm, Mạ Vàng PVD, Chống Nước 10ATM\r\n\r\n47.520.000 ₫\r\n\r\nDoxa Executive D217RIY – Nữ – Kính Sapphire – Automatic – Mặt Số 32mm, Đính 8 Viên Kim Cương, Mạ Vàng Hồng\r\n\r\n46.940.000 ₫\r\n\r\nDoxa Executive D153SSV – Nữ – Kính Sapphire – Automatic (Tự Động) – Mặt Số 31mm, Trữ Cót 38 Giờ, Chống Nước 5ATM\r\n\r\n47.090.000 ₫\r\nCÓ THỂ BẠN SẼ THÍCH\r\nCasio MTP-1183A-7ADF - ảnh 1Casio MTP-1183A-7ADF - ảnh 5\r\nCasio MTP-1183A-7ADF – Nam – Quartz (Pin) – Mặt Số 38.5mm, Kính Cứng, Chống Nước 3ATM\r\n\r\n1.352.000 ₫\r\n\r\nCasio MW-620H-1AVDF – Nam – Quartz (Pin) – Mặt Số 48.1mm, Kính Nhựa, Chống Nước 10ATM\r\n\r\n1.327.000 ₫\r\nKOI Moonphase K006.403.65.2.05.03.07 - ảnh 1KOI Moonphase K006.403.65.2.05.03.07 - ảnh 2\r\nKOI Moonphase K006.403.65.2.05.03.07 – Nam – Kính Sapphire – Quartz – Mặt Số 39mm, Swiss Movt, Chống Nước 5ATM\r\n\r\n3.550.000 ₫\r\nĐồng hồ Mathey-Tissot Edmond Moon H1886RAN - Ảnh 1Đồng hồ Mathey-Tissot Edmond Moon H1886RAI - Ảnh 2\r\nMathey-Tissot Edmond Moon H1886RAN – Nam – Quartz (Pin) – Mặt Số 42mm – Kính General (Cường Lực) Phủ Sapphire – Moonphase, Chronograph – Chống Nước 5ATM\r\n\r\n13.820.000 ₫\r\n\r\nG-Shock GG-1000-1ADR – Nam – Quartz (Pin) – Mặt Số 56.2mm, Kính Cứng, Chống Nước 20ATM\r\n\r\n10.516.000 ₫\r\n\r\nFossil TOWNSMAN ME3266 – Nam – Automatic – Mặt Số 44mm, Kính Cứng, Chống Nước 5ATM\r\n\r\n7.810.000 ₫\r\n\r\nBông Tai Sokolov 94170104 Bằng Bạc 925\r\n\r\n410.000 ₫\r\nĐồng hồ Citizen L EM1160-58E - Ảnh 1Đồng hồ Citizen L EM1160-58E - Ảnh 2\r\nCitizen L EM1160-58E – Nữ – Eco-Drive (Năng Lượng Ánh Sáng) – Mặt Số 31,5mm – Kính Sapphire – Chống Nước 5 ATM\r\n\r\n16.085.000 ₫\r\nHotline Đồng Hồ Hải Triều\r\nCHÍNH SÁCH\r\n\r\nChính sách đổi hàng\r\nChính sách bảo hành\r\nHỆ THỐNG CỬA HÀNG\r\nTP. Hồ Chí Minh\r\nHà Nội\r\nHải Phòng\r\nBiên Hoà - Bình Dương\r\nĐà Nẵng\r\nNha Trang\r\nVũng Tàu\r\nCần Thơ\r\nLong Xuyên\r\nTrung Tâm Bảo Hành\r\nTHÔNG TIN\r\nThông tin liên hệ\r\nThanh toán - Trả góp\r\nLiên hệ đối tác doanh nghiệp\r\nVận chuyển & Giao nhận\r\nTHAM KHẢO\r\n\r\nĐiều khoản sử dụng\r\nBảo mật thông tin\r\nTra cứu đồng hồ bảo hành\r\nVỀ CHÚNG TÔI\r\nChứng nhận đại bán bán đồng hồ chính hãng 100% được cập bởi Nhà phân phối và hãng\r\nPhòng bảo hành Đồng Hồ Hải Triều\r\nWebsite Cùng Hệ Thống\r\nKính Hải Triều - Chuỗi cửa hàng mắt kính thuộc quản lý bởi Đồng Hồ Hải Triều Tuyển dụng Đồng Hồ Hải Triều\r\nTrang web donghohaitrieu.com đã được đăng ký trên Bộ Công Thương\r\nCopyright by Đồng Hồ Hải Triều® Since 1991\r\nCông ty TNHH Hải Triều Việt Nam\r\nGPDKKD Số: 0315667679 do sở KH & ĐT TP.HCM cấp ngày: 22/08/2022\r\nGóp ý & Khiếu nại: ceo@donghohaitrieu.com\r\nĐịa chỉ: 50/22 Gò Dầu, Phường Tân Sơn Nhì, Thành phố Hồ Chí Minh, Việt Nam\r\nTrụ sở chính: 156A Trần Quang Khải, Phường Tân Định, Quận 1, Thành phố Hồ Chí Minh\r\nHotline: 1900 6777\r\n\r\n\r\n\r\n\r\n', NULL, '1780124515017_dongho2.webp', 1, 'Le hoi san sale'),
(6, 'Cosmo King 797 G-DB-541 – Thiết kế “Homage” Presidential với layout Day-Date trứ danh\r\nNăm 1956, giữa thế kỷ 20, Rolex đã giới thiệu Day-Date – Chiếc đồng hồ đeo tay chronometer tự động đầu tiên trên thế giới hiển thị đầy đủ cả ngày trong tháng và thứ trong tuần.\r\n\r\nVới tính năng đột phá và thiết kế vỏ Oyster trứ danh, ngay lập tức trở thành lựa chọn hàng đầu của các nguyên thủ quốc gia, nhà lãnh đạo và những nhân vật có tầm ảnh hưởng toàn cầu.\r\n\r\nTừ đó, biệt danh huyền thoại “The President’s Watch” ra đời, định hình nên một nguyên mẫu vĩnh cửu cho quyền lực và sự thành đạt.\r\n\r\nGần 7 thập kỷ sau, Titoni kế thừa và tái hiện lại ADN của phong cách “Presidential” một cách đầy tinh tế qua hai chi tiết đặc trưng. Tôn vinh di sản, thể hiện sự am hiểu sâu sắc các giá trị kinh điển từ một nhà sản xuất Thụy Sỹ độc lập lâu đời.\r\n\r\nTitoni 797 G-DB-541 - ảnh 1\r\n\r\nChú thích: Đồng hồ “homage” là thuật ngữ chỉ những chiếc đồng hồ lấy cảm hứng và tôn vinh một thiết kế huyền thoại, nhưng vẫn giữ nguyên tên thương hiệu và bản sắc riêng. Điều này hoàn toàn khác biệt với đồng hồ giả mạo sao chép bất hợp pháp cả logo và tên gọi.\r\n\r\nĐầu tiên là vành bezel khía. Vốn có nguồn gốc chức năng để đảm bảo chống nước cho vỏ, chi tiết này nay đã trở thành một biểu tượng thẩm mỹ, tạo ra hiệu ứng ánh sáng đa chiều đầy cuốn hút mỗi khi cổ tay chuyển động.\r\n\r\nThứ hai, và cũng là linh hồn của thiết kế, là bố cục lịch Day-Date. Cửa sổ lịch Thứ dạng vòng cung ở góc 12 giờ không chỉ để xem thông tin, mà còn gợi lên hình ảnh một chiếc vương miện – Liên tưởng ý nhị đến tên gọi “Cosmo King”.\r\n\r\nBố cục này được hoàn thiện bởi ô lịch Ngày ở góc 3 giờ, phóng đại qua thấu kính cyclops để tăng cường sự rõ nét.\r\n\r\nGiải mã sức hút của Titoni Cosmo King 797 G-DB-541\r\nKiểu dáng kinh điển dễ dàng liên tưởng biểu tượng Rolex Day-Date, Titoni 797 G-DB-541 mang đến sự lựa chọn hấp dẫn hơn nhờ mức giá chỉ bằng 1/10 của siêu phẩm Rolex.\r\n\r\n1. Bộ máy ETA 2834-2 Thụy Sỹ bền bỉ chuẩn Swiss Movt\r\nBên trong Titoni Cosmo King 797 G-DB-541 là cỗ máy tự động ETA 2834-2 – khẳng định triết lý về sự bền bỉ và giá trị cốt lõi của thương hiệu.\r\n\r\nTrong ngành chế tác Thụy Sỹ, ETA, một thành viên của Swatch Group, là nhà sản xuất bộ máy lừng danh. Model 2834-2 là một biến thể từ nền tảng huyền thoại được giới chuyên môn toàn cầu mệnh danh là cỗ máy ngựa thồ.\r\n\r\nTitoni Cosmo King 797 G-DB-541 ảnh 2\r\n\r\nDanh xưng này tôn vinh ba đặc tính vàng: độ bền bỉ, khả năng vận hành chính xác và ổn định qua nhiều năm, cùng sự phổ biến giúp việc bảo dưỡng trở nên dễ dàng.\r\n\r\nTần số dao động cao 28,800 vph là một thông số nói lên đẳng cấp của bộ máy này.\r\n\r\nTạo ra chuyển động lướt mượt mà gần như tuyệt đối cho kim giây, đặc điểm của đồng hồ cơ cao cấp mà bạn có thể cảm nhận bằng mắt thường.\r\n\r\nKhi đặt lên bàn cân với các đối thủ cùng tầm giá như Tissot hay một số mẫu Longines, sự khác biệt trong triết lý lựa chọn bộ máy của Titoni trở nên rõ ràng.\r\n\r\nCác thương hiệu này thường sử dụng những bộ máy hiện đại như Powermatic 80 hay Caliber L888, vốn có ưu điểm vượt trội về mức dự trữ năng lượng (lên đến 72-80 giờ). Để đạt được điều này, nhà sản xuất đã giảm tần số dao động xuống còn 21,600 vph.\r\n\r\nTitoni Cosmo King 797 G-DB-541 ảnh 3\r\n\r\nNgược lại, Titoni với ETA 2834-2 là một lựa chọn mang tính thuần túy và truyền thống hơn. Thương hiệu ưu tiên giữ lại tần số dao động cao 28,800 vph, chấp nhận mức dự trữ năng lượng tiêu chuẩn khoảng 38-42 giờ.\r\n\r\nĐối với những người am hiểu và trân trọng giá trị cơ khí truyền thống, ETA 2834-2 chính là một máy chuẩn Swiss Movt Thụy Sỹ, một bảo chứng vàng cho sự bền bỉ và đẳng cấp.\r\n\r\n2. Kính Sapphire nguyên khối phủ AR chống chói 2 mặt\r\nTitoni trang bị cho Cosmo King 797 G-DB-541 kính sapphire nguyên khối, một tiêu chuẩn bắt buộc trong đồng hồ cao cấp.\r\n\r\nVật liệu này có độ cứng đạt 9/10 trên thang Mohs, chỉ đứng sau kim cương (10/10), vượt xa kính khoáng thông thường (5-6/10).\r\n\r\nVới khả năng chống trầy xước vượt trội, kính sapphire giữ cho mặt số luôn trong trẻo và mới mẻ dù trải qua nhiều năm sử dụng.\r\n\r\nTitoni 797 G-DB-541 - ảnh 4\r\n\r\nĐiểm khác biệt lớn nhất của Titoni là việc phủ lớp chống phản chiếu (AR) trên cả hai mặt kính.\r\n\r\nLớp phủ AR này là một màng quang học siêu mỏng, nhiều tầng, giúp loại bỏ tới 99% ánh sáng phản chiếu trên bề mặt kính.\r\n\r\nKhi nhìn vào đồng hồ dưới ánh sáng mạnh hoặc đèn điện, lớp phủ này cho cảm giác như không có kính.\r\n\r\nGiúp bạn chiêm ngưỡng trọn vẹn vẻ đẹp của mặt số mà không bị bất kỳ sự cản trở nào từ ánh sáng phản chiếu.\r\n\r\nYouTube video\r\nTừ Tissot PRX Powermatic 80 đến các dòng Mido Baroncelli hay thậm chí một số mẫu của Longines, chúng ta sẽ thấy giải pháp phổ biến là chỉ phủ AR ở mặt trong của kính.\r\n\r\nĐây là một lựa chọn hoàn toàn hợp lý, vừa giúp tối ưu chi phí, vừa đảm bảo lớp phủ không bị trầy xước từ các tác động bên ngoài.\r\n\r\nLựa chọn của Titoni đi theo một hướng khác, có thể xem là một sự đầu tư có chủ đích vào trải nghiệm thị giác thuần túy.\r\n\r\n3. Dây đeo “King Bracelet” 5 mắt xích – Linh hoạt, thoải mái và sang trọng\r\nVới Cosmo King 797 G-DB-541, có thể thấy rõ Titoni không xem dây đeo là một yếu tố phụ, mà là một phần trung tâm trong tuyên ngôn về giá trị của sản phẩm.\r\n\r\nVề cấu trúc và độ hoàn thiện, bộ dây King Bracelet là một điểm nhấn đáng chú ý.\r\n\r\nTitoni 797 G-DB-541 - ảnh 5\r\n\r\nCấu trúc 5 dải mắt xích riêng biệt, gợi nhớ đến dây Jubilee huyền thoại, vốn phức tạp và đòi hỏi độ chính xác trong gia công cao hơn hẳn loại dây 3 mắt xích Oyster phổ biến.\r\n\r\nSự tinh tế của nó nằm ở cách hoàn thiện tương phản thông minh, ba dải mắt xích trung tâm đánh bóng sáng loáng để bắt sáng, tạo hiệu ứng thị giác lấp lánh.\r\n\r\nTrong khi hai dải mắt xích bên ngoài được phay xước mờ, mang lại vẻ cứng cáp và giúp che giấu hiệu quả các vết xước nhỏ.\r\n\r\nSự kết hợp này tạo nên một tổng thể hài hòa, giúp chiếc đồng hồ linh hoạt trong nhiều bối cảnh, từ công sở lịch lãm đến các sự kiện sang trọng.\r\n\r\nTitoni Cosmo King 797 G-DB-541 ảnh 6\r\n\r\nTuy nhiên, ưu điểm lớn nhất của thiết kế này nằm ở khía cạnh công thái học. Lợi ích hữu hình của cấu trúc 5 mắt xích là sự thoải mái vượt trội.\r\n\r\nCác mắt xích nhỏ và nhiều cho phép dây uốn lượn và ôm sát theo đường cong tự nhiên của cổ tay.\r\n\r\nLàm giảm đáng kể các điểm áp lực, mang lại cảm giác nhẹ nhàng tối đa khi đeo trong thời gian dài – Yếu tố đặc biệt giá trị trong điều kiện khí hậu nóng ẩm của Việt Nam.\r\n\r\nSự cân bằng hoàn hảo giữa thẩm mỹ tinh xảo và sự thoải mái tuyệt đối đã góp phần quan trọng, nâng cao đáng kể giá trị tổng thể của Titoni Cosmo King 797 G-DB-541.\r\n\r\n4. Khả năng chống nước 100m – An tâm trong các hoạt động thường nhật\r\nKhả năng chống nước là một trong những thông số kỹ thuật thực dụng, quyết định sự an tâm của người dùng trong cuộc sống hàng ngày.\r\n\r\nỞ khía cạnh này, Titoni Cosmo King 797 G-DB-541 đã thể hiện sự vượt trội đáng kể so với định kiến về một chiếc đồng hồ thanh lịch.\r\n\r\nThông thường, các mẫu dress watch cổ điển trong cùng phân khúc, chẳng hạn như dòng Mido Baroncelli hay Frederique Constant Classics. Thường chỉ có mức chống nước tiêu chuẩn là 30m (3 ATM) hoặc 50m (5 ATM). Mức này chỉ đủ để đảm bảo an toàn khi rửa tay hoặc đi dưới mưa nhỏ.\r\n\r\nNgược lại, Titoni trang bị cho Cosmo King khả năng chống nước lên đến 100 mét (10 ATM).\r\n\r\nĐây là một con số ấn tượng, đạt được nhờ vào kết cấu vỏ được gia công chắc chắn cùng với một chi tiết kỹ thuật then chốt – Núm vặn ren.\r\n\r\nTitoni Cosmo King 797 G-DB-541 ảnh 7\r\n\r\nThiết kế này tạo ra một vòng đệm kín và an toàn hơn nhiều so với núm rút thông thường, ngăn nước xâm nhập hiệu quả.\r\n\r\nVề mặt thực tế, chỉ số 100m cho phép người dùng hoàn toàn thoải mái trong mọi hoạt động thường nhật, từ đi mưa, rửa xe, tắm vòi sen cho đến bơi lội ở bể bơi hay vùng nước nông.\r\n\r\nĐặt Cosmo King ngang hàng về độ bền bỉ với những mẫu đồng hồ mang phong cách thể thao thanh lịch như Tissot PRX Powermatic 80.\r\n\r\nTitoni Cosmo King mang đến một lựa chọn “hai trong một”. Người dùng sở hữu một chiếc đồng hồ với thiết kế Presidential sang trọng, cổ điển nhưng lại không phải đánh đổi sự bền bỉ và tính đa dụng.\r\n\r\nKhả năng chống nước 100m là minh chứng cho chất lượng chế tác của Titoni, biến Cosmo King thành một người bạn đồng hành đáng tin cậy mỗi ngày.\r\n\r\n5. Cọc số đính đá – Phong thủy và thẩm mỹ Á Đông trong một chiếc đồng hồ\r\nTrong văn hóa Á Đông, đá pha lê là vật phẩm mang năng lượng tích cực, thu hút may mắn và tài lộc. Titoni hiểu điều này sâu sắc hơn bất kỳ thương hiệu phương Tây nào – bởi vì 75% doanh thu của họ đến từ thị trường Trung Quốc và người Hoa toàn cầu.\r\n\r\nMỗi viên đá trên Cosmo King được chọn lựa kỹ càng, cắt mài đồng đều, phản chiếu ánh sáng tinh tế mà không rơi vào sự lòe loẹt giá rẻ.\r\n\r\n“Chất lượng tổng thể của chiếc đồng hồ này vượt xa những gì tôi từng trải nghiệm ở bất kỳ thương hiệu nào khác trong cùng tầm giá.” – Fratello Watches (tạp chí đồng hồ hàng đầu thế giới)\r\n\r\n“Titoni tlà một trong những thương hiệu đồng hồ Thụy Sỹ lâu đời nhất tại Trung Quốc, với sự hiện diện từ rất lâu trước khi đất nước này mở cửa cho toàn cầu hóa.” – Europa Star, tạp chí ngành đồng hồ Thụy Sỹ\r\n\r\nYouTube video\r\nKhí chất quyền lực, thiết kế đỉnh đạc, cọc số đính đá thu hút tài lộc – tất cả trong một chiếc đồng hồ dưới 60 triệu.\r\n\r\n✅ Biểu tượng của quyền lực và kết nối ngoài xã hội\r\n\r\n✅ Là thước đo kinh tế của bản thân người đeo\r\n\r\n✅ Thể hiện người đeo trân quý thời gian và tôn trọng chất lượng\r\n\r\n👉 Hãy nhìn lại chiếc Titoni Cosmo King 797 G-DB-541 một lần nữa… bạn đang có cảm giác mình phải sở hữu di sản này!\r\n\r\nLịch sử thương hiệu Titoni – Hơn 106 năm độc lập và triết lý độc đáo\r\nKhông phải tập đoàn. Không phải marketing. Chỉ là chế tác.\r\n\r\nTitoni là một trong số ít thương hiệu đồng hồ Thụy Sỹ còn tồn tại độc lập sau hơn 106 năm – không bán mình cho Swatch Group, không thuộc LVMH, không chịu sự chi phối của bất kỳ tập đoàn nào. Từ năm 1919 đến nay, bốn thế hệ nhà Schluep vẫn ngồi ở Grenchen, dãy núi Jura, tỉ mỉ từng chiếc đồng hồ như ngày đầu Fritz Schluep mở xưởng.\r\n\r\nGiống hệt Patek Philippe với gia đình Stern. Giống Hermès với tinh thần atelier độc lập. Titoni là biểu tượng hiếm có: chất lượng chế tác hàng đầu, không bị pha loãng bởi lợi nhuận ngắn hạn.\r\n\r\nLogo hoa mận (Meihua) trên mặt số không phải ngẫu nhiên. Trong văn hóa Á Đông, hoa mận nở giữa mùa đông – biểu tượng của sự kiên cường, bền bỉ và phẩm giá. Đó chính xác là những gì Titoni muốn nói với bạn mỗi lần đưa tay lên xem giờ.\r\n\r\nYouTube video\r\nVì sao Cosmo King là “chiếc Patek trong tầm giá”\r\n\r\nNgười chơi đồng hồ thế giới gọi Titoni là “The most genuine Swiss watchmaker you’ve never heard of.” Nhưng tại Trung Quốc – thị trường tiêu thụ đồng hồ xa xỉ số 1 thế giới – người ta biết Titoni rất rõ. Hơn 700 điểm bán tại Bắc Kinh, Thượng Hải, Quảng Châu. Ranking top 5 thương hiệu Thụy Sỹ được mua nhiều.\r\n\r\nĐây không phải thương hiệu mới nổi. Đây là thương hiệu mà người giàu thực sự chọn – không phải người muốn khoe là người giàu.\r\n\r\n3 DNA cốt lõi bạn sở hữu khi đeo Cosmo King:\r\n\r\nĐộc lập 106 năm: Không tập đoàn, không pha loãng bản sắc, không chạy theo xu hướng ngắn hạn. Triết lý kinh doanh giống Patek Philippe, Hermès.\r\nLogo hoa mận Meihua: Biểu tượng văn hóa châu Á được in sâu vào tiềm thức của 7 thập kỷ người dùng Trung Quốc, Hồng Kông, Singapore, Đài Loan. Khi bạn đeo, bạn đang mang một ngôn ngữ mà người thành đạt Á Đông đọc được tức thì.\r\n“Tốt hàng đầu trong tầm giá”: Titoni không marketing rầm rộ. Ngân sách không đổ vào quảng cáo mà đổ vào chất lượng vật liệu, kiểm định, và chế tác. Đây là lý do Fratello Watches – một trong những tạp chí đồng hồ uy tín nhất thế giới – viết: “Chất lượng tổng thể vượt xa những gì tôi từng trải nghiệm ở bất kỳ thương hiệu nào khác trong cùng tầm giá.”\r\nTitoni Cosmo King 797 G-DB-541 – Trải nghiệm mua sắm chuẩn Thụy Sỹ với chính sách độc quyền “Hải Triều RED Guarantee”\r\nYouTube video\r\nLà đối tác phân phối chính thức và độc quyền của Titoni tại Việt Nam. Hành trình hơn 35 năm khẳng định uy tín từ 1991 của Đồng Hồ Hải Triều là bảo chứng vững chắc nhất cho mỗi sản phẩm chính hãng. Nhưng giá trị mà chúng tôi cam kết mang lại còn đi xa hơn thế.\r\n\r\nTrải nghiệm xa xỉ từ cam kết chất lượng đến văn hóa phục vụ\r\n\r\nTại Hải Triều, chúng tôi tin rằng trải nghiệm đẳng cấp bắt đầu từ một sản phẩm hoàn hảo.\r\n\r\nMỗi chiếc đồng hồ Titoni trước khi đến tay bạn đều phải vượt qua quy trình kiểm soát chất lượng kép khắt khe và được bảo quản trong điều kiện tối ưu.\r\n\r\nTiếp nối bởi văn hóa phục vụ 5C (Chủ động – Cười – Chào – Chăm sóc – Cảm ơn) tận tâm. Đảm bảo mỗi khách hàng đều cảm nhận được sự trân trọng và khác biệt.\r\n\r\nNăng lực bảo dưỡng xứng tầm thương hiệu Thụy Sỹ\r\n\r\nYouTube video\r\nCam kết về sự “An Tâm” của chúng tôi được hiện thực hóa bằng năng lực vượt trội tại Trung tâm bảo hành Đồng Hồ Hải Triều.\r\n\r\nVới hệ thống máy móc chuyên dụng nhập khẩu từ Châu Âu, tiêu biểu là Thụy Sỹ và Đức như máy Witschi và máy ELMA. Đảm bảo chiếc đồng hồ của bạn được chăm sóc bởi chuyên gia và thiết bị hàng đầu.\r\n\r\n“Hải Triều RED Guarantee” – Đặc quyền hậu mãi toàn diện\r\n\r\nĐặc biệt, khi lựa chọn Titoni Airmaster tại Hải Triều, quý khách sẽ sở hữu đặc quyền từ chính sách hậu mãi ưu việt “Hải Triều RED Guarantee“.\r\n\r\nNhân đôi thời gian bảo hành lên đến 4 năm (bao gồm 2 năm quốc tế và 2 năm tăng thêm tại Hải Triều)\r\nTặng kèm dịch vụ đánh bóng vỏ miễn phí trong suốt 4 năm\r\nLuôn được ưu tiên trong quy trình bảo hành, giúp tiết kiệm tối đa thời gian chờ đợi.', NULL, '1780732008064_photo-1631031354362-b1fd73f89e19.avif', 1, 'gioi thieu');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `hot` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `description`, `discount`, `hot`, `id_brand`, `image`, `name`, `price`, `quantity`) VALUES
(1, 'Theo dõi sức khỏe, chống nước 5ATM', 10, 0, 2, '1779801781825_dongho2.webp', 'Vòng Đồng Hồ Thông Minh 2026', 869000, 0),
(2, 'Giá ưu đãi online', 12, 0, 3, '1779801801860_istockphoto-890822072-612x612.webp', 'Đồng Hồ Đeo Tay Nữ Pindow PDS-2109-N9', 3000000, 0),
(3, 'sdafsdfsdfdsfsdvxcvxcvxcvxcvx', 10, 0, 2, '1779808185902_photo-1732679005773-f2ef48b724c7.avif', 'đồng hồ 1', 2000000, 0),
(4, 'Ghi âm 24h, lọc âm', 2, 0, 2, '1779808201663_photo-1748327929572-2ccf5716d3b9.avif', 'svsdfvds', 800000, 0),
(5, 'ềasfesdafsdfds', 10, 0, 1, '1780019780217_photo-1624106159879-8a16d53c54ff.avif', 'ưefgewfgwe', 123123, 0),
(6, 'qưertyuiop[ádfghjkl;zxcvbnm,', 3, 0, 1, '1779808253524_photo-1631031354362-b1fd73f89e19.avif', 'ưerfewfwe', 500000, 0),
(7, 'sdfsasdfghjklxcvbnmrtyuio', 12, 0, 2, '1779808283436_photo-1624106159879-8a16d53c54ff.avif', 'ádfghjklr', 2000000, 0),
(8, 'ưertyuuioplokijhgfvbnm,', 10, 0, 3, '1779808317074_photo-1610888968213-4f6d2c068108.avif', 'ádfghjkl', 1000000, 0),
(9, 'êfsdvxcvsvsdvsdvsd', 12, 0, 3, '1779808345735_photo-1588748543198-cd1afaf858ff.avif', 'dèagdahdjnjasmdak', 3000000, 0),
(10, 'gfsklmnmsgjfugfdbdfd', 2, 0, 2, '1779808381920_photo-1751437774882-deeea4352018.avif', 'adasfdasdfsdfsdfsdf', 450000, 0),
(12, 'Phiên bản cao cấp 1', 2, 0, 3, '1780019945191_premium_photo-1728012217493-b0bfdc0c389a.avif', 'Đồng hồ điện tử chống nước huyền thoại 1', 174000, 0),
(13, 'dxv', 2, 0, 4, '1781766029250_photo-1585123334904-845d60e97b29.avif', 'dfcv', 200000, 12);

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `session_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopping_cart`
--

INSERT INTO `shopping_cart` (`id`, `id_product`, `id_user`, `price`, `quantity`, `session_id`) VALUES
(43, 13, 2, 200000, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `role`) VALUES
(1, 'nguyenphucphi210@gmail.com', 'Phi', '123456', 1),
(2, 'anh@gmail.com', 'Anh', '123456', 0),
(3, 'ly@gmail.com', 'Ly', '123456', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comment_product` (`id_product`),
  ADD KEY `fk_comment_user` (`id_user`),
  ADD KEY `fk_comment_orders` (`id_order`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_user` (`id_user`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_detail_product` (`id_product`),
  ADD KEY `fk_orderdetail_orders` (`id_order`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payment_orders` (`id_order`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_brand` (`id_brand`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shoppingcart_product` (`id_product`),
  ADD KEY `fk_shoppingcart_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_orders` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `fk_comment_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `fk_order_detail_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_orderdetail_orders` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_orders` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`);

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `fk_shoppingcart_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_shoppingcart_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
