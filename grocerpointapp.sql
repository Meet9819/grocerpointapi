-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2021 at 01:41 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocerpointapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adderss`
--

CREATE TABLE `tbl_adderss` (
  `a_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `a_type` varchar(100) NOT NULL,
  `a_name` varchar(100) NOT NULL,
  `a_number` varchar(20) NOT NULL,
  `a_houser_no` varchar(20) NOT NULL,
  `a_lendmark` varchar(40) NOT NULL,
  `a_adderss` varchar(255) NOT NULL,
  `a_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_adderss`
--

INSERT INTO `tbl_adderss` (`a_id`, `user_id`, `a_type`, `a_name`, `a_number`, `a_houser_no`, `a_lendmark`, `a_adderss`, `a_status`) VALUES
(1, 2, '1', 'test', '9852368096', '159', 'tugk', '157, Dindayal Society, Sima Nagar, Surat, Gujarat 395005, India', 1),
(2, 5, '1', 'meet', '9819461979', 'b602 shree managal ', 'dahisar east ', 'Unnamed Road, Nakaravadi, Gujarat 360003, India', 1),
(3, 5, '1', 'meet', '9819761979', 'b 602', 'dahisr', 'dahisar east mumbai ', 1),
(4, 6, '1', 'given', '66688', 'jcidjcjf', 'cjcjfj', 'Unnamed Road, Nakaravadi, Gujarat 360003, India', 1),
(5, 6, '1', 'ebdj', '5609', 'shhxjx', 'xjdj', 'Unnamed Road, Nakaravadi, Gujarat 360003, India', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`, `email`, `image`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', '512 x 512 (1).png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `b_id` int(11) NOT NULL,
  `b_name` varchar(255) NOT NULL,
  `b_image` varchar(255) NOT NULL,
  `b_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_banner`
--

INSERT INTO `tbl_banner` (`b_id`, `b_name`, `b_image`, `b_status`) VALUES
(14, '1', 'IMG_20200701_145250.jpg', 1),
(15, '2', '205110.jpg', 1),
(17, 'x', 'Banner5.jpg', 1),
(18, 'g', 'ss12.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(100) NOT NULL,
  `c_image` varchar(255) NOT NULL,
  `c_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`c_id`, `c_name`, `c_image`, `c_status`) VALUES
(2, 'Grocery', '69488_pulses1.jpg', 1),
(40, 'Vegetables', '53065_veg2.jpg', 1),
(53, 'Packaged food', '13595_1581878222940.png', 0),
(64, 'Home Care', '36772_1581878957604.png', 0),
(71, 'Personal Care', '24633_1582721651991.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `cm_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `co_id` int(11) NOT NULL,
  `cm_msg` text COLLATE utf8_unicode_ci NOT NULL,
  `cm_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`cm_id`, `u_id`, `co_id`, `cm_msg`, `cm_status`) VALUES
(1, 36, 1, 'this is test data/....', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon`
--

CREATE TABLE `tbl_coupon` (
  `cpn_id` int(11) NOT NULL,
  `cpn_name` varchar(255) NOT NULL,
  `cpn_promocode` varchar(255) NOT NULL,
  `cpn_mincart` varchar(255) NOT NULL,
  `cpn_type` int(11) NOT NULL,
  `cpn_price` int(11) NOT NULL,
  `cpn_start_date` varchar(255) NOT NULL,
  `cpn_end_date` varchar(255) NOT NULL,
  `cpn_status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_coupon`
--

INSERT INTO `tbl_coupon` (`cpn_id`, `cpn_name`, `cpn_promocode`, `cpn_mincart`, `cpn_type`, `cpn_price`, `cpn_start_date`, `cpn_end_date`, `cpn_status`) VALUES
(1, 'GET 40% OFF up TO RS . 250', 'test1', '250', 1, 40, '2020-07-29', '2020-08-26', 1),
(2, 'Flat RS 200 OFF ON 400ORDER', 'test2', '400', 2, 200, '2020-07-29', '2020-08-30', 1),
(3, 'GET 20% OFF up TO RS . 300', 'test3', '300', 1, 20, '2020-07-29', '2020-08-29', 1),
(4, 'coupon 4', 'test 4', '250', 2, 150, '2020-07-29', '2020-08-31', 0),
(5, 'coupon 5', 'test 5', '250', 1, 25, '2020-07-29', '2020-08-31', 0),
(6, 'coupon 6', 'test 6', '250', 2, 250, '2020-07-29', '2020-08-31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_custom_order`
--

CREATE TABLE `tbl_custom_order` (
  `co_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `co_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `co_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `co_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_custom_order`
--

INSERT INTO `tbl_custom_order` (`co_id`, `u_id`, `a_id`, `co_image`, `co_comment`, `co_status`) VALUES
(1, 36, 0, '40287_Jellyfish - Copy.jpg', '', 1),
(2, 1, 0, '65686_Jellyfish - Copy.jpg', 'efsef', 1),
(3, 42, 0, '87757_', '68986', 1),
(4, 42, 0, '15710_', '845644', 1),
(5, 42, 0, '46393_', 'hfhfjhf', 1),
(6, 42, 0, '90911_', 'test', 1),
(7, 42, 368, '94401_', 'test', 1),
(8, 1, 0, '21782_Jellyfish - Copy.jpg', 'efsef', 1),
(9, 1, 380, '3275_99cf74652f5125246e2dac3f6de55a5c-700.jpg', 'efsef', 1),
(10, 42, 368, '81378_1597061224893.png', 'test', 1),
(11, 42, 368, '98806_1597061275197.png', 'hrgh', 1),
(12, 1, 0, '12760_Jellyfish - Copy.jpg', 'efsef', 1),
(13, 42, 360, '54034_1597228200716.png', 'test ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data`
--

CREATE TABLE `tbl_data` (
  `d_id` int(11) NOT NULL,
  `d_aboutus` text NOT NULL,
  `d_contactus` text NOT NULL,
  `d_privacy_policy` text NOT NULL,
  `d_terms` text NOT NULL,
  `d_refund` text NOT NULL,
  `d_status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_data`
--

INSERT INTO `tbl_data` (`d_id`, `d_aboutus`, `d_contactus`, `d_privacy_policy`, `d_terms`, `d_refund`, `d_status`) VALUES
(1, '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500&nbsp;when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries&nbsp;but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '<p>Company Name : ABCD</p>\r\n\r\n<p>Address : XYZ</p>\r\n\r\n<p>Contact numbers : 9876543210</p>\r\n\r\n<p>Email IDs : admin@gmail.com</p>\r\n', '<p><strong>Your website may use the Privacy Policy given below:</strong></p>\r\n\r\n<p>The terms &quot;We&quot; / &quot;Us&quot; / &quot;Our&quot;/&rdquo;Company&rdquo; individually and collectively refer to &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;..and the terms &quot;You&quot; /&quot;Your&quot; / &quot;Yourself&quot; refer to the users.</p>\r\n\r\n<p>This Privacy Policy is an electronic record in the form of an electronic contract formed under the information Technology Act, 2000 and the rules made thereunder and the amended provisions pertaining to electronic documents / records in various statutes as amended by the information Technology Act, 2000. This Privacy Policy does not require any physical, electronic or digital signature.</p>\r\n\r\n<p>This Privacy Policy is a legally binding document between you and &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.. (both terms defined below). The terms of this Privacy Policy will be effective upon your acceptance of the same (directly or indirectly in electronic form, by clicking on the I accept tab or by use of the website or by other means) and will govern the relationship between you and &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;. for your use of the website &ldquo;<strong>Website</strong>&rdquo; (defined below).</p>\r\n\r\n<p>This document is published and shall be construed in accordance with the provisions of the Information Technology (reasonable security practices and procedures and sensitive personal data of information) rules, 2011 under Information Technology Act, 2000; that require publishing of the Privacy Policy for collection, use, storage and transfer of sensitive personal data or information.</p>\r\n\r\n<p>Please read this Privacy Policy carefully by using the Website, you indicate that you understand, agree and consent to this Privacy Policy. If you do not agree with the terms of this Privacy Policy, please do not use this Website.</p>\r\n\r\n<p>By providing us your Information or by making use of the facilities provided by the Website, You hereby consent to the collection, storage, processing and transfer of any or all of Your Personal Information and Non-Personal Information by us as specified under this Privacy Policy. You further agree that such collection, use, storage and transfer of Your Information shall not cause any loss or wrongful gain to you or any other person.</p>\r\n\r\n<p><strong>USER INFORMATION</strong><strong> </strong></p>\r\n\r\n<p>To avail certain services on our Websites, users are required to provide certain information for the registration process namely: - a) your name, b) email address, c) sex, d) age, e) PIN code, f) credit card or debit card details g) medical records and history h) sexual orientation, i) biometric information, j) password etc., and / or your occupation, interests, and the like. The Information as supplied by the users enables us to improve our sites and provide you the most user-friendly experience.<br />\r\n<br />\r\nAll required information is service dependent and we may use the above said user information to, maintain, protect, and improve its services (including advertising services) and for developing new services<br />\r\n<br />\r\nSuch information will not be considered as sensitive if it is freely available and accessible in the public domain or is furnished under the Right to Information Act, 2005 or any other law for the time being in force.<br />\r\n<br />\r\n<strong>COOKIES</strong><br />\r\nTo improve the responsiveness of the sites for our users, we may use &quot;cookies&quot;, or similar electronic tools to collect information to assign each visitor a unique, random number as a User Identification (User ID) to understand the user&#39;s individual interests using the Identified Computer. Unless you voluntarily identify yourself (through registration, for example), we will have no way of knowing who you are, even if we assign a cookie to your computer. The only personal information a cookie can contain is information you supply (an example of this is when you ask for our Personalised Horoscope). A cookie cannot read data off your hard drive. Our advertisers may also assign their own cookies to your browser (if you click on their ads), a process that we do not control.<br />\r\n<br />\r\nOur web servers automatically collect limited information about your computer&#39;s connection to the Internet, including your IP address, when you visit our site. (Your IP address is a number that lets computers attached to the Internet know where to send you data -- such as the web pages you view.) Your IP address does not identify you personally. We use this information to deliver our web pages to you upon request, to tailor our site to the interests of our users, to measure traffic within our site and let advertisers know the geographic locations from where our visitors come.</p>\r\n\r\n<p><strong>LINKS TO THE OTHER SITES</strong><br />\r\nOur policy discloses the privacy practices for our own web site only. Our site provides links to other websites also that are beyond our control. We shall in no way be responsible in way for your use of such sites.<strong>5. </strong></p>\r\n\r\n<p><strong>INFORMATION SHARING</strong><br />\r\nWe shares the sensitive personal information to any third party without obtaining the prior consent of the user in the following limited circumstances:<br />\r\n<br />\r\n<strong>(a)</strong> When it is requested or required by law or by any court or governmental agency or authority to disclose, for the purpose of verification of identity, or for the prevention, detection, investigation including cyber incidents, or for prosecution and punishment of offences. These disclosures are made in good faith and belief that such disclosure is reasonably necessary for enforcing these Terms; for complying with the applicable laws and regulations.<br />\r\n<br />\r\n<strong>(b)</strong> We proposes to share such information within its group companies and officers and employees of such group companies for the purpose of processing personal information on its behalf. We also ensure that these recipients of such information agree to process such information based on our instructions and in compliance with this Privacy Policy and any other appropriate confidentiality and security measures.<br />\r\n<br />\r\n<strong>INFORMATION SECURITY</strong><br />\r\nWe take appropriate security measures to protect against unauthorized access to or unauthorized alteration, disclosure or destruction of data. These include internal reviews of our data collection, storage and processing practices and security measures, including appropriate encryption and physical security measures to guard against unauthorized access to systems where we store personal data.<br />\r\n<br />\r\nAll information gathered on our Website is securely stored within our controlled database. The database is stored on servers secured behind a firewall; access to the servers is password-protected and is strictly limited. However, as effective as our security measures are, no security system is impenetrable. We cannot guarantee the security of our database, nor can we guarantee that information you supply will not be intercepted while being transmitted to us over the Internet. And, of course, any information you include in a posting to the discussion areas is available to anyone with Internet access.<br />\r\n<br />\r\nHowever the internet is an ever evolving medium. We may change our Privacy Policy from time to time to incorporate necessary future changes. Of course, our use of any information we gather will always be consistent with the policy under which the information was collected, regardless of what the new policy may be.</p>\r\n', '<p><strong>Your website may use the Terms and Conditions given below.</strong></p>\r\n\r\n<p>The terms &quot;We&quot; / &quot;Us&quot; / &quot;Our&quot;/&rdquo;Company&rdquo; individually and collectively refer to &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;..and the terms &quot;Visitor&rdquo; &rdquo;User&rdquo; refer to the users.</p>\r\n\r\n<p><br />\r\nThis page states the Terms and Conditions under which you (Visitor) may visit this website (&ldquo;Website&rdquo;). Please read this page carefully. If you do not accept the Terms and Conditions stated here, we would request you to exit this site. The business, any of its business divisions and / or its subsidiaries, associate companies or subsidiaries to subsidiaries or such other investment companies (in India or abroad) reserve their respective rights to revise these Terms and Conditions at any time by updating this posting. You should visit this page periodically to re-appraise yourself of the Terms and Conditions, because they are binding on all users of this Website.<br />\r\n<br />\r\n<strong>USE OF CONTENT</strong><br />\r\n<br />\r\nAll logos, brands, marks headings, labels, names, signatures, numerals, shapes or any combinations thereof, appearing in this site, except as otherwise noted, are properties either owned, or used under licence, by the business and / or its associate entities who feature on this Website. The use of these properties or any other content on this site, except as provided in these terms and conditions or in the site content, is strictly prohibited.<br />\r\n<br />\r\nYou may not sell or modify the content of this Website&nbsp; or reproduce, display, publicly perform, distribute, or otherwise use the materials in any way for any public or commercial purpose without the respective organisation&rsquo;s or entity&rsquo;s written permission.<br />\r\n<br />\r\n<strong>ACCEPTABLE WEBSITE USE</strong><br />\r\n<br />\r\n<strong>(A) Security Rules</strong><br />\r\nVisitors are prohibited from violating or attempting to violate the security of the Web site, including, without limitation, (1) accessing data not intended for such user or logging into a server or account which the user is not authorised to access, (2) attempting to probe, scan or test the vulnerability of a system or network or to breach security or authentication measures without proper authorisation, (3) attempting to interfere with service to any user, host or network, including, without limitation, via means of submitting a virus or &quot;Trojan horse&quot; to the Website, overloading, &quot;flooding&quot;, &quot;mail bombing&quot; or &quot;crashing&quot;, or (4) sending unsolicited electronic mail, including promotions and/or advertising of products or services. Violations of system or network security may result in civil or criminal liability. The business and / or its associate entities will have the right to investigate occurrences that they suspect as involving such violations and will have the right to involve, and cooperate with, law enforcement authorities in prosecuting users who are involved in such violations.</p>\r\n\r\n<p><br />\r\n<strong>(B) General Rules</strong><br />\r\nVisitors may not use the Web Site in order to transmit, distribute, store or destroy material (a) that could constitute or encourage conduct that would be considered a criminal offence or violate any applicable law or regulation, (b) in a manner that will infringe the copyright, trademark, trade secret or other intellectual property rights of others or violate the privacy or publicity of other personal rights of others, or (c) that is libellous, defamatory, pornographic, profane, obscene, threatening, abusive or hateful.<br />\r\n<br />\r\n<strong>INDEMNITY</strong><br />\r\n<br />\r\nThe User unilaterally agree to indemnify and hold harmless, without objection, the Company, its officers, directors, employees and agents from and against any claims, actions and/or demands and/or liabilities and/or losses and/or damages whatsoever arising from or resulting from their use of <a href=\"http://www.magicbricks.com/\" target=\"_blank\">&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;..com</a> or their breach of the terms .</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>LIABILITY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><br />\r\n<br />\r\nUser agrees that neither <a href=\"http://www.magicbricks.com/\" target=\"_blank\">Company</a> nor its group companies, directors, officers or employee shall be liable for any direct or/and indirect or/and incidental or/and special or/and consequential or/and exemplary damages, resulting from the use or/and the inability to use the service or/and for cost of procurement of substitute goods or/and services or resulting from any goods or/and data or/and information or/and services purchased or/and obtained or/and messages received or/and transactions entered into through or/and from the service or/and resulting from unauthorized access to or/and alteration of user&#39;s transmissions or/and data or/and arising from any other matter relating to the service, including but not limited to, damages for loss of profits or/and use or/and data or other intangible, even if <a href=\"http://www.magicbricks.com/\" target=\"_blank\">Company</a> has been advised of the possibility of such damages.</p>\r\n\r\n<p>User further agrees that <a href=\"http://www.magicbricks.com/\" target=\"_blank\">Company</a> shall not be liable for any damages arising from interruption, suspension or termination of service, including but not limited to direct or/and indirect or/and incidental or/and special consequential or/and exemplary damages, whether such interruption or/and suspension or/and termination was justified or not, negligent or intentional, inadvertent or advertent.</p>\r\n\r\n<p>User agrees that <a href=\"http://www.magicbricks.com/\" target=\"_blank\">Company</a> shall not be responsible or liable to user, or anyone, for the statements or conduct of any third party of the service. In sum, in no event shall Company&#39;s total liability to the User for all damages or/and losses or/and causes of action exceed the amount paid by the User to <a href=\"http://www.magicbricks.com/\" target=\"_blank\">Company</a>, if any, that is related to the cause of action.</p>\r\n\r\n<p><br />\r\n<strong>DISCLAIMER OF CONSEQUENTIAL DAMAGES</strong><br />\r\n<br />\r\nIn no event shall Company or any parties, organizations or entities associated with the corporate brand name us or otherwise, mentioned at this Website be liable for any damages whatsoever (including, without limitations, incidental and consequential damages, lost profits, or damage to computer hardware or loss of data information or business interruption) resulting from the use or inability to use the Website and the Website material, whether based on warranty, contract, tort, or any other legal theory, and whether or not, such organization or entities were advised of the possibility of such damages.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Our focus is complete customer satisfaction. In the event, if you are displeased with the services provided, we will refund back the money, provided the reasons are genuine and proved after investigation. Please read the fine prints of each deal before buying it, it provides all the details about the services or the product you purchase.<br />\r\n<br />\r\nIn case of dissatisfaction from our services, clients have the liberty to cancel their projects and request a refund from us. Our Policy for the cancellation and refund will be as follows:</p>\r\n\r\n<p><strong>&nbsp;Cancellation Policy</strong><br />\r\n<br />\r\nFor Cancellations please contact the us via contact us link.<br />\r\n<br />\r\nRequests received later than ____business days prior to the end of the current service period will be treated as cancellation of services for the next service period.<br />\r\n<br />\r\n<strong>Refund Policy</strong><br />\r\n<br />\r\nWe will try our best to create the suitable design concepts for our clients.<br />\r\n<br />\r\nIn case any client is not completely satisfied with our products we can provide a refund.<br />\r\n<br />\r\nIf paid by credit card, refunds will be issued to the original credit card provided at the time of purchase and in case of payment gateway name payments refund will be made to the same account.</p>\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery_boy`
--

CREATE TABLE `tbl_delivery_boy` (
  `b_id` int(11) NOT NULL,
  `b_name` varchar(100) NOT NULL,
  `b_email` varchar(255) NOT NULL,
  `b_pass` varchar(255) NOT NULL,
  `b_phone` varchar(255) NOT NULL,
  `b_address` varchar(255) NOT NULL,
  `b_image` varchar(255) NOT NULL,
  `b_token` text NOT NULL,
  `b_activestatus` int(11) NOT NULL,
  `b_status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_delivery_boy`
--

INSERT INTO `tbl_delivery_boy` (`b_id`, `b_name`, `b_email`, `b_pass`, `b_phone`, `b_address`, `b_image`, `b_token`, `b_activestatus`, `b_status`) VALUES
(1, 'vishal mahetaa', 'boy1@gmail.com', 'boy1', '123564897896', '', '22915_1595048028655.png', 'da8T-f7dQmKUAmyNcQMYj-:APA91bHgXz9U_wPnatX4dDYzH9YRb_u7T5m8LJfAQ4H7tnPIn3e845238GJSHMDKc8vIXD1I5wh9cwnQU_u3TOD8wpqcagE-tG-_hwqKQG4dRJR8YAuhjpCNMuokp85-nVjsmxYy6eIf', 1, 1),
(2, 'boy2', 'boy2@gmail.com', 'boy2', '7984563215', 'Adajan', '32418_Koala.jpg', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manager`
--

CREATE TABLE `tbl_manager` (
  `m_id` int(11) NOT NULL,
  `m_name` varchar(255) NOT NULL,
  `m_email` varchar(255) NOT NULL,
  `m_phone` varchar(255) NOT NULL,
  `m_pass` varchar(255) NOT NULL,
  `m_image` varchar(255) NOT NULL,
  `m_address` varchar(255) NOT NULL,
  `m_token` text NOT NULL,
  `m_status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_manager`
--

INSERT INTO `tbl_manager` (`m_id`, `m_name`, `m_email`, `m_phone`, `m_pass`, `m_image`, `m_address`, `m_token`, `m_status`) VALUES
(1, 'manager1', 'manager1@gmail.com', '98645738', 'manager1', '', '123', 'coxi96m1SkCwmTELdKc38C:APA91bHCbLELAAjpFs8VQfRsqMYTudWIN-I0Wx6_G_3HSaiN99sPZyXzJVUOS8SAM1z_cCK4ZZp5EQpJE4aPBczf40h76ZJL4INsYMUosEvIRXLakUOdyNYLUb6WmPF217nj7zpkBihr', 1),
(2, 'manager 2', 'manager2@gmail.com', '7894561236', 'asd', '', '', '', 1),
(3, 'Sachin kumar', 'Rasoi@gmail.com', '9758608860', 'agra@999', '', '', '', 1),
(4, 'Shahid', 'sk556823@gmail.com', '9897969401', '12345', '', '', '', 1),
(6, 'Mohit kumar', 'mohitkumarshakya29@gmail.com', '6396292105', '12345', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `msg` varchar(500) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_notification`
--

INSERT INTO `tbl_notification` (`id`, `type`, `order_id`, `user_id`, `date`, `msg`, `status`) VALUES
(6, 1, 11, 3, 'Aug-14-2020 06:27:25', 'Hello tailor,  your booking request with ID 11 has been DELIVERED by Grocery Store which was scheduled for 14-08-2020 at 11:16:19. Please rate the your experience with the vendor. Ratings helps our vendors to serve you better. Thank You ! ', 1),
(7, 1, 12, 3, 'Aug-14-2020 09:14:48', 'Hello tailor,  your booking request with ID 12 has been ACCEPTED by Grocery Store and is scheduled for 14-08-2020 at 14:43:58. We wish you have a pleasant experience. ', 1),
(8, 1, 16, 5, 'Aug-18-2020 05:35:50', 'Hello meet,  your booking request with ID 16 has been ACCEPTED by Grocery Store and is scheduled for 18-08-2020 at 23:03:15. We wish you have a pleasant experience. ', 1),
(9, 1, 15, 2, 'Aug-18-2020 05:36:48', 'Hello tu,  your booking request with ID 15 has been ACCEPTED by Grocery Store and is scheduled for 17-08-2020 at 15:02:22. We wish you have a pleasant experience. ', 1),
(10, 1, 15, 2, 'Aug-18-2020 06:41:07', 'Hello tu,  your booking request with ID 15 has been DELIVERED by Grocery Store which was scheduled for 17-08-2020 at 15:02:22. Please rate the your experience with the vendor. Ratings helps our vendors to serve you better. Thank You ! ', 1),
(11, 1, 18, 6, 'Aug-19-2020 07:30:43', 'Hello vipul,  your booking request with ID 18 has been ACCEPTED by Grocery Store and is scheduled for 19-08-2020 at 09:38:04. We wish you have a pleasant experience. ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `o_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `order_details` text NOT NULL,
  `a_id` int(11) NOT NULL,
  `o_cdate` varchar(100) NOT NULL,
  `o_date` varchar(50) NOT NULL,
  `o_time` varchar(100) NOT NULL,
  `o_amount` varchar(100) NOT NULL,
  `cpn_id` int(11) NOT NULL,
  `cpn_price` varchar(255) NOT NULL,
  `o_txtfinalamount` varchar(255) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `payment_orderid` varchar(255) NOT NULL,
  `o_type` int(11) NOT NULL,
  `o_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`o_id`, `user_id`, `b_id`, `order_details`, `a_id`, `o_cdate`, `o_date`, `o_time`, `o_amount`, `cpn_id`, `cpn_price`, `o_txtfinalamount`, `payment_type`, `payment_orderid`, `o_type`, `o_status`) VALUES
(15, 2, 2, '[{\"category\":\"82\",\"product\":\"361\",\"qunt\":1,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/97475_1583375446880.png\",\"p_qty\":\"1\"},{\"category\":\"82\",\"product\":\"359\",\"qunt\":1,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/34224_1583299358585.png\",\"p_qty\":\"1\"}]', 1, '17-08-2020 15:02:22', '17-08-2020', '15:02:22', '200.0', 0, '0', '200.0', 1, '', 4, 1),
(16, 5, 2, '[{\"category\":\"82\",\"product\":\"354\",\"qunt\":3,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/69659_1583153734752.png\",\"p_qty\":\"1\"},{\"category\":\"82\",\"product\":\"353\",\"qunt\":3,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/34485_1583153238248.png\",\"p_qty\":\"1\"},{\"category\":\"53\",\"product\":\"63\",\"qunt\":4,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/4467_1584642622642.png\",\"p_qty\":\"1\"},{\"category\":\"53\",\"product\":\"79\",\"qunt\":4,\"p_ori_price\":\"100\",\"p_dis_price\":\"50\",\"p_unit\":\"l\",\"p_image\":\"http://sharegiants.in/app/images/37042_1584641554114.png\",\"p_qty\":\"1\"}]', 2, '18-08-2020 23:03:15', '18-08-2020', '23:03:15', '1200.0', 0, '0', '1200.0', 1, '', 2, 1),
(17, 5, 0, '[{\"category\":\"82\",\"product\":\"333\",\"qunt\":4,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/80753_1582980854575.png\",\"p_qty\":\"1\"},{\"category\":\"53\",\"product\":\"63\",\"qunt\":5,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/4467_1584642622642.png\",\"p_qty\":\"1\"},{\"category\":\"53\",\"product\":\"82\",\"qunt\":1,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/30372_1584205042270.png\",\"p_qty\":\"1\"}]', 3, '19-08-2020 08:51:30', '19-08-2020', '08:51:30', '1000.0', 0, '0', '1000.0', 1, '', 1, 1),
(18, 6, 1, '[{\"category\":\"53\",\"product\":\"79\",\"qunt\":1,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/37042_1584641554114.png\",\"p_qty\":\"1\"},{\"category\":\"55\",\"product\":\"80\",\"qunt\":2,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/52226_1582514988911.png\",\"p_qty\":\"1\"},{\"category\":\"55\",\"product\":\"90\",\"qunt\":3,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/92728_1584642940559.png\",\"p_qty\":\"1\"}]', 4, '19-08-2020 09:38:04', '19-08-2020', '09:38:04', '600.0', 0, '0', '600.0', 1, '', 2, 1),
(19, 5, 0, '[{\"category\":\"53\",\"product\":\"63\",\"qunt\":6,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/4467_1584642622642.png\",\"p_qty\":\"1\"},{\"category\":\"82\",\"product\":\"361\",\"qunt\":4,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/97475_1583375446880.png\",\"p_qty\":\"1\"},{\"category\":\"82\",\"product\":\"353\",\"qunt\":4,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/34485_1583153238248.png\",\"p_qty\":\"1\"},{\"category\":\"82\",\"product\":\"352\",\"qunt\":1,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/67007_1583153150695.png\",\"p_qty\":\"1\"},{\"category\":\"53\",\"product\":\"79\",\"qunt\":4,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/37042_1584641554114.png\",\"p_qty\":\"1\"},{\"category\":\"53\",\"product\":\"82\",\"qunt\":4,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/30372_1584205042270.png\",\"p_qty\":\"1\"},{\"category\":\"53\",\"product\":\"83\",\"qunt\":4,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/70815_1584641599359.png\",\"p_qty\":\"1\"},{\"category\":\"53\",\"product\":\"84\",\"qunt\":4,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/54694_1580055162593.png\",\"p_qty\":\"1\"},{\"category\":\"56\",\"product\":\"93\",\"qunt\":1,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/47144_1581906770332.png\",\"p_qty\":\"1\"},{\"category\":\"56\",\"product\":\"94\",\"qunt\":4,\"p_ori_price\":\"200\",\"p_dis_price\":\"100\",\"p_unit\":\"kg\",\"p_image\":\"http://sharegiants.in/app/images/38639_1581906872853.png\",\"p_qty\":\"1\"}]', 3, '19-08-2020 12:58:29', '19-08-2020', '12:58:29', '3600.0', 0, '0', '3600.0', 1, '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ordervalue`
--

CREATE TABLE `tbl_ordervalue` (
  `v_id` int(11) NOT NULL,
  `v_min_value` varchar(255) NOT NULL,
  `v_max_value` varchar(255) NOT NULL,
  `v_status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ordervalue`
--

INSERT INTO `tbl_ordervalue` (`v_id`, `v_min_value`, `v_max_value`, `v_status`) VALUES
(1, '100', '1000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_transaction`
--

CREATE TABLE `tbl_payment_transaction` (
  `tid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `orderid` varchar(255) NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `bankname` varchar(255) NOT NULL,
  `txtstatus` varchar(255) NOT NULL,
  `txtid` varchar(255) NOT NULL,
  `txtdate` varchar(255) NOT NULL,
  `txtamount` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `res_code` varchar(255) NOT NULL,
  `res_msg` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payment_transaction`
--

INSERT INTO `tbl_payment_transaction` (`tid`, `user_id`, `email`, `order_id`, `orderid`, `checksum`, `bankname`, `txtstatus`, `txtid`, `txtdate`, `txtamount`, `currency`, `payment_mode`, `res_code`, `res_msg`, `status`) VALUES
(1, 1, 'khush@gmail.com', 1, '1_11111', 'jb,jh,j,', 'aaa', '1', '1', '13-04-2020', '10', 'rs', '1', '1', 'gyjvgjv', 1),
(2, 0, '', 0, '', '', '', '', '', '13-04-2020', '', '', '', '', '', 1),
(3, 1, 'khush@gmail.com', 1, '1_11111', 'jb,jh,j,', 'aaa', '1', '1', '13-04-2020', '10', 'rs', '1', '1', 'gyjvgjv', 1),
(4, 0, '', 0, '', '', '', '', '', '13-04-2020', '', '', '', '', '', 1),
(5, 0, '', 0, '', '', '', '', '', '14-04-2020', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `p_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_desc` text NOT NULL,
  `p_details` varchar(255) NOT NULL,
  `p_image` varchar(255) NOT NULL,
  `p_stock` int(1) NOT NULL,
  `p_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`p_id`, `c_id`, `p_name`, `p_desc`, `p_details`, `p_image`, `p_stock`, `p_status`) VALUES
(59, 2, '	Almonds(Badam)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	583390.jpg	', 0, 1),
(63, 2, '	Pista	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	378785.jpg	', 0, 1),
(65, 2, '	Dates	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	241117.jpeg	', 0, 1),
(67, 2, '	Raisin(Kismis)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	493515.jpg	', 0, 1),
(69, 2, '	Walnuts(without shell)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	116250.jpg	', 0, 1),
(71, 2, '	Apricot	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	653717.jpeg	', 0, 0),
(72, 2, '	Mixed Nuts	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	107017.jpeg	', 0, 1),
(73, 2, '	Charoli	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	150338.jpeg	', 0, 1),
(74, 2, '	Makhana	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Makhana1.jpg	', 0, 1),
(76, 2, '	Moong dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	822451.jpg	', 0, 1),
(77, 2, '	Toor Dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	885765.jpg	', 0, 1),
(78, 2, '	Urad dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	313125.jpg	', 0, 1),
(79, 2, '	Masoor Dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	61261.jpg	', 0, 1),
(80, 2, '	Daliya	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	667294.jpeg	', 0, 1),
(81, 2, '	Mix Dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	387452.jpg	', 0, 1),
(82, 2, '	Rajma (Red)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	563635.jpg	', 0, 1),
(83, 2, '	Soyabean	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	388137.jpg	', 0, 1),
(84, 2, '	Kabuli Chana	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	419900.jpg	', 0, 1),
(85, 2, '	Vatana (Green)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	354830.jpg	', 0, 1),
(88, 2, '	Small Chana (Brown)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	255209.jpg	', 0, 1),
(89, 2, '	Urad Pulses (White)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	519494.jpg	', 0, 1),
(90, 2, '	Moong Pulses	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	875368.jpg	', 0, 1),
(91, 2, '	Masoor (Whole)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	63139.jpg	', 0, 1),
(92, 2, '	Society Leaf Tea	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	240645.jpg	', 0, 1),
(93, 2, '	Red Label Tea	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	298241.jpg	', 0, 1),
(94, 2, '	Brooke Bond, Taj Mahal Tea	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	889878.jpg	', 0, 1),
(95, 2, '	Tata Tea Gold	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	426218.jpg	', 0, 1),
(96, 2, '	Lipton Green Tea - Honey Lemon	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	234108.jpg	', 0, 1),
(97, 2, '	Tetley Lemon & Honey Green Tea	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	486718.jpg	', 0, 1),
(98, 36, '	Cherry	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	651314.jpg	', 0, 1),
(99, 36, '	Green Garpes	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	33041.jpg	', 0, 1),
(100, 36, '	Kesar Mango	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	kesarmango1.jpg	', 0, 0),
(101, 36, '	Kiwi green	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	806433.jpg	', 0, 1),
(103, 36, '	Orange	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	486605.png	', 0, 1),
(104, 36, '	Papaya	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	papaya1.jpg	', 0, 1),
(106, 36, '	Pears	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	625111.jpg	', 0, 1),
(107, 36, '	Promogrenate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	pomogranate1.jpg	', 0, 1),
(108, 36, '	Plum	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	pulm1.jpg	', 0, 1),
(109, 36, '	Raw Mango	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	rawmango1.jpg	', 0, 0),
(110, 36, '	Sweet Lemon	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	sweetlemon1.jpg	', 0, 1),
(111, 40, '	Beetroot	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"80\",\"ori_price\":\"85\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"40\",\"ori_price\":\"42.5\"}]\r\n', '	868238.png	', 0, 1),
(112, 40, '	Bottle Gourd (Lauki)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"unit\",\"dis_price\":\"35\",\"ori_price\":\"40\"}]\r\n', '	799408.jpg	', 0, 1),
(113, 40, '	Brinjal (Baingan)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"80\",\"ori_price\":\"100\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"40\",\"ori_price\":\"50\"}]\r\n', '	768896.jpg	', 0, 1),
(114, 40, '	Broccoli (brokolee)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"340\",\"ori_price\":\"360\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"170\",\"ori_price\":\"180\"}]\r\n', '	452726.jpg	', 0, 1),
(115, 0, '	Cabbage	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	cabbage1.jpg	', 0, 1),
(116, 40, '	Capsicum(Shimla Mirch)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"100\",\"ori_price\":\"120\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"3\",\"qty\":\"250\",\"unit\":\"gm\",\"dis_price\":\"25\",\"ori_price\":\"30\"}]\r\n', '	141690.jpg	', 0, 1),
(117, 40, '	Carrot (gaajar)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"80\",\"ori_price\":\"85\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"40\",\"ori_price\":\"42\"}]\r\n', '	480480.jpg	', 0, 1),
(118, 40, '	Cauliflower (gobhee)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"40\",\"ori_price\":\"50\"}]', '	496256.png	', 0, 1),
(119, 40, '	Cluster Beans (gavaar phalee)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"45\",\"ori_price\":\"50\"}]\r\n', '	clusterbeans1.jpg	', 0, 1),
(120, 40, '	Coriander (Dhaniya)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"Bunch\",\"dis_price\":\"30\",\"ori_price\":\"35\"}]\r\n', '	318562.jpg	', 0, 1),
(121, 40, '	Cucumber (kheera)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"60\",\"ori_price\":\"70\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"30\",\"ori_price\":\"35\"},{\"no\":\"3\",\"qty\":\"250\",\"unit\":\"gm\",\"dis_price\":\"15\",\"ori_price\":\"18\"}]\r\n', '	859963.jpg	', 0, 1),
(122, 40, '	Drumstick (Sahjan ki fali)	', '', '[{\"no\":\"1\",\"qty\":\"3\",\"unit\":\"unit\",\"dis_price\":\"30\",\"ori_price\":\"36\"}]\r\n', '	drumstick1.jpg	', 0, 1),
(123, 40, '	Garlic (lahasun)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"160\",\"ori_price\":\"180\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"80\",\"ori_price\":\"90\"},{\"no\":\"3\",\"qty\":\"250\",\"unit\":\"gm\",\"dis_price\":\"40\",\"ori_price\":\"45\"}]\r\n', '	438119.jpg	', 0, 1),
(124, 40, '	Ginger	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"180\",\"ori_price\":\"200\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"90\",\"ori_price\":\"100\"},{\"no\":\"2\",\"qty\":\"250\",\"unit\":\"gm\",\"dis_price\":\"45\",\"ori_price\":\"50\"}]\r\n', '	ginger1.jpg	', 0, 1),
(125, 2, '	Amul Butter	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	845424.jpg	', 0, 1),
(126, 40, '	Greenpeas (Haree matar)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"200\",\"ori_price\":\"210\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"100\",\"ori_price\":\"110\"}]\r\n', '	162520.jpg	', 0, 1),
(127, 40, '	Lemon	', '', '[{\"no\":\"1\",\"qty\":\"4\",\"unit\":\"pcs\",\"dis_price\":\"20\",\"ori_price\":\"30\"}]\r\n', '	847506.jpg	', 0, 1),
(128, 40, '	Methi	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"Bunch\",\"dis_price\":\"25\",\"ori_price\":\"30\"}]\r\n', '	methi1.jpg	', 0, 1),
(130, 40, '	Palak	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"Bunch\",\"dis_price\":\"25\",\"ori_price\":\"30\"}]\r\n', '	422839.jpg	', 0, 1),
(131, 40, '	 Sp.Potato (Aaloo) AGRA BRAND	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"30\",\"ori_price\":\"40\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"15\",\"ori_price\":\"20\"}]\r\n', '	407301.png	', 0, 1),
(132, 40, '	Sweetcorn (Bhutta)	', '', '[{\"no\":\"1\",\"qty\":\"5\",\"unit\":\"Packs\",\"dis_price\":\"100\",\"ori_price\":\"125\"}]\r\n', '	sweetcorn1.jpg	', 0, 1),
(133, 2, '	Gowardhan Cheese Slice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	904442.jpg	', 0, 1),
(134, 2, '	Amul Processed Cheese	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	103227.jpg	', 0, 1),
(135, 2, '	Amul Processed Cheese Cubes	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	968503.jpg	', 0, 1),
(136, 2, '	Gowardhan Processed Cheese Slices	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	637394.jpg	', 0, 1),
(137, 0, '	Britannia Cheese Cubes	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	322740.jpg	', 0, 1),
(138, 2, '	Nutralite Fat Spread Tub	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	592337.jpg	', 0, 1),
(140, 2, '	Nutralite Fat Spread	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	744290.jpg	', 0, 1),
(142, 2, '	Cadbury Bournvita Health Drink Refill	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	594855.jpg	', 0, 1),
(143, 2, '	Nestlé Everyday Dairy Whitener	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	686227.jpg	', 0, 0),
(144, 2, '	Gowardhan Paneer Classic Block	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	213301.jpg	', 0, 1),
(145, 2, '	Protinex Original Health Drink	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	947699.jpg	', 0, 1),
(146, 2, '	Pediasure Nutritional Powder - Premium Chocolate Flavour	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	788157.jpg	', 0, 1),
(148, 2, '	Amul Masti Spiced Buttermilk	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	125283.jpg	', 0, 1),
(149, 2, '	Cadbury Bournvita Jar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	202677.jpg	', 0, 1),
(152, 2, '	Horlicks Classic Malt Refill	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	38292.jpg	', 0, 1),
(153, 2, '	Complan Kesar Badam Health Drink	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	824220.jpg	', 0, 1),
(154, 2, '	Nescafé Classic Coffee Jar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	591018.jpg	', 0, 1),
(155, 2, '	Amul Rose Lassi	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	674552.jpeg	', 0, 1),
(156, 2, '	Bru Instant Coffee	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	88271.jpg	', 0, 1),
(157, 2, '	Go Buttermilk	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	977126.jpg	', 0, 1),
(158, 2, '	Nescafé Sunrise Coffee	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	814766.jpg	', 0, 1),
(159, 2, '	Nescafe Gold Blend Coffee Jar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	808361.jpg	', 0, 1),
(162, 2, '	Amul Masti Dahi	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	70849.jpg	', 0, 1),
(163, 2, '	Amul Shrikhand Mango	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	613633.jpg	', 0, 1),
(164, 2, '	Amul Shrikhand Kesar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	41154.jpg	', 0, 1),
(165, 2, '	Sprite	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	76734.jpg	', 0, 1),
(166, 2, '	Thumbs Up	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	613660.jpg	', 0, 1),
(167, 2, '	Mirinda Orange	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	680661.jpg	', 0, 1),
(168, 2, '	Pepsi	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	814376.jpg	', 0, 1),
(169, 2, '	Appy Fizz Apple Juice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	952141.jpg	', 0, 1),
(170, 2, '	Maaza Mango Drink	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	192997.jpg	', 0, 1),
(171, 2, '	Frooti Mango Drink	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	544582.jpg	', 0, 1),
(172, 2, '	Tropicana Slice Mango	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	839430.jpg	', 0, 1),
(173, 2, '	Real Fruit Power Guava Juice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	692121.jpg	', 0, 1),
(175, 2, '	Red Bull Energy Drink	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	780642.jpg	', 0, 1),
(176, 2, '	Glucon-D Instant Energy Orange	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	258977.jpg	', 0, 1),
(177, 2, '	Sunday Refined Sunflower Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	103345.jpg	', 0, 1),
(179, 2, '	Fortune Sunlite Refined Sunflower	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	505862.jpg	', 0, 1),
(180, 2, '	Fortune Refined Sunflower Oil Jar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	364065.jpg	', 0, 1),
(181, 2, '	Sunrich Refined Sunflower Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	68174.jpg	', 0, 1),
(182, 2, '	Dhara Health Refined Sunflower Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	452523.jpg	', 0, 1),
(183, 2, '	Gemini Refined Sunflower Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	493370.jpg	', 0, 1),
(184, 2, '	Sunny Refined Lite Sunflower Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	877989.jpg	', 0, 1),
(185, 2, '	Saffola Gold Oil Jar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	623622.jpg	', 0, 1),
(186, 2, '	Saffola Active Oil Jar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	519870.jpg	', 0, 1),
(188, 2, '	Figaro Pure Olive Oil Tin	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	772886.jpg	', 0, 1),
(190, 2, '	Borges Extra Virgin Olive Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	984657.jpg	', 0, 0),
(191, 2, '	Fortune Kachi Ghani Mustard Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	805373.jpg	', 0, 1),
(192, 2, '	Mapro Coolz Rose Sharbat	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	42981.jpg	', 0, 1),
(193, 2, '	Rooh Afza Sharbat	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	133164.jpeg	', 0, 1),
(194, 2, '	Tang Orange Instant Drink Mix Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	675241.jpg	', 0, 1),
(195, 2, '	Tang Lemon Instant Drink Mix Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	512429.jpg	', 0, 1),
(196, 2, '	Rasna Insta Mango Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	494893.jpg	', 0, 1),
(197, 2, '	Bisleri Water	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	947642.jpg	', 0, 1),
(198, 2, '	Dukes club soda	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	575582.jpg	', 0, 1),
(199, 2, '	Gowardhan Pure Cow Ghee Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	944188.jpg	', 0, 1),
(200, 2, '	Amul Pure Ghee Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	958444.jpg	', 0, 1),
(201, 2, '	Amul Cow Ghee Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	697088.jpg	', 0, 1),
(202, 2, '	Gowardhan Cow Ghee Tin	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	49357.jpg	', 0, 1),
(203, 2, '	Amul Pure Ghee Tin	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	84525.jpg	', 0, 1),
(204, 2, '	Dalda Vanaspati Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	708490.jpg	', 0, 1),
(205, 2, '	Sagar Pure Ghee Tin	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	360571.jpg	', 0, 1),
(206, 2, '	Aashirvaad Atta	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	349418.jpg	', 0, 1),
(207, 2, '	Aashirvaad Multigrain Atta	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	AashirvaadAttaMultigrains1.jpg	', 0, 1),
(210, 2, '	Daawat Rozana Super Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	909919.jpg	', 0, 1),
(211, 2, '	Wheat Lokwan (Lokvan)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	LokwanWheat1.jpg	', 0, 1),
(212, 2, '	Rava	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	312103.jpg	', 0, 1),
(213, 2, '	Besan	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	638755.jpeg	', 0, 1),
(214, 2, '	India Gate Basmati Rice - Feast Rozzana	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	147386.jpg	', 0, 1),
(215, 2, '	Sabudana	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	sabudana1.jpg	', 0, 1),
(216, 2, '	Maida	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	MaidA1.jpg	', 0, 1),
(217, 2, '	India Gate Mini Mogra Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	848302.jpg	', 0, 1),
(218, 2, '	Rice Atta	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	RICEATTA.jpg	', 0, 1),
(219, 2, '	Bajari	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	366034.jpg	', 0, 1),
(220, 2, '	Jowar Atta	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	171504.jpg	', 0, 1),
(221, 2, '	Nachni	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	NACHNI1.jpg	', 0, 1),
(222, 2, '	Daawat Pulav Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	629466.jpg	', 0, 1),
(225, 2, '	Daawat Super Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	474270.jpg	', 0, 1),
(226, 2, '	India Gate Basmati Rice - Mogra	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	238041.jpg	', 0, 1),
(227, 2, '	Daawat Rozana Basmati Rice - Gold	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	214831.jpg	', 0, 1),
(228, 2, '	Kohinoor Royale Authentic biryani Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	724351.jpg	', 0, 1),
(229, 2, '	Basmati Rice Mogra	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	505391.jpeg	', 0, 0),
(230, 2, '	India Gate Basmati Rice - Dubar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	4997.jpg	', 0, 1),
(231, 2, '	Basmati Rice Mini Mogra	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	437593.jpg	', 0, 0),
(232, 2, '	Daawat Traditional Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	948622.jpg	', 0, 1),
(234, 2, '	Kohinoor Traditional Authentic Aged Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	844571.jpg	', 0, 1),
(235, 2, '	Kohinoor Charminar - Rozana Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	42944.jpg	', 0, 1),
(236, 2, '	Kohinoor Super Silver Aged Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	135526.jpg	', 0, 0),
(238, 2, '	Wada Kolam Sorted Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	198833.jpg	', 0, 1),
(239, 2, '	ECO Kolam Sorted Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	132419.jpg	', 0, 0),
(245, 2, '	Tata Sampann Poha	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	55755.jpg	', 0, 0),
(248, 2, '	Kohinoor Charminar Long Grain Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	146238.jpg	', 0, 1),
(250, 2, '	Gb Long Grain Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	412988.jpg	', 0, 0),
(251, 2, '	Vandevi Hing Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	343247.jpg	', 0, 1),
(252, 2, '	Everest Garam Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	239000.jpg	', 0, 1),
(253, 2, '	Everest Pav Bhaji Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	562957.jpg	', 0, 1),
(254, 2, '	ramdev strong hing	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	44212.jpg	', 0, 1),
(255, 2, '	Everest Turmeric Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	174751.jpg	', 0, 1),
(256, 2, '	Everest Chaat Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	344097.jpg	', 0, 1),
(257, 2, '	Everest Tikhalal Chilli Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	663909.jpg	', 0, 1),
(258, 2, '	Everest Kitchen King Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	842007.jpg	', 0, 1),
(259, 2, '	Everest Coriander Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	774314.jpg	', 0, 1),
(260, 2, '	Everest KashmirilaEverest Kashmirilal Red Chilli Powder Everest Kashmirilal Red Chilli Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	653469.jpg	', 0, 1),
(261, 2, '	Everest Tea Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	494074.jpg	', 0, 1),
(262, 2, '	Everest Chicken Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	776257.jpg	', 0, 1),
(263, 2, '	Goldiee Sabji Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	179519.jpg	', 0, 1),
(264, 2, '	Suhana Veg Kolhapuri Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	158254.jpeg	', 0, 0),
(265, 2, '	Eastern Hyderabadi Biryani Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	498355.jpg	', 0, 1),
(266, 2, '	Goldiee Kashmiri Mirch Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	116210.jpg	', 0, 1),
(267, 2, '	Suhana Shahi Paneer Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	348745.jpg	', 0, 0),
(268, 2, '	Goldiee Pavbhaji Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	720326.jpg	', 0, 1),
(269, 2, '	Badshah Chicken Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	260564.jpg	', 0, 1),
(270, 2, '	Eastern Chilli Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	778401.jpg	', 0, 1),
(271, 2, '	Goldiee Chicken Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	730234.jpg	', 0, 1),
(272, 2, '	MTR Sambar Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	290849.jpg	', 0, 1),
(273, 2, '	Everest Meat Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	125299.jpg	', 0, 1),
(274, 2, '	Eating Soda	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	71339.jpg	', 0, 1),
(275, 2, '	Badshah Mumbai Bhaji Pav Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	241668.png	', 0, 1),
(276, 2, '	Badshah Chana Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	695985.jpg	', 0, 1),
(278, 2, '	Snapin Cinnamon Powder Spice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	243502.jpg	', 0, 1),
(279, 2, '	Snapin Chilli Flakes Spice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	817452.jpg	', 0, 1),
(280, 2, '	Everest Sabji Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	458578.jpg	', 0, 1),
(281, 2, '	Everest Tandoori Chicken Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	378909.jpg	', 0, 1),
(283, 2, '	Badshah Rajwadi Garam Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	964804.jpg	', 0, 1),
(284, 2, '	Suhana Paneer Makhanwala Mix Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	295418.jpg	', 0, 0),
(285, 2, '	Goldiee Garam Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	242487.jpg	', 0, 1),
(286, 2, '	MTR Idli/Dosa/Chilly Chutney Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	835034.jpg	', 0, 1),
(287, 2, '	Everest Kuti Chilli Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	978279.jpg	', 0, 1),
(288, 2, '	Suhana Chicken Biryani Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	615411.jpg	', 0, 0),
(289, 2, '	Badshah Kitchen King Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	353098.jpg	', 0, 1),
(290, 2, '	Everest Chhole Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	396820.jpg	', 0, 1),
(291, 2, '	Ginger Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	742031.jpg	', 0, 1),
(292, 2, '	Suhana Paneer Butter Masala Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	817031.jpg	', 0, 0),
(293, 2, '	Suhana Paneer Butter Masala Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	278762.jpg	', 0, 0),
(294, 2, '	Eastern Sambar Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	122454.jpg	', 0, 1),
(295, 2, '	Eastern Garam Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	872482.jpg	', 0, 1),
(296, 2, '	Eastern Chicken Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	96864.jpg	', 0, 1),
(297, 2, '	Suhana Chicken Gravy Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	166273.jpg	', 0, 0),
(298, 2, '	Badshah Chat Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	850199.jpg	', 0, 1),
(299, 2, '	Badshah Dry Mango Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	167013.jpg	', 0, 1),
(300, 2, '	Dhania Jeera Mix Khandela	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	932143.jpg	', 0, 1),
(302, 2, '	Jeera	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	643469.jpg	', 0, 1);
INSERT INTO `tbl_product` (`p_id`, `c_id`, `p_name`, `p_desc`, `p_details`, `p_image`, `p_stock`, `p_status`) VALUES
(304, 2, '	Nimbu Phool (Citric Acid)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	295304.jpg	', 0, 1),
(305, 2, '	Dry Coconut	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	960080.jpg	', 0, 1),
(306, 2, '	Halim	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	459310.jpg	', 0, 0),
(307, 2, '	Til White	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	380589.jpg	', 0, 1),
(308, 2, '	Dagad Phool (Black Stone Flower)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	770662.jpg	', 0, 0),
(309, 2, '	Green Elaichi Economy	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	907712.jpg	', 0, 1),
(310, 2, '	Bedgi Chilli	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	179682.jpg	', 0, 0),
(311, 2, '	Kalvanji	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	364699.jpg	', 0, 1),
(312, 2, '	Khaskhas	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	424807.jpg	', 0, 1),
(313, 2, '	Dry Ginger (Sunth)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	74899.jpg	', 0, 1),
(314, 2, '	Jaifal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	254231.jpg	', 0, 1),
(315, 2, '	Black Pepper	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	337890.jpg	', 0, 1),
(316, 2, '	Dinkh (Edible Gum)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	728920.jpg	', 0, 1),
(317, 2, '	Dhaniya	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	536579.jpg	', 0, 1),
(319, 2, '	Badisaufn raw	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	398277.jpg	', 0, 1),
(320, 2, '	Tej Patta	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	489835.jpg	', 0, 1),
(321, 2, '	Rai	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	338556.jpg	', 0, 1),
(322, 2, '	Shaha Jeera	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	741906.jpg	', 0, 1),
(323, 2, '	Jaipatri (Mace)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	28346.jpg	', 0, 1),
(324, 2, '	Emli	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	936556.jpg	', 0, 1),
(325, 2, '	Lawang	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	146822.jpeg	', 0, 1),
(326, 2, '	Til Black	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	738093.jpg	', 0, 1),
(327, 2, '	Rai Small	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	524576.jpg	', 0, 1),
(328, 2, '	Alsi	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	76672.jpg	', 0, 0),
(329, 2, '	Cassia Taj	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	279369.jpg	', 0, 1),
(330, 2, '	Star Anise (Badiyan)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	46944.jpg	', 0, 1),
(331, 2, '	Lukhnowi Badishep	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	785292.jpg	', 0, 1),
(332, 2, '	Dhaniya Dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	523745.jpg	', 0, 1),
(333, 2, '	Methi	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	482938.jpg	', 0, 1),
(334, 2, '	Masala Elaichi	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	397908.jpg	', 0, 0),
(336, 2, '	ramdev strong hing	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	256446.jpg	', 0, 0),
(338, 2, '	Maggi Magic Cubes - Vegetarian Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	734664.jpg	', 0, 1),
(339, 2, '	Badisaufn roasted	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	525408.jpg	', 0, 1),
(341, 2, '	Snapin Oregano Herb	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	608957.jpg	', 0, 1),
(342, 2, '	Masala Elaichi	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	803873.jpg	', 0, 1),
(343, 2, '	Snapin Pizza Mix Seasoning	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	71540.jpg	', 0, 1),
(344, 2, '	Bhagirathi Modak Atta	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	download(1).jpg	', 0, 1),
(346, 2, '	Jawari Atta	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	391635.jpeg	', 0, 1),
(347, 2, '	Tata Sampann Fine Besan	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	fd1513e9-f477-42e9-9246-cc41efd4e271.__CR0,0,300,300_PT0_SX300_V1___.jpg	', 0, 0),
(348, 2, '	Pillsbury Chakki Fresh Atta	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	710yT72yleL._SX425_.jpg	', 0, 1),
(349, 2, '	Jaggery Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	67666.jpg	', 0, 0),
(350, 2, '	Tata Salt	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	61j0wPsKqoL._SX425_.jpg	', 0, 1),
(351, 2, '	Iodised Salt	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	640811.jpg	', 0, 0),
(352, 2, '	Jaggery	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	841200.jpg	', 0, 1),
(353, 2, '	Puro Healthy Salt	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	767245.jpg	', 0, 0),
(354, 2, '	Keshar Premium Natural Jaggery	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	133146.jpg	', 0, 0),
(355, 2, '	Tata Salt Lite	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	564735.jpg	', 0, 1),
(356, 2, '	Black Salt	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	415019.jpg	', 0, 1),
(357, 2, '	Sugar Cubes	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	554834.jpg	', 0, 1),
(358, 2, '	Salt White (Sendha Namak)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	834634.jpg	', 0, 0),
(359, 2, '	Tata Rock Salt Powder Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	155685.jpg	', 0, 0),
(360, 2, '	Sakariya	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	665742.jpg	', 0, 1),
(361, 2, '	Aashirvaad Salt	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	838172.jpeg	', 0, 1),
(362, 2, '	Tata Rock Salt Crusher	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	116917.jpg	', 0, 0),
(363, 2, '	Sugar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	290045.png	', 0, 1),
(364, 2, '	Madhur Pure & Hygienic Sugar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	393346.jpg	', 0, 1),
(365, 2, '	Organic Tattva Brown Sugar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	15493.jpg	', 0, 0),
(366, 2, '	Sugar Free Gold Pellets	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	676506.jpg	', 0, 1),
(367, 2, '	24 Mantra Organic Sugar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	323259.jpg	', 0, 0),
(368, 2, '	Sugar Free Natura Pellets	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	740707.jpg	', 0, 1),
(369, 2, '	Nutrivalue Stevia Leaves - Natural Sweetener	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	424233.jpg	', 0, 0),
(370, 2, '	Sugar Free Natura Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	542674.jpg	', 0, 0),
(371, 2, '	Sugar Free Gold Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	940375.jpg	', 0, 0),
(372, 2, '	Sugar Free Natura Diet Sugar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	222534.jpg	', 0, 0),
(373, 2, '	Sugar Crystals Diamond Sugar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	852047.jpg	', 0, 1),
(374, 2, '	Sugar Free Natura Sweet Drops	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	437872.jpg	', 0, 1),
(375, 2, '	Sugar Free Gold Sachets	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	532486.jpg	', 0, 0),
(376, 2, '	Britannia Good Day Cashew Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	629703.jpg	', 0, 1),
(377, 2, '	Parle Hide & Seek Chocolate Chip Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	684845.jpg	', 0, 1),
(378, 2, '	Britannia NutriChoice Cracker Simply Lite Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	821396.jpg	', 0, 1),
(379, 53, '	Nutrivalue Dibeck Health Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	115977.jpg	', 0, 0),
(380, 53, '	Sunfeast Dark Fantasy Yumfills Cake	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	736831.jpg	', 0, 0),
(381, 53, '	Threptin Diskettes - Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	482544.jpg	', 0, 0),
(382, 2, '	Britannia Nice Time Coconut Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	152408.jpg	', 0, 1),
(383, 53, '	Unibic Choco Chip Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	59896.jpg	', 0, 0),
(384, 53, '	Threptin Diskettes	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	604288.jpg	', 0, 0),
(385, 53, '	Unibic Choco Kiss Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	659273.jpg	', 0, 0),
(386, 53, '	Dukes Waffy Strawberry Roll	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	598992.jpg	', 0, 0),
(387, 53, '	Unibic Fruit & Nut Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	251036.jpg	', 0, 0),
(388, 2, '	Britannia Little Hearts Classic	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	424174.jpg	', 0, 1),
(389, 53, '	Dukes Waffy Pineapple Flavoured Wafer Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	97169.jpg	', 0, 0),
(390, 53, '	Dukes Waffy Vanilla Flavoured Wafer Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	59262.jpg	', 0, 0),
(391, 53, '	Unibic Cashew Badam Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	949467.jpg	', 0, 0),
(392, 53, '	Pickwick Creamy Wafer Biscuits - Orange	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	410049.jpg	', 0, 0),
(393, 53, '	Unibic Choco Nut Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	139059.jpg	', 0, 0),
(394, 53, '	Cadbury Bourn Vita Choco Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	190105.jpg	', 0, 0),
(396, 53, '	Kwality Pista Badam Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	662795.jpg	', 0, 0),
(397, 2, '	Britannia Good Day Chocochip Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	657852.jpg	', 0, 1),
(398, 53, '	Patanjali Doodh Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	481347.jpg	', 0, 0),
(399, 53, '	Unibic Cashew Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	17355.jpg	', 0, 0),
(400, 0, '	Patanjali Nariyal Biscuit	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	999152.jpg	', 0, 1),
(401, 53, '	Sunfeast Nice Sugar Sprinkled Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	964435.jpg	', 0, 0),
(402, 53, '	Kwality Kajoo Shrewsbury Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	704054.jpg	', 0, 0),
(403, 53, '	Dukes Waffy Choco Roll	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	981437.jpg	', 0, 0),
(404, 53, '	Kwality Royal Nankhatai	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	974534.jpg	', 0, 0),
(405, 2, '	Parle-G Original Gluco Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	706858.jpg	', 0, 1),
(406, 53, '	Tosita Jeera Khari	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	705664.jpg	', 0, 0),
(407, 2, '	Parle-G Gold Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	520585.jpg	', 0, 1),
(408, 2, '	Britannia Milk Bikis Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	30704.jpeg	', 0, 1),
(409, 53, '	Tosita Multi Grain Rusk	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	766385.jpg	', 0, 0),
(410, 2, '	Britannia Vita Marie Gold Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	864716.jpg	', 0, 1),
(412, 2, '	Britannia Marie Gold Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	783916.jpg	', 0, 1),
(413, 53, '	Kwality Golden Toast	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	631572.jpeg	', 0, 0),
(414, 2, '	Parle Marie Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	794810.jpg	', 0, 1),
(416, 53, '	Sunfeast Marie Light Biscuit	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	115970.jpg	', 0, 0),
(417, 2, '	Parle Monaco Classic Regular Biscuit	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	831506.jpg	', 0, 1),
(418, 2, '	Parle Krack Jack Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	920521.jpg	', 0, 1),
(419, 2, '	Britannia 50-50 Maska Chaska Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	197772.jpg	', 0, 1),
(420, 53, '	Kwality Wine Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	96482.jpeg	', 0, 0),
(421, 53, '	Royal Fresh Elaichi Toast	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	952719.jpg	', 0, 0),
(422, 53, '	Royal Maska Khari	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	553920.jpg	', 0, 0),
(423, 53, '	Britannia Toastea Premium Bake Rusk	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	114716.jpg	', 0, 0),
(424, 53, '	Unibic Oatmeal Digestive Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	515745.jpg	', 0, 0),
(425, 53, '	Sunfeast Farmlite 5 Grain Digestive Biscuit	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	968191.jpg	', 0, 0),
(426, 2, '	Britannia NutriChoice Digestive Hi-Fibre Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	908810.jpg	', 0, 1),
(427, 53, '	Sunfeast Dark Fantasy Choco Fills Luxuria	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	287105.jpg	', 0, 0),
(428, 53, '	Britannia Treat Bourbon Choco Fills	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	794450.jpg	', 0, 0),
(429, 53, '	Sunfeast Dark Fantasy Choco Fills Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	64261.jpg	', 0, 0),
(430, 2, '	Britannia Bourbon Chocolate Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	685640.jpg	', 0, 1),
(431, 2, '	Britannia Pure Magic Chocolush	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	153661.jpg	', 0, 1),
(432, 2, '	Britannia Treat Jim-Jam Cream Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	121093.jpg	', 0, 1),
(433, 53, '	Cadbury Oreo Cadbury Dipped	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	923465.jpg	', 0, 0),
(434, 53, '	Lotte Choco Pie	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	121281.jpg	', 0, 0),
(435, 53, '	Cadbury Oreo Original Chocolatey Sandwich Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	548334.jpg	', 0, 0),
(436, 2, '	Parle Hide & Seek Choco Rolls	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	293175.jpg	', 0, 1),
(437, 53, '	Britannia Pure Magic Chocolush Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	272128.jpg	', 0, 0),
(438, 53, '	Cadbury Oreo Choco Crème Chocolatey Sandwich Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	473987.jpg	', 0, 0),
(439, 0, '	Cadbury Oreo Original Biscuit - Value Pack	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	894577.jpg	', 0, 1),
(440, 53, '	Cadbury Bournvita Chocolate Cookies	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	432942.jpg	', 0, 0),
(441, 53, '	Cadbury Oreo Strawberry Crème Biscuits	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	409759.jpg	', 0, 0),
(442, 53, '	Chheda Mix Farsan	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	93892.jpg	', 0, 0),
(443, 53, '	Bikaji Bhujia	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	235004.jpg	', 0, 0),
(444, 2, '	Haldiram Bhujia Sev	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	242430.jpg	', 0, 1),
(445, 2, '	Haldiram Aloo Bhujia	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	117729.jpg	', 0, 1),
(446, 53, '	Chheda Farali Potato Chivda	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	806263.jpg	', 0, 0),
(447, 53, '	Rajam Snacks Garlic Mixture	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	615839.jpg	', 0, 0),
(448, 2, '	Haldiram Moong Dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	133380.jpg	', 0, 1),
(449, 2, '	Haldiram Khatta Meetha	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	379020.jpg	', 0, 1),
(450, 53, '	Rajam Snacks Madras Mixture	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	667516.jpg	', 0, 0),
(451, 53, '	Bikaneri Shree Ram Navratan	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	36398.jpg	', 0, 0),
(452, 53, '	Agarwal 420 All In One Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	527128.jpg	', 0, 0),
(453, 53, '	Agarwal 420 Khatta Meetha Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	129737.jpg	', 0, 0),
(454, 53, '	Agarwal 420 Ratlami Sev	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	598925.jpg	', 0, 0),
(455, 53, '	Pringles Potato Chips - Sour Cream & Onion	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	332921.jpg	', 0, 0),
(456, 53, '	Pringles Potato Chips - Original	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	373430.jpg	', 0, 0),
(457, 53, '	Chheda Golden Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	845882.jpg	', 0, 0),
(458, 53, '	Chheda Soya Snax	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	462464.png	', 0, 0),
(459, 2, '	Haldiram Moong Dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	872277.jpg	', 0, 0),
(460, 2, '	Haldiram Khatta Meetha	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	670283.jpg	', 0, 0),
(461, 53, '	Garden Diet Bhel	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	807137.jpg	', 0, 0),
(462, 53, '	Bikaji Soya Sticks	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	387392.jpg	', 0, 0),
(463, 2, '	Haldiram Mixture	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	139412.jpg	', 0, 1),
(464, 2, '	Haldiram All-In-One	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	985827.jpg	', 0, 1),
(465, 53, '	Garden Diet Chivda	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	649193.jpg	', 0, 0),
(466, 0, '	Garden Sabudana Chivda	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	970318.jpg	', 0, 1),
(467, 2, '	Lay India Magic Masala Chips	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	92743.jpg	', 0, 1),
(468, 53, '	Chheda Yellow Banana Chips	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	649022.jpg	', 0, 0),
(469, 2, '	Lay American Style Cream & Onion Flavour Chips	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	276052.jpg	', 0, 1),
(470, 53, '	Pringles Potato Chips - Sour Cream & Onion	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	542608.jpg	', 0, 0),
(471, 53, '	Pringles Potato Chips - Original	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	595046.jpg	', 0, 0),
(472, 53, '	Chheda Golden Potato Chips - Lightly Salted	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	231747.jpg	', 0, 0),
(473, 53, '	Garden Potato Chips - Premium Salted	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	526059.jpg	', 0, 0),
(474, 0, '	Pringles Potato Chips - Desi Masala Tadka	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	427627.jpg	', 0, 1),
(475, 53, '	Too Yumm Dahi Papdi Chat Multigrain Chips	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	264178.jpg	', 0, 0),
(476, 53, '	Pringles Potato Chips - Fusion Chutney	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	980415.jpg	', 0, 0),
(477, 53, '	Too Yumm Chinese Hot & Sour Multigrain Chips	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	210011.jpg	', 0, 0),
(478, 53, '	Too Yumm Tangy Tomato Multigrain Chips	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	551751.jpg	', 0, 0),
(479, 53, '	Bingo Mad Angles Tomato Madness	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	401753.jpg	', 0, 0),
(480, 53, '	Bingo Salt Sprinkled Potato Chips	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	431781.jpg	', 0, 0),
(481, 53, '	Bikaji Khatta Meetha Tana Bana	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	934584.jpg	', 0, 0),
(482, 53, '	Garden Nylon Sev	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	649620.jpg	', 0, 0),
(483, 53, '	Garden Yellow Banana Chips	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	789606.jpg	', 0, 0),
(484, 53, '	Too Yumm Karare Masala Munchy	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	886167.jpg	', 0, 0),
(485, 53, '	Too Yumm Karare Noodle Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	262123.jpg	', 0, 0),
(486, 53, '	Too Yumm Karare Chilli Achari	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	557954.jpg	', 0, 0),
(487, 53, '	McCain Chilli Garlic Potato Bites	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	543797.jpg	', 0, 0),
(488, 53, '	McCain Smiles - Crispy Happy Potatoes	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	596980.jpg	', 0, 0),
(489, 53, '	McCain French Fries - Crisp & Delicious	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	480831.jpg	', 0, 0),
(490, 53, '	McCain Aloo Tikki	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	915171.jpg	', 0, 0),
(491, 53, '	Mccain Potato Cheese Shotz	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	82011.jpg	', 0, 0),
(492, 53, '	McCain Veggie Fingers	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	40243.jpg	', 0, 0),
(493, 53, '	Mccain Smiles	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	700335.png	', 0, 0),
(494, 53, '	Mccain Smiles	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	862793.jpg	', 0, 0),
(495, 53, '	Mccain Aloo Tikki	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	990236.jpg	', 0, 0),
(496, 53, '	Mccain Chilli Garlic Potato Bites	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	710718.jpg	', 0, 0),
(497, 2, '	Kelloggs Chocos	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	455343.jpg	', 0, 1),
(498, 53, '	Kellogg Corn Flakes Original	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	227471.jpg	', 0, 0),
(499, 53, '	Kelloggs Corn Flakes with Real Almond & Honey	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	53330.jpg	', 0, 1),
(500, 2, '	Kellogg Chocos Variety Pack	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	767946.jpg	', 0, 1),
(501, 53, '	Kelloggs Special K	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	474208.jpg	', 0, 0),
(502, 2, '	Kellogg Chocos Crunchy Bites	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	778725.jpg	', 0, 1),
(503, 2, '	Kelloggs Chocos Moons & Stars	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	37200.jpg	', 0, 1),
(504, 53, '	Cadbury Choclairs Gold Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	704852.jpg	', 0, 0),
(505, 53, '	Cadbury Dairy Milk Home Treats Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	167515.jpg	', 0, 0),
(506, 53, '	Nestle Kitkat Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	696563.jpg	', 0, 0),
(507, 53, '	Amul Chocominis Chocolate Box	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	905017.jpg	', 0, 0),
(508, 53, '	Nestle Munch Share Bag	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	510416.jpg	', 0, 0),
(509, 53, '	Cadbury Dairy Milk Silk Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	182421.jpg	', 0, 0);
INSERT INTO `tbl_product` (`p_id`, `c_id`, `p_name`, `p_desc`, `p_details`, `p_image`, `p_stock`, `p_status`) VALUES
(510, 53, '	Cadbury Dairy Milk Silk Fruit & Nut Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	595724.jpg	', 0, 0),
(511, 53, '	Cadbury 5 Star Home Treat Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	193544.jpg	', 0, 0),
(512, 53, '	Cadbury Dairy Milk Silk Roast Almond Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	131057.jpg	', 0, 0),
(513, 53, '	Amul Dark Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	308672.jpg	', 0, 0),
(514, 53, '	Cadbury Perk Home Treats Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	602889.jpg	', 0, 0),
(515, 53, '	Snickers Veg Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	497597.jpg	', 0, 0),
(516, 53, '	Hershey Kisses Cookies & Crème Chocolate Pouch :	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	451005.jpg	', 0, 0),
(517, 2, '	Parle Melody Chocolaty	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	385308.jpg	', 0, 1),
(518, 53, '	Cadbury Dairy Milk Fruit & Nut Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	790942.jpg	', 0, 0),
(519, 53, '	Hershey Kisses Milk Chocolate Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	32168.jpg	', 0, 0),
(520, 53, '	Bounty Chocolate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	958526.jpg	', 0, 0),
(521, 2, '	Kissan Fresh Tomato Ketchup	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	739635.jpg	', 0, 1),
(522, 2, '	Surabhi Fresh & Rich Tomato Ketchup - No Onion No Garlic	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	985948.jpg	', 0, 1),
(523, 2, '	Del Monte Tomato Ketchup	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	457990.jpg	', 0, 1),
(524, 2, '	Maggi Rich Tomato Ketchup	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	547851.jpg	', 0, 1),
(525, 2, '	Kissan Mixed Fruit Jam	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	910994.jpg	', 0, 1),
(526, 40, '	Maggi Hot & Sweet Tomato Chilli Sauce	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"95\",\"ori_price\":\"105\"}]\r\n', '	92693.jpg	', 0, 1),
(527, 53, '	Funfoods Peanut Butter Crunchy	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	644783.jpg	', 0, 0),
(528, 2, '	Chings Red Chilli Sauce	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	714608.jpg	', 0, 1),
(529, 2, '	Chings Dark Soy Sauce	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	541238.jpg	', 0, 1),
(530, 0, '	Funfoods Peanut Butter Creamy	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	334562.jpg	', 0, 1),
(531, 2, '	Chings Green Chilli Sauce	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	84168.jpg	', 0, 1),
(532, 53, '	Funfoods Chocolate Spread Fudge	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	176587.jpg	', 0, 0),
(533, 2, '	Chings Secret Red Chilli Sauce	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	566641.jpg	', 0, 1),
(534, 2, '	Chings Schezwan Chutney	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	878482.jpg	', 0, 1),
(535, 53, '	Dabur Honey Pack	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	162624.jpg	', 0, 0),
(536, 2, '	Chings Chilli Vinegar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	765295.jpg	', 0, 1),
(537, 53, '	Funfoods Veg Mayonnaise Original	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	359466.jpg	', 0, 0),
(538, 53, '	Funfoods Veg Mayonnaise - Garlic	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	123043.jpg	', 0, 0),
(539, 53, '	Funfoods Eggless Mayonnaise for Burger	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	255111.jpg	', 0, 0),
(540, 53, '	Funfoods Pizza Topping	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	323832.jpg	', 0, 0),
(541, 53, '	Knorr Classic Thick Tomato Soup	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	328561.jpg	', 0, 0),
(542, 53, '	Knorr Classic Sweet Corn Veg Soup	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	230353.jpg	', 0, 0),
(543, 53, '	Knorr International Hong Kong Manchow Noodle Soup	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	864606.jpg	', 0, 0),
(544, 53, '	Knorr Classic Hot & Sour Veg Soup	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	959320.jpg	', 0, 0),
(545, 53, '	Knorr Classic Mixed Vegetable Soup	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	398241.jpg	', 0, 0),
(546, 2, '	Ching Hot & Sour Instant Soup	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	176552.jpg	', 0, 1),
(547, 2, '	Maggi 2-Minute Masala Noodles	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	310690.jpg	', 0, 1),
(548, 40, '	Maggi Masala Veg Atta Noodles	', '', '[{\"no\":\"1\",\"qty\":\"290\",\"unit\":\"gm\",\"dis_price\":\"75\",\"ori_price\":\"86\"},{\"no\":\"2\",\"qty\":\"560\",\"unit\":\"gm\",\"dis_price\":\"85\",\"ori_price\":\"91\"}]\r\n', '	202246.jpg	', 0, 1),
(549, 2, '	Chings Schezwan Instant Noodles	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	691836.jpg	', 0, 1),
(550, 2, '	Chings Manchurian Instant Noodles	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	882211.jpeg	', 0, 1),
(551, 2, '	Chings Hot Garlic Instant Noodles	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	156741.jpg	', 0, 1),
(552, 2, '	Sunfeast Yippee Noodles Magic Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	669742.jpg	', 0, 1),
(553, 2, '	Chings Veg Hakka Noodles	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	513838.jpg	', 0, 1),
(554, 53, '	Sunfeast Yippee Masala Pasta	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	580058.jpg	', 0, 1),
(555, 53, '	Chandan Anardana Punch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	980567.jpg	', 0, 0),
(556, 53, '	Chandan Mango Tango	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	16615.jpg	', 0, 0),
(557, 53, '	Royal Udad Papad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	916984.jpg	', 0, 0),
(558, 53, '	Chandan Bor Berry	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	27224.jpg	', 0, 0),
(559, 53, '	Ganesh Bikaneri Special Moong Papad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	330253.jpg	', 0, 0),
(560, 53, '	Chandan Grape Tangy	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	626025.jpg	', 0, 0),
(561, 53, '	Ganesh Mini Udad Papad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	865902.jpg	', 0, 0),
(562, 53, '	Chandan Mango Seeds Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	684524.jpeg	', 0, 0),
(563, 53, '	Ganesh Chana Masala Papad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	186964.jpg	', 0, 0),
(564, 0, '	Chandan Peru Vati	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	183592.jpg	', 0, 1),
(565, 53, '	Ganesh Punjabi Masala Papad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	202427.jpg	', 0, 0),
(566, 53, '	Haldirams Rasgulla	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	251269.jpg	', 0, 1),
(567, 2, '	Haldirams Soan Papdi	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	996351.jpeg	', 0, 1),
(568, 53, '	Ganesh Garlic Papad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	196001.jpg	', 0, 0),
(569, 53, '	Ganesh Rice Crispie Red Chilli Papad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	613263.jpg	', 0, 0),
(570, 2, '	Bikaji Rasgulla Gol-Matol	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	218884.jpg	', 0, 1),
(571, 2, '	Haldirams Gulab Jamun	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	991739.jpg	', 0, 1),
(572, 53, '	Bikaneri Mahesh Papad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	489327.jpg	', 0, 0),
(573, 2, '	Bikaji Gulab Jamun Gol-M-Gol	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	106365.jpg	', 0, 1),
(574, 53, '	MTR Rava Idli Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	969434.jpg	', 0, 0),
(575, 53, '	Royal Gulab Jamun	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	680825.jpg	', 0, 0),
(576, 53, '	MTR 3 Minute Breakfast Regular Poha	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	690105.jpg	', 0, 0),
(577, 53, '	Amul Kaju Katri	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	945739.jpg	', 0, 0),
(578, 53, '	MTR Multigrain Dosa Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	109909.jpg	', 0, 0),
(579, 53, '	Bikaneri Madhuras Rasgulla	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	696314.jpg	', 0, 0),
(580, 53, '	Adbhut Royal Rasgulla	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	877825.jpg	', 0, 0),
(581, 53, '	ORIENTAL DATES	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	61DapncJjKL._SY550_.jpg	', 0, 0),
(582, 53, '	MTR Dosa Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	329709.png	', 0, 0),
(583, 53, '	MTR Rava Dosa Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	287000.jpg	', 0, 0),
(584, 64, '	Surf Excel Easy Wash Detergent Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	157782.jpg	', 0, 1),
(585, 64, '	Surf Excel Matic Top Load Detergent Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	674204.jpg	', 0, 1),
(586, 64, '	Surf Excel Matic Front Load Detergent Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	374692.jpg	', 0, 1),
(587, 64, '	Tide Plus Detergent Powder - Jasmine & Rose	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	393259.jpg	', 0, 1),
(588, 64, '	Rin Detergent Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	546263.jpg	', 0, 1),
(589, 64, '	Rin Ala Fabric Whitener	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	203581.jpg	', 0, 1),
(590, 64, '	Tide Plus Detergent Powder - Lemon & Mint	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	401043.jpg	', 0, 1),
(591, 64, '	Ariel Complete Detergent	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	309761.jpg	', 0, 1),
(592, 64, '	Ariel Matic Top Load Detergent Washing Powder With Container	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	591808.jpg	', 0, 1),
(593, 64, '	Comfort After Wash Morning Fresh Fabric Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	118235.jpg	', 0, 1),
(594, 64, '	Surf Excel Quick Wash Detergent Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	119240.jpg	', 0, 1),
(595, 64, '	Rin Detergent Bar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	598668.jpg	', 0, 1),
(596, 64, '	Surf Excel Detergent Bar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	786765.jpg	', 0, 1),
(597, 64, '	Ariel Matic Front Load Detergent Washing Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	357554.jpg	', 0, 1),
(598, 53, '	MTR Rice Idli Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	665667.jpg	', 0, 0),
(599, 64, '	Surf Excel Matic Liquid Detergent Top Load	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	597830.jpg	', 0, 1),
(600, 64, '	Comfort After Wash Lily Fresh Fabric Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	812112.jpg	', 0, 1),
(601, 64, '	Comfort After Wash Anti Bacterial Fabric Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	517694.jpg	', 0, 1),
(602, 53, '	MTR Upma Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	997021.jpg	', 0, 0),
(603, 53, '	MTR Vada Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	698954.jpg	', 0, 0),
(604, 64, '	Ariel Matic Liquid Detergent	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	729746.jpeg	', 0, 1),
(605, 64, '	Wheel Active Lemon & Jasmine Detergent Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	799972.jpg	', 0, 1),
(606, 53, '	MTR Khaman Dhokla Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	813302.jpg	', 0, 0),
(607, 0, '	Vanish Liquid Stain Remover	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	103190.jpg	', 0, 1),
(608, 64, '	Rin Refresh Lemon & Rose Detergent Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	210099.jpg	', 0, 1),
(609, 53, '	MTR Gulab Jamun Ready Mix	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	793897.jpg	', 0, 0),
(610, 64, '	Henko Stain Champion Oxygen Power Washing Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	453402.jpg	', 0, 1),
(611, 64, '	Wheel Active Blue Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	614026.jpg	', 0, 1),
(612, 64, '	Godrej Ezee Liquid Detergent	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	877378.jpg	', 0, 0),
(613, 53, '	Dabur Chyawanprash Awaleha	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	348003.jpg	', 0, 0),
(614, 64, '	Tide Naturals Detergent Powder Lemon & Chandan	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	569821.jpg	', 0, 1),
(615, 64, '	Henko Matic Lintelligent Top Load Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	749501.jpg	', 0, 1),
(616, 64, '	Threptin Diskettes - Vanilla	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	873717.jpg	', 0, 0),
(617, 64, '	Ghadi Detergent Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	713597.jpg	', 0, 1),
(618, 64, '	Comfort Fabric Conditioner Lily Fresh Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	823782.jpg	', 0, 1),
(619, 64, '	Ariel Colour Detergent Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	229874.jpg	', 0, 1),
(620, 53, '	Baidyanath Sugarfree Chyawan-Fit	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	268911.png	', 0, 0),
(621, 53, '	Baidyanath Chyawanprash Special	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	408668.jpg	', 0, 0),
(622, 53, '	Lijjat Urad Papad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	954331.jpg	', 0, 0),
(623, 53, '	Lijjat Moong Papad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	139436.jpg	', 0, 0),
(624, 53, '	lijjat black pepper papad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	879127.jpg	', 0, 0),
(625, 53, '	Mothers Recipe Mango Pickle - Jar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	60916.jpg	', 0, 0),
(626, 53, '	Pravin Mango Pickle	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	736622.jpg	', 0, 0),
(627, 0, '	Shree Siddhivinayak Mango Pickle	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	757730.jpg	', 0, 1),
(628, 53, '	Pravin Mango Pickle Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	965763.jpg	', 0, 0),
(629, 53, '	Mothers Recipe Mango Pickle	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	296524.jpg	', 0, 0),
(630, 2, '	Kubal Mango Pickle Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	749977.jpg	', 0, 1),
(631, 2, '	Kubal Lime Pickle Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	371553.jpg	', 0, 1),
(632, 53, '	Mothers Recipe Mixed Pickle Jar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	747095.jpg	', 0, 0),
(633, 0, '	Shree Siddhivinayak Mixed Pickle	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	950364.jpg	', 0, 1),
(634, 53, '	Mothers Recipe Mixed Pickle Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	467166.jpg	', 0, 0),
(635, 53, '	Jain DLS Marwadi Mirchi Green Pickle	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	903952.jpg	', 0, 0),
(636, 0, '	Mothers Recipe Gujarati Choondo Pickle	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	479357.jpg	', 0, 1),
(637, 64, '	Sunny Premium Green Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	152232.jpg	', 0, 1),
(638, 64, '	Phenox Strong Disinfectant Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	586278.jpg	', 0, 1),
(639, 64, '	Lizol Disinfectant Surface Cleaner - Floral	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	10523.jpg	', 0, 1),
(640, 64, '	Lizol Disinfectant Surface Cleaner - Citrus	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	401377.jpg	', 0, 1),
(641, 64, '	Sparkle Disinfectant Floor Cleaner - Citrus	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	972660.jpg	', 0, 1),
(642, 64, '	Kli-nol Premium Concentrate Floor Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	640249.jpg	', 0, 1),
(643, 64, '	Sparkle Disinfectant Floor Cleaner - Lavender	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	283402.jpg	', 0, 1),
(644, 64, '	Glito 3 In 1 Perfumed Floor-Surface-Dish Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	293878.jpg	', 0, 1),
(645, 0, '	Domex Disinfectant Floor Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	754432.jpg	', 0, 1),
(646, 64, '	Harpic Bathroom Cleaner - Floral	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	604049.jpg	', 0, 0),
(647, 64, '	Glito Lime Perfumed Floor Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	463380.jpg	', 0, 1),
(648, 64, '	Sparkle Disinfectant Floor Cleaner - Floral	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	780751.jpeg	', 0, 1),
(649, 64, '	Glito Jasmine Bliss Floor Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	966434.jpg	', 0, 1),
(650, 64, '	Glito Exotic Rose Perfumed Floor Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	411416.jpg	', 0, 1),
(651, 64, '	Sparkle Citrus Disinfectant Floor Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	374287.jpg	', 0, 0),
(652, 64, '	Sparkle Floral Disinfectant Floor Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	871469.jpg	', 0, 0),
(653, 64, '	Mr Muscle Citrus Floor Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	642340.jpg	', 0, 1),
(654, 64, '	Mr Muscle Floral Floor Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	784239.jpg	', 0, 1),
(655, 64, '	Wipro Maxkleen Disinfectant Floor Cleaner - Citrus Joy	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	228032.jpg	', 0, 1),
(656, 64, '	Wipro Maxkleen Disinfectant Floor Cleaner - Floral Bliss	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	116557.jpg	', 0, 1),
(657, 64, '	Harpic Power Plus Toilet Cleaner - Original	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	876588.jpg	', 0, 1),
(658, 64, '	Harpic Bathroom Cleaner Lemon	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	297206.jpg	', 0, 1),
(660, 64, '	Colin Glass Cleaner Pump	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	59523.jpg	', 0, 1),
(661, 64, '	Colin Glass Cleaner Refill Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	760875.jpg	', 0, 1),
(662, 64, '	Harpic Bathroom Cleaner- Floral	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	286249.jpg	', 0, 1),
(663, 64, '	Mr. Muscle Kiwi Dranex Drain Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	86692.jpg	', 0, 1),
(664, 64, '	Drenfix Drain Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	364793.jpg	', 0, 1),
(665, 64, '	Wipro Maxkleen Disinfectant Surface Sanitizer	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	875973.jpg	', 0, 1),
(666, 64, '	Force 10 Power Max Toilet Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	920822.jpg	', 0, 1),
(667, 64, '	Domex Original Toilet Cleaner Expert	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	926649.jpg	', 0, 1),
(668, 64, '	Harpic Flushmatic Twin Aquamarine	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	860698.jpg	', 0, 1),
(669, 64, '	Harpic Flushmatic Twin Pine	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	808392.jpg	', 0, 1),
(670, 64, '	Domex Ocean Fresh & Clean Toilet Cleaner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	555331.jpg	', 0, 1),
(674, 2, '	Chana dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	886346.jpg	', 0, 1),
(675, 2, '	Moong dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	883196.jpg	', 0, 1),
(676, 2, '	Toor Dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	257947.jpg	', 0, 1),
(677, 2, '	Urad dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	686289.jpg	', 0, 1),
(678, 2, '	Masoor Dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	358513.jpg	', 0, 1),
(679, 2, '	Daliya	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	310282.jpg	', 0, 1),
(680, 2, '	Mix Dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	351796.jpg	', 0, 1),
(681, 2, '	Chana dal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	738297.jpg	', 0, 1),
(682, 2, '	Rajma (Red)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	957629.jpg	', 0, 1),
(683, 2, '	Soyabean	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	981023.jpg	', 0, 0),
(684, 2, '	Kabuli Chana	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	973865.jpg	', 0, 1),
(685, 2, '	Vatana (Green)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	424843.png	', 0, 1),
(686, 2, '	Kulthi (Horse Gram)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	589071.jpg	', 0, 0),
(687, 2, '	Peanuts Raw (Sengdana)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	450420.jpg	', 0, 1),
(688, 2, '	Small Chana (Brown)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	429945.jpg	', 0, 1),
(689, 2, '	Urad Pulses (White)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	127780.jpg	', 0, 0),
(690, 2, '	Moong Pulses	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	16725.jpg	', 0, 1),
(691, 2, '	Masoor (Whole)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	759452.jpg	', 0, 0),
(692, 2, '	Almonds(Badam)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	17022.jpg	', 0, 1),
(693, 2, '	Cashew(Kaju)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	155270.jpeg	', 0, 1),
(694, 2, '	Pista	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	118763.jpeg	', 0, 1),
(695, 2, '	Dates	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	108348.jpeg	', 0, 1),
(696, 2, '	Raisin(Kismis)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	203912.jpg	', 0, 1),
(697, 2, '	Walnuts(without shell)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	656884.jpeg	', 0, 1),
(698, 2, '	Apricot	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	apricot1.jpg	', 0, 0),
(699, 2, '	Mixed Nuts	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	335869.jpg	', 0, 1),
(700, 2, '	Charoli	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	362759.jpg	', 0, 1),
(701, 2, '	Makhana	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	887365.jpg	', 0, 1),
(702, 53, '	ORIENTAL DATES	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	61DapncJjKL._SY550_.jpg	', 0, 0),
(704, 64, '	Vim Dishwash Bar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	45651.jpg	', 0, 1),
(705, 64, '	Vim Dishwash Gel Lemon	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	557273.jpg	', 0, 1),
(706, 64, '	Vim Extra Anti Smell Dishwash Bar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	597856.jpg	', 0, 1),
(707, 64, '	Gala Kitchen Sponge Wipe	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	398694.jpg	', 0, 1),
(708, 64, '	Pitambari Shining Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	661050.jpg	', 0, 1),
(710, 64, '	Pril Lime Dishwash Liquid	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	673198.jpg	', 0, 1),
(711, 64, '	Gala Swash Stain Steel Scourer	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	922906.jpg	', 0, 1);
INSERT INTO `tbl_product` (`p_id`, `c_id`, `p_name`, `p_desc`, `p_details`, `p_image`, `p_stock`, `p_status`) VALUES
(712, 64, '	Gala Scrub Pad	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	712276.jpg	', 0, 1),
(713, 64, '	Glito Lime Dishwash Concentrate	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	601895.jpeg	', 0, 1),
(714, 0, '	Pril Dishwash Bar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	9858.jpg	', 0, 1),
(715, 64, '	Pril Perfect Tamarind Dishwash Liquid	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	153802.jpg	', 0, 1),
(716, 64, '	Scotch Brite Steel Scrubber	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	978126.jpg	', 0, 1),
(717, 64, '	Scotch Brite Silver Spark Scrub Pads	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	470132.jpg	', 0, 1),
(718, 71, '	Dettol Original Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	136371.jpg	', 0, 1),
(719, 71, '	Pears Pure & Gentle Soap Bar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	813779.jpg	', 0, 1),
(720, 71, '	Mild & Clear Soap with Glycerin	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	193543.jpg	', 0, 1),
(721, 71, '	Medimix Ayurvedic Classic 18 Herbs Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	402859.jpg	', 0, 1),
(722, 71, '	Dove Cream Beauty Bathing Bar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	608769.jpg	', 0, 1),
(723, 71, '	Lux Soft Touch French Rose and Almond Oil Soap Bar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	682249.jpg	', 0, 1),
(724, 71, '	Cinthol Lime Refreshing Deo Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	950056.jpg	', 0, 1),
(725, 71, '	Pears Soft & Fresh Soap Bar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	774573.jpg	', 0, 1),
(726, 71, '	Mild & Clear Skinguard Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	610958.jpg	', 0, 1),
(727, 71, '	Godrej No. 1 Lime & Aloe Vera Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	578068.jpg	', 0, 1),
(728, 71, '	Lux Velvet Touch Jasmine & Almond	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	765937.jpg	', 0, 1),
(729, 71, '	Cinthol Cool Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	110053.jpg	', 0, 1),
(730, 71, '	Medimix Ayurvedic Sandal Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	466599.jpg	', 0, 1),
(731, 71, '	Dettol Intense Cool 2X Menthol Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	498775.jpg	', 0, 1),
(732, 71, '	Santoor Sandal & Turmeric Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	825697.jpg	', 0, 1),
(733, 71, '	Chandan Sparsh Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	697237.jpg	', 0, 1),
(734, 71, '	Cinthol Original Deodorant & Complexion Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	81547.jpg	', 0, 1),
(735, 71, '	Patanjali Neem Kanti Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	978034.jpg	', 0, 1),
(736, 71, '	Patanjali Haldi Chandan Kanti Soap	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	582299.jpg	', 0, 1),
(737, 71, '	Nivea Aloe Hydration Body Lotion	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	580835.jpg	', 0, 1),
(738, 71, '	Fair & Lovely Advanced Multi Vitamin Cream	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	861809.jpg	', 0, 1),
(739, 71, '	Vaseline Intensive Care Deep Restore Body Lotion	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	676303.jpg	', 0, 1),
(740, 71, '	Vicco Turmeric Skin Cream	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	800523.jpg	', 0, 1),
(741, 71, '	Nivea Body Milk Nourishing Lotion	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	916681.jpg	', 0, 1),
(742, 71, '	Bio-Oil Skin Care	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	6178.jpg	', 0, 1),
(743, 71, '	Fair & Lovely Mens Instant Fairness Cream	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	119003.jpg	', 0, 1),
(744, 71, '	Lacto Calamine Oil Balance Lotion For Oily Skin	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	314017.jpeg	', 0, 1),
(745, 71, '	Ponds White Beauty Fairness BB+ Cream SPF 30 PA++	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	163845.jpg	', 0, 0),
(746, 71, '	Mirabelle Papaya Fairness Facial No.1 K-Mask	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	176315.jpg	', 0, 1),
(747, 71, '	Lacto Calamine Oil Balance Lotion For Normal Skin	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	128012.jpg	', 0, 1),
(748, 71, '	Lakme Sun Expert SPF24 PA++ UV Lotion	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	9181.jpg	', 0, 1),
(749, 71, '	Vaseline Intensive Care Aloe Soothe Body Lotion	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	899764.jpg	', 0, 1),
(750, 71, '	Himalaya Purifying Neem Face Wash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	750032.jpg	', 0, 1),
(751, 71, '	Clean & Clear Foaming Facewash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	809144.jpg	', 0, 1),
(752, 71, '	Nivea Men All-In-One Charcoal Facewash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	295839.jpg	', 0, 1),
(753, 71, '	Everyuth Naturals Exfoliating Walnut Scrub	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	574405.jpg	', 0, 1),
(754, 71, '	Garnier Men Acno-Fight 6-In-1 Anti-Pimple Facewash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	173392.jpg	', 0, 1),
(755, 71, '	Khadi Natural (Paraben Free) Aloe Vera Herbal Facewash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	270732.jpg	', 0, 1),
(756, 71, '	Ponds Pure White Anti-Pollution + Purity Face Wash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	164241.jpg	', 0, 0),
(757, 71, '	Pears Pure & Gentle Facewash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	570233.jpg	', 0, 1),
(758, 71, '	Garnier Men Oil Clear Deep Cleansing Facewash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	527532.jpg	', 0, 1),
(759, 71, '	Parachute Coconut Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	828586.jpg	', 0, 0),
(760, 0, '	Beardo Activated Charcoal Face Wash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	946221.jpg	', 0, 1),
(761, 71, '	Beardo Activated Charcoal Peel Off Mask	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	535002.jpg	', 0, 1),
(762, 71, '	Fair & Lovely Fairness Facewash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	568883.jpg	', 0, 1),
(763, 71, '	Emami Fair And Handsome Cream For Men	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	237253.jpg	', 0, 1),
(764, 71, '	Coconourish Coconut Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	287182.jpg	', 0, 0),
(765, 71, '	Ponds Dreamflower Fragrant Talcum Powder - Pink Lily	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	572878.jpg	', 0, 1),
(766, 71, '	Ponds Magic Freshness Talcum Powder - Acacia Honey	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	629509.jpg	', 0, 1),
(767, 71, '	Indulekha Bringha Ayurvedic Hair Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	286911.jpg	', 0, 0),
(768, 71, '	Nivea Musk Body Talcum Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	986029.jpg	', 0, 1),
(769, 71, '	Parachute Advansed Aloe Vera Coconut Hair Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	241068.jpg	', 0, 0),
(770, 2, '	Bajaj Almond Drops Hair Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	162385.jpg	', 0, 1),
(771, 71, '	Navratna Ayurvedic Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	103532.jpg	', 0, 0),
(772, 71, '	Parachute Advanced Jasmine Hair Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	916727.jpg	', 0, 0),
(773, 71, '	Dabur Amla Hair Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	232432.jpg	', 0, 0),
(774, 71, '	Yardley English Lavender Talcum Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	34667.jpg	', 0, 1),
(775, 71, '	Yardley London Gold Deodorising Talcum Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	933984.jpg	', 0, 1),
(776, 71, '	Nivea Pure Talcum Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	438431.jpg	', 0, 1),
(777, 71, '	Grace Sandalwood Perfume Talc	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	960299.jpg	', 0, 1),
(778, 71, '	Grace Perfumed Talcum Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	140114.jpg	', 0, 1),
(779, 71, '	Ponds Starlight Talc	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	485115.jpg	', 0, 1),
(780, 71, '	Grace Charm Perfume Talc	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	555638.jpg	', 0, 1),
(781, 71, '	Nivea Men Active Clean Shower Gel	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	752691.jpg	', 0, 1),
(782, 71, '	Nivea Fresh Pure Care Shower Gel	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	374478.jpg	', 0, 1),
(783, 71, '	Fiama Bearberry and Blackcurrant Shower Gel	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	304114.jpg	', 0, 1),
(784, 71, '	Fiama Peach & Avocado Shower Gel	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	468916.jpg	', 0, 1),
(785, 71, '	Fiama Di Wills Lemongrass & Jojoba Shower Gel	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	172848.jpg	', 0, 1),
(786, 71, '	Dove Deeply Nourishing Body wash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	385916.jpg	', 0, 1),
(787, 71, '	Nivea Waterlily & Oil Shower Gel	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	854299.jpg	', 0, 1),
(788, 71, '	Fiama Patchouli & Macadamia Shower Gel	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	795526.jpg	', 0, 1),
(789, 71, '	Lakme Sun Expert SPF30 PA++ Ultra Matte Lotion	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	59153.jpg	', 0, 1),
(790, 71, '	Lakme Sun Expert SPF30 PA++ Ultra Mate Lotion	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	426072.jpg	', 0, 1),
(791, 71, '	Vaseline Lip Care Total Moisture	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	880704.jpg	', 0, 1),
(792, 71, '	Colgate Strong Teeth Calci-Lock Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	198795.jpg	', 0, 1),
(793, 71, '	Colgate MaxFresh Spicy Fresh Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	792065.jpg	', 0, 1),
(794, 71, '	Colgate Total Advanced Health Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	252017.jpg	', 0, 1),
(795, 71, '	Closeup Ever Fresh Red Hot Gel Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	996632.jpg	', 0, 1),
(796, 71, '	Patanjali Dant Kanti Dental Cream	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	747138.jpg	', 0, 1),
(797, 71, '	Sesa Ayurvedic Hair Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	496739.jpg	', 0, 0),
(798, 71, '	Dabur Almond Hair Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	959358.jpg	', 0, 0),
(799, 71, '	Dabur Almond Hair Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	886610.jpg	', 0, 0),
(800, 71, '	Emami Navratna Ayurvedic Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	255686.jpg	', 0, 0),
(801, 71, '	Loreal Paris Total Repair 5 Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	444117.jpg	', 0, 0),
(803, 71, '	Baidyanath Maha Bhringhraj Tel	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	647465.jpg	', 0, 0),
(804, 71, '	Dove Hair Fall Rescue Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	889872.jpg	', 0, 0),
(805, 71, '	Dove Daily Shine Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	69841.jpg	', 0, 0),
(806, 71, '	Dove Intense Repair Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	867906.jpg	', 0, 0),
(807, 71, '	Sunsilk Stunning Black Shine Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	533464.jpg	', 0, 0),
(808, 71, '	Sunsilk Lusciously Thick & Long Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	524422.jpg	', 0, 0),
(809, 71, '	Clinic Plus Strong & Long Health Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	825806.jpg	', 0, 0),
(810, 71, '	Head & Shoulders Anti-Dandruff Smooth & Silky Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	211186.jpg	', 0, 0),
(811, 71, '	Indulekha Bringha Anti Hairfall Hair Cleanser Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	47604.jpg	', 0, 0),
(812, 71, '	Head & Shoulders Anti-Hairfall Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	78680.jpg	', 0, 0),
(813, 71, '	Head & Shoulders Cool Menthol Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	934537.jpg	', 0, 0),
(814, 71, '	LOreal Paris Fall Resist 3X Anti-Hair Fall Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	61699.jpg	', 0, 0),
(815, 71, '	Johnson Baby no more tears Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	300951.jpg	', 0, 0),
(816, 71, '	TRESemme Keratin Smooth Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	89571.jpg	', 0, 0),
(817, 71, '	TRESemme Hair Fall Defense Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	525469.jpg	', 0, 0),
(818, 71, '	TRESemme Smooth & Shine Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	832022.jpg	', 0, 0),
(819, 71, '	Pantene Pro-V Hair Fall Control Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	299971.jpg	', 0, 0),
(820, 71, '	Himalaya Anti-Dandruff tea tree Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	613122.jpg	', 0, 0),
(821, 71, '	Dove Oxygen Moisture Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	871513.jpg	', 0, 0),
(822, 71, '	Clinic Plus Strong & Extra Thick Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	231460.jpg	', 0, 0),
(823, 71, '	Kesh King Anti Hairfall Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	794342.jpg	', 0, 0),
(824, 71, '	Himalaya Gentle Daily Care Protein Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	876282.jpg	', 0, 0),
(825, 0, '	Himalaya Gentle Baby Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	977302.jpg	', 0, 1),
(826, 71, '	Sunsilk Nourishing Soft & Smooth Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	857478.jpg	', 0, 0),
(827, 71, '	LOreal Paris 6 Oil Nourish Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	299397.jpg	', 0, 0),
(828, 71, '	Park Avenue Beer Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	894741.jpg	', 0, 0),
(829, 71, '	TRESemme Botanique Nourish & Replenish Shampoo	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	430652.jpg	', 0, 0),
(830, 71, '	Dove Daily Shine Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	800213.jpg	', 0, 0),
(831, 71, '	Dove Intense Repair Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	251371.jpg	', 0, 0),
(832, 71, '	Pantene Pro-V Hairfall Control Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	174123.jpg	', 0, 0),
(833, 69, '	Godrej Expert Rich Creme Hair Colour 3 Black Brown	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	547213.jpg	', 0, 0),
(834, 71, '	Livon Hair Serum	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	807078.jpg	', 0, 0),
(835, 69, '	TRESemme Keratin Smooth Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	309337.jpg	', 0, 0),
(836, 71, '	Dove Hairfall Rescue Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	966644.jpg	', 0, 0),
(837, 71, '	Livon Shake & Spray Hair Serum	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	88442.jpg	', 0, 0),
(838, 71, '	TRESemme Hairfall Defense Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	159162.jpg	', 0, 0),
(839, 71, '	TRESemme Smooth & Shine Conditioner 0	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	591563.jpg	', 0, 0),
(840, 69, '	TRESemme Hair Spa Rejuvenation Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	433261.jpg	', 0, 0),
(841, 71, '	Pantene Pro-V Silky Smooth Care Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	571223.jpg	', 0, 0),
(842, 71, '	LOreal Paris Colour Protect Conditioner	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	287774.jpg	', 0, 0),
(843, 71, '	LOreal Casting Creme Gloss 400 Dark Brown Hair Colour	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	103134.jpg	', 0, 0),
(844, 71, '	Garnier Color Naturals 1 Black Hair Colour	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	556716.jpg	', 0, 0),
(845, 71, '	Godrej Nupur Henna	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	909550.jpg	', 0, 0),
(846, 71, '	Godrej Expert Rich Creme Natural Black 1 Hair Colour	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	42117.jpg	', 0, 0),
(847, 0, '	Godrej Expert Rich Creme Natural Brown 4 Hair Colour	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	363637.jpg	', 0, 1),
(848, 71, '	Garnier Brown Black 3.0 Natural Cream Colour	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	915732.jpg	', 0, 0),
(849, 71, '	Indica Easy Natural Black 1 Hair Color	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	699955.jpg	', 0, 0),
(850, 71, '	Garnier Original Black 2.0 Natural Cream Colour	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	26185.jpg	', 0, 0),
(851, 71, '	Indica Easy Dark Brown 3 Hair Color	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	438317.jpg	', 0, 0),
(852, 71, '	Kamasutra Spark Men Deodorant	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	996156.jpg	', 0, 0),
(853, 71, '	Park Avenue Signature Voyage Perfume Spray	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	10943.jpg	', 0, 0),
(854, 71, '	Fogg Marco Fragrance Body Spray	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	886651.jpg	', 0, 0),
(855, 71, '	Fogg Extreme Fragrance Body Spray	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	737446.jpg	', 0, 0),
(856, 71, '	Fogg Napoleon Fragrance Body Spray	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	820681.jpg	', 0, 0),
(857, 71, '	Park Avenue Cool Blue Deodorant	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	341682.jpg	', 0, 0),
(858, 71, '	Fogg Dynamic Fragrance Body Spray	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	431791.jpg	', 0, 0),
(859, 71, '	Wild Stone Ultra Sensual Perfume	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	30705.jpg	', 0, 0),
(860, 71, '	Axe Dark Temptation Deodorant Body Spray	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	707729.jpg	', 0, 0),
(861, 71, '	Axe Signature Rogue Body Perfume	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	576928.jpg	', 0, 0),
(862, 71, '	Fogg Fresh Aromatic Body Spray	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	474247.jpg	', 0, 0),
(863, 69, '	Axe Signature Intense Body	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	811442.jpg	', 0, 0),
(864, 71, '	Wild Stone Hydra Energy Perfume	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	984451.jpg	', 0, 0),
(865, 71, '	Fogg Scent Xtremo Perfume	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	662694.jpg	', 0, 0),
(866, 71, '	Axe Signature Mysterious Body	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	305085.jpg	', 0, 0),
(867, 71, '	Fogg Scent Xpressio Perfume	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	659520.jpg	', 0, 0),
(868, 71, '	Wild Stone Red Deodorant	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	391154.jpg	', 0, 0),
(869, 69, '	Wild Stone Ultra Sensual Deodorant	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	784736.jpg	', 0, 0),
(870, 71, '	Adidas Pure Game Eau De Toilette Natural Spray	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	176606.jpg	', 0, 0),
(871, 71, '	Park Avenue Storm Deodorant	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	620702.jpg	', 0, 0),
(872, 71, '	Wild Stone Forest Spice Perfume	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	584258.jpg	', 0, 0),
(873, 71, '	Kamasutra Triple XXX Deodorant	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	948744.jpg	', 0, 0),
(874, 71, '	Set Wet Spunky Avatar Perfume Spray	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	858242.jpg	', 0, 0),
(875, 0, '	Axe Signature Intense Ticket Perfume:	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	632670.jpg	', 0, 1),
(876, 71, '	Kamasutra Single X Deodorant	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	656672.jpg	', 0, 0),
(877, 69, '	Axe Signature Gold Dark Vanilla Perfume	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	887837.jpg	', 0, 0),
(878, 71, '	Axe Signature Iced Vetiver Perfume	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	140104.jpg	', 0, 0),
(879, 71, '	Set Wet Funky Avatar Perfume Spray	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	662813.jpg	', 0, 0),
(880, 69, '	Nivea Whitening Smooth Skin Roll-On	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	852792.jpg	', 0, 0),
(881, 71, '	Nivea Whitening Smooth Skin Deodorant	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	223548.jpg	', 0, 0),
(882, 71, '	Engage Blush Women Deodoran	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	92444.jpg	', 0, 0),
(883, 71, '	Fogg Paradise Fragrant Body Spray for Women	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	804043.jpg	', 0, 0),
(884, 71, '	Fogg Absolute Body Spray	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	618757.jpg	', 0, 0),
(885, 71, '	Nivea Protect & Care Deodorant	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	135257.jpg	', 0, 0),
(886, 71, '	Dabur Red Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	745481.jpg	', 0, 1),
(887, 71, '	Dabur Meswak Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	820852.jpg	', 0, 1),
(888, 71, '	Vicco Vajradanti - Ayurvedic Medicine For Gum & Teeth	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	403405.jpg	', 0, 1),
(889, 71, '	Vicco Vajradanti Ayurvedic	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	152835.jpg	', 0, 1),
(890, 69, '	Pepsodent Germicheck Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	870372.jpg	', 0, 0),
(891, 71, '	Colgate Swarna Vedshakti Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	489846.jpg	', 0, 1),
(892, 71, '	Patanjali Dant Kanti Tooth Paste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	735804.jpg	', 0, 1),
(893, 71, '	Colgate MaxFresh Peppermint Ice Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	370931.jpg	', 0, 1),
(894, 71, '	Dabur Red Ayurvedic Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	343678.jpg	', 0, 1),
(895, 71, '	Sensodyne Fresh Mint Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	322932.jpg	', 0, 1),
(896, 71, '	Colgate Active Salt Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	329145.jpg	', 0, 1),
(897, 71, '	Pepsodent Expert Protection Gum Care Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	440903.jpg	', 0, 1),
(898, 71, '	Colgate Swarna Vedshakti Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	521431.jpg	', 0, 1),
(899, 71, '	Colgate Bamboo Charcoal & Mint Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	335929.jpg	', 0, 0),
(900, 71, '	Pepsodent Expert Protection Complete Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	258238.jpg	', 0, 1),
(901, 71, '	Himalaya Sparkling White Herbal Toothpaste	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	151826.jpg	', 0, 1),
(902, 71, '	Colgate Kids Toothpaste - Strawberry	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	896676.jpg	', 0, 0);
INSERT INTO `tbl_product` (`p_id`, `c_id`, `p_name`, `p_desc`, `p_details`, `p_image`, `p_stock`, `p_status`) VALUES
(903, 71, '	Colgate Kids Toothpaste Bubble Fruit Flavour	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	806501.jpg	', 0, 1),
(904, 69, '	Listerine Cool Mint Mouthwash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	37851.jpg	', 0, 0),
(905, 71, '	Colgate Plax Peppermint Fresh Mouthwash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	781469.jpg	', 0, 1),
(906, 71, '	Listerine Original Mouthwash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	465739.jpg	', 0, 1),
(907, 71, '	Colgate Plax Fresh Tea Mouthwash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	4669.jpg	', 0, 1),
(908, 71, '	Listerine Freshburst Mouthwash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	607397.jpg	', 0, 1),
(909, 71, '	Colgate Plax Freshmint Mouthwash	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	543079.jpg	', 0, 1),
(910, 71, '	Colgate Ultra Soft Sensitive Toothbrush	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	614445.jpg	', 0, 1),
(911, 0, '	Colgate sensitive toothbrush	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	365243.jpg	', 0, 1),
(912, 71, '	Sensodyne Sensitive Soft Toothbrushl.	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	796658.jpg	', 0, 1),
(913, 71, '	Oral-B Pro Health Gum Care Medium Toothbrush	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	469948.jpg	', 0, 1),
(914, 71, '	Sensodyne Soft Toothbrush	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	957547.jpg	', 0, 1),
(915, 71, '	Colgate Zig Zag Medium Toothbrush	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	14393.jpg	', 0, 1),
(916, 71, '	Oral-B Cavity Defence 123 Soft Toothbrush	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	44911.jpg	', 0, 1),
(917, 71, '	Colgate Zig Zag Soft Toothbrush	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	187551.jpg	', 0, 1),
(918, 71, '	Colgate Zig Zag Charcoal Medium Toothbrush	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	499123.jpg	', 0, 1),
(919, 71, '	Oral-B 123 Neem Extract Soft Toothbrush	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	62936.jpg	', 0, 1),
(920, 71, '	Colgate Zig Zag Charcoal Soft Toothbrush	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	533346.jpg	', 0, 1),
(921, 2, '	Moong Dal Chilti	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	moong-dal regular.jpg	', 0, 1),
(922, 2, '	Moong Dal Chilti	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	moong green premium.jpeg	', 0, 1),
(923, 2, '	Urad Dal Chilti (Black)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Urad kali Pre.jpg	', 0, 1),
(924, 2, '	Urad Dal Chilti (Black)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Urad kali Reg.jpg	', 0, 1),
(925, 40, '	Tomato (Tamaatar)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"60\",\"ori_price\":\"80\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"30\",\"ori_price\":\"40\"}]\r\n', '	434365.jpg	', 0, 1),
(926, 40, '	Onion (Pyaaj)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"25\",\"ori_price\":\"30\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"12.5\",\"ori_price\":\"15\"}]\r\n', '	695177.jpg	', 0, 1),
(928, 40, '	Lady Finger (Bhindi)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"80\",\"ori_price\":\"90\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"40\",\"ori_price\":\"45\"}]\r\n', '	Bhindi.jpg	', 0, 1),
(929, 40, '	Green Chilli Dark (Mirchi)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"120\",\"ori_price\":\"130\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"60\",\"ori_price\":\"65\"},{\"no\":\"3\",\"qty\":\"100\",\"unit\":\"gm\",\"dis_price\":\"12\",\"ori_price\":\"13\"}]\r\n', '	Green Chilli Dark (Mirchi).jpg	', 0, 1),
(930, 40, '	Green Chilli Light (Mirchi)	', '', '[{\"no\":\"1\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"80\",\"ori_price\":\"100\"},{\"no\":\"2\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"40\",\"ori_price\":\"50\"},{\"no\":\"3\",\"qty\":\"250\",\"unit\":\"gm\",\"dis_price\":\"20\",\"ori_price\":\"29\"}]\r\n', '	Green Chilli Light (Mirchi).jpg	', 0, 1),
(932, 2, '	Sagar Ghee Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	sagar.jpg	', 0, 1),
(933, 2, '	Fortune Refined Sunflower Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Fortune Refined Sunflower Oil 1ltr.jpg	', 0, 0),
(934, 2, '	Gemini Refined Sunflower Oil Jar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	182305.jpg	', 0, 1),
(935, 2, '	Vatana (White)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	white PRE.jpg	', 0, 1),
(936, 2, '	Vatana (White)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	white-peas REg.png	', 0, 1),
(937, 2, '	Saffola Gold Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Saffola Gold Oil.jpg.crdownload vhhygyg.jpg	', 0, 1),
(938, 2, '	Saffola Active Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Saffola Active Oil.jpg	', 0, 1),
(939, 2, '	Girnar Royal Cup Tea	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	506329.jpg	', 0, 1),
(940, 2, '	Zeeba Premium Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '		', 0, 1),
(941, 2, '	Fortune Rice Bran Health	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Fortune Rice Bran Health.jpg	', 0, 1),
(942, 2, '	Fortune Biryani Special Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	805150.png	', 0, 1),
(943, 2, '	Daawat Heritage Classic Daily Feast Basmati Rice	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	heritage-popular-basmati-rice-500x500.jpg	', 0, 1),
(944, 2, '	Poha (Thick)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Thick Poha.jpeg	', 0, 1),
(945, 2, '	Poha (Regular)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Poha reg.jpg	', 0, 1),
(946, 2, '	Makai Poha	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	corn-poha-.jpg	', 0, 1),
(947, 2, '	Bajra Atta	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Bajra Atta.jpg	', 0, 1),
(948, 2, '	Cashew(Kaju)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	dry-cashew-nut-500x500.jpg	', 0, 1),
(950, 2, '	Sunflowers Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	ISunflowerOil15LGMN3465XX290216_1_B (1).jpg	', 0, 1),
(951, 2, '	Sunday Oil	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	ISunflowerOil15LSNDY3474XX290216_1_B.jpg	', 0, 1),
(952, 2, '	Fortune Oil 15 L JAR	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	899651.jpg	', 0, 1),
(953, 36, '	Kiwi golden	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	472912.jpg	', 0, 1),
(954, 36, '	Apples big	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	996634.png	', 0, 1),
(955, 36, '	Apple small	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	393475.jpg	', 0, 1),
(956, 36, '	American Red Grapes	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	grapes-red-globe-500x500.jpg	', 0, 1),
(957, 2, '	Wagh Bakri tea	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	817r7uBpsxL._SL1500_.jpg	', 0, 1),
(958, 40, '	Safal	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"132\",\"ori_price\":\"135\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"265\",\"ori_price\":\"270\"}]\r\n', '	606038.jpg	', 0, 1),
(959, 2, '	Pure & Sure Organic Desiccated Coconut Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	61YrZ7CxaaL._SY679_.jpg	', 0, 1),
(960, 2, '	Kellogg Muesli Nuts Delight	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	419719.jpg	', 0, 1),
(961, 2, '	Kelloggs museli no added sugar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	315321.jpg	', 0, 1),
(962, 2, '	Bagrry Crunchy Muesli Oat Clusters with Almonds Raisins & Honey	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	81NduiykRsL._SL1500_.jpg	', 0, 1),
(963, 40, '	Srifal coconut powder	', '', '[{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"322\",\"ori_price\":\"325\"}]\r\n', '	ban-1.jpg	', 0, 1),
(964, 2, '	Mahalaxmi Khakhra methi	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	images (1).jpg	', 0, 1),
(965, 2, '	Surf Excel Matic Front Load Detergent Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	download.jpg	', 0, 0),
(966, 2, '	Quaker Oats, 1.5 kg Pouch	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	71XICt4C9QL._SL1500_.jpg	', 0, 1),
(967, 2, '	dabur coconut milk powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	download (1).jpg	', 0, 1),
(968, 2, '	Jivana sugar	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	godhavari_Jivana01_Small.jpg	', 0, 1),
(969, 2, '	RIN ADVANCE SOAP	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	download (2).jpg	', 0, 1),
(970, 2, '	Pitambari Silver Ruperi	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	100518871.jpg	', 0, 1),
(971, 2, '	VIM DISHWASH	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	ICleaners1.5ltrVIM2652XX290216_3_B.jpg	', 0, 1),
(972, 2, '	PUFFED RICE (KURMURA)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	11257.jpg	', 0, 1),
(973, 2, '	DABUR HONEY	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	images (3).jpg	', 0, 1),
(974, 2, '	AMUL MOSERELLA CHEESE	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	100023407.jpg	', 0, 1),
(975, 2, '	Everest Shahi Paneer Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	242290.jpg	', 0, 1),
(976, 40, '	Coccinia (Tindora)	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	848146.jpg	', 0, 1),
(977, 2, '	Vim Bar Lemon	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	61BYqhOPA2L._SX425_.jpg	', 0, 1),
(978, 2, '	Britannia Toast	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	download.jpg	', 0, 1),
(979, 2, '	Horlicks Delight Flavour	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Horlicks-Chocolate-500gm-Jar-SDL265327252-1-ff118.jpg	', 0, 1),
(980, 2, '	Maggie Veg Noodles	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	MaggiFamilyPack8pcs-400x400.jpg	', 0, 1),
(981, 2, '	Lijjat Papad Punjabi Masala	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	1534264693-lijjat-punjabi-masala-papad.jpg	', 0, 1),
(982, 2, '	Head And Shoulder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Head-Shoulders-Smooth-and-Silky-Shampoo-180ml.jpg	', 0, 1),
(983, 2, '	Everyday Milk Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	7181KOQX05L._SX425_.jpg	', 0, 1),
(984, 2, '	Ariel Matic Liquid Detergent 1 Litre	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	926994.jpg	', 0, 1),
(985, 2, '	Ariel Matic Liquid Detergent	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	61HKOG2wECL._SY879_.jpg	', 0, 1),
(986, 2, '	SocietyTea	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	516vhEFqscL._SX522_.jpg	', 0, 1),
(987, 2, '	Vanish Powder - Expert Stain Removal, Laundry Additive	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	71Tr4-7KN9L._SL1500_.jpg	', 0, 1),
(988, 2, '	Madhur Sugar - Refined	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	madhur-sugar-refined.jpg	', 0, 0),
(989, 36, '	Guava ( Peru )	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	DOOR-NEXT-FARMS-GUAVA.jpg	', 0, 1),
(990, 36, '	Dragon fruit	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	335250.jpg	', 0, 1),
(991, 36, '	Watermelon	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	image2-500x500.jpg	', 0, 1),
(992, 2, '	Aqyur Med	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	IMG-20200805-WA0012.jpg	', 0, 0),
(993, 2, '	Aayur Med immunity Tea	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	IMG-20200805-WA0012.jpg	', 0, 1),
(994, 2, '	Roasted Pistachio	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	51mx2Gxup9L.jpg	', 0, 1),
(995, 2, '	EVEREST Dry Ginger Powder	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	Everest-Dry-Ginger-Powder-1701x1701.jpg	', 0, 1),
(996, 2, '	colgate maxfresh red gel	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	colgate_max_fresh_with_cooling_crystals_red_gel_toothpaste_spicy_fresh_150_gm_0.jpg	', 0, 1),
(997, 2, '	Britania nutrichoice five grain	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	217465.png	', 0, 1),
(998, 2, '	Kellogs chocos Duet	', '', '[{\"no\":\"1\",\"qty\":\"500\",\"unit\":\"gm\",\"dis_price\":\"50\",\"ori_price\":\"60\"},{\"no\":\"2\",\"qty\":\"1\",\"unit\":\"kg\",\"dis_price\":\"90\",\"ori_price\":\"100\"}]\r\n', '	kelloggs-chocos-375g-165.jpg	', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `id` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `l_name` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` int(11) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `token` varchar(1000) NOT NULL,
  `code` int(11) NOT NULL,
  `reff_code` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_registration`
--

INSERT INTO `tbl_registration` (`id`, `f_name`, `l_name`, `password`, `dob`, `gender`, `mobile`, `email`, `image`, `token`, `code`, `reff_code`, `status`) VALUES
(2, 'tu', 'pl', '123456', '13/8/2020', 1, '8238906472', 'tu@gmail.com', '15439_1597332325282.png', 'dCBbgq26RBq7O0xkb4_HmN:APA91bGqJDnlN5emm7VFw8VGRTL3KHnRDd8dBezRCI0Hbxey3dCsMahIWTB86Bp5wVBstesLbnwsJX4dntp-xjDSaQYT3iK8zyGsYK-JH0u7v9aWzBGUk2KpnIOeAnYycmwWWe0f-Tzs', 4439, 12345, 1),
(3, 'tailor', 'arpit', 'qwe1234', '', 0, '7567005767', '', '', 'cSGV2R_eSTGVBNNZG3xgW3:APA91bGTjVXVKOVDh68-7KM_hOBQQ8NvgXiKpL2ILRj2MNkOD6Jlp-2oG5cwRLvCNW-sCiweIYs3YDrYNihKfLSvq6p3bllxtRyFkrnFVSILVifzQ58sL6WUutn8ELWIHQEKQ89662Td', 2934, 1234, 1),
(4, 'Vipul ', 'shah', '1234', '', 0, '8355814532', '', '', '', 8758, 0, 1),
(5, 'meet', 'shah', '123456789', '18/8/2020', 1, '9819461979', 'meetshah9819@gmail.com ', '32524_1597772474656.png', 'cTcqwRPpQD-JOwoXDX6P3M:APA91bElq4-pWDEHwJC2GDmqoeyMrfsmuytC9vytF4fgjiqp2IC0Z6xKySoMZmHBQIB6Dr1TAamwp3xfXsgjOQ-HpcKkD2zIFSVUnJVWuA64xVzw-L97Q3gaifijw2dwgSH4RaejYRqN', 9080, 123, 1),
(6, 'vipul', 'shah', '1234', '', 0, '9324550502', '', '', 'd-e8acRpSkSGulcIKegz1M:APA91bFj0-oiQG--rL_2jv2HKiD_GlbznJeTvM18kY0UA0-zQfXVXxRQCVEdZmoSs0b0_BNBuoNrR_VShixLVf-pDdRhcD4PC37YYJFulymvcYAELlbXpL-gMzGBC50c-wQVonSyjtV7', 4093, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `email_from` varchar(255) NOT NULL,
  `onesignal_app_id` text NOT NULL,
  `onesignal_rest_key` text NOT NULL,
  `onesignal_admin_id` text NOT NULL,
  `onesignal_admin_rest_key` text NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `app_logo` varchar(255) NOT NULL,
  `app_email` varchar(255) NOT NULL,
  `app_version` varchar(255) NOT NULL,
  `app_author` varchar(255) NOT NULL,
  `app_contact` varchar(255) NOT NULL,
  `app_website` varchar(255) NOT NULL,
  `app_description` text NOT NULL,
  `app_developed_by` varchar(255) NOT NULL,
  `app_privacy_policy` text NOT NULL,
  `api_all_order_by` varchar(255) NOT NULL,
  `api_latest_limit` int(3) NOT NULL,
  `api_cat_order_by` varchar(255) NOT NULL,
  `api_cat_post_order_by` varchar(255) NOT NULL,
  `publisher_id` text NOT NULL,
  `interstital_ad` text NOT NULL,
  `interstital_ad_id` text NOT NULL,
  `interstital_ad_click` varchar(255) NOT NULL,
  `banner_ad` text NOT NULL,
  `banner_ad_id` text NOT NULL,
  `publisher_id_ios` varchar(500) NOT NULL,
  `app_id_ios` varchar(500) NOT NULL,
  `interstital_ad_ios` varchar(500) NOT NULL,
  `interstital_ad_id_ios` varchar(500) NOT NULL,
  `interstital_ad_click_ios` varchar(500) NOT NULL,
  `banner_ad_ios` varchar(500) NOT NULL,
  `banner_ad_id_ios` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `email_from`, `onesignal_app_id`, `onesignal_rest_key`, `onesignal_admin_id`, `onesignal_admin_rest_key`, `app_name`, `app_logo`, `app_email`, `app_version`, `app_author`, `app_contact`, `app_website`, `app_description`, `app_developed_by`, `app_privacy_policy`, `api_all_order_by`, `api_latest_limit`, `api_cat_order_by`, `api_cat_post_order_by`, `publisher_id`, `interstital_ad`, `interstital_ad_id`, `interstital_ad_click`, `banner_ad`, `banner_ad_id`, `publisher_id_ios`, `app_id_ios`, `interstital_ad_ios`, `interstital_ad_id_ios`, `interstital_ad_click_ios`, `banner_ad_ios`, `banner_ad_id_ios`) VALUES
(1, 'Grocery app', 'dcee171a-df42-473c-b3f8-387b95744be3', 'OTBmZDVmMzItZmU1OC00MTk0LTkxYmYtOTFhOWQ1ZDVkODEw', '3ec02599-d0fe-4692-a4ec-0eb085256b94', 'YjRjODcyZDgtNzQ1NC00M2YwLWE2YWEtNzlhOGU0NjYzZTI3', 'Grocery app', '512 x 512 (1).png', 'arpit.vbinfotech@gmail.com', '1.0', 'Grocery app', '+917567005767', 'Grocery app', '', 'Grocery app', '<p><strong>We are committed to protecting your privacy</strong></p>\n\n<p>We collect the minimum amount of information about you that is commensurate with providing you with a satisfactory service. This policy indicates the type of processes that may result in data being collected about you. Your use of this website gives us the right to collect that information.&nbsp;</p>\n\n<p><strong>Information Collected</strong></p>\n\n<p>We may collect any or all of the information that you give us depending on the type of transaction you enter into, including your name, address, telephone number, and email address, together with data about your use of the website. Other information that may be needed from time to time to process a request may also be collected as indicated on the website.</p>\n\n<p><strong>Information Use</strong></p>\n\n<p>We use the information collected primarily to process the task for which you visited the website. Data collected in the UK is held in accordance with the Data Protection Act. All reasonable precautions are taken to prevent unauthorised access to this information. This safeguard may require you to provide additional forms of identity should you wish to obtain information about your account details.</p>\n\n<p><strong>Cookies</strong></p>\n\n<p>Your Internet browser has the in-built facility for storing small files - &quot;cookies&quot; - that hold information which allows a website to recognise your account. Our website takes advantage of this facility to enhance your experience. You have the ability to prevent your computer from accepting cookies but, if you do, certain functionality on the website may be impaired.</p>\n\n<p><strong>Disclosing Information</strong></p>\n\n<p>We do not disclose any personal information obtained about you from this website to third parties unless you permit us to do so by ticking the relevant boxes in registration or competition forms. We may also use the information to keep in contact with you and inform you of developments associated with us. You will be given the opportunity to remove yourself from any mailing list or similar device. If at any time in the future we should wish to disclose information collected on this website to any third party, it would only be with your knowledge and consent.&nbsp;</p>\n\n<p>We may from time to time provide information of a general nature to third parties - for example, the number of individuals visiting our website or completing a registration form, but we will not use any information that could identify those individuals.&nbsp;</p>\n\n<p>In addition Dummy may work with third parties for the purpose of delivering targeted behavioural advertising to the Dummy website. Through the use of cookies, anonymous information about your use of our websites and other websites will be used to provide more relevant adverts about goods and services of interest to you. For more information on online behavioural advertising and about how to turn this feature off, please visit youronlinechoices.com/opt-out.</p>\n\n<p><strong>Changes to this Policy</strong></p>\n\n<p>Any changes to our Privacy Policy will be placed here and will supersede this version of our policy. We will take reasonable steps to draw your attention to any changes in our policy. However, to be on the safe side, we suggest that you read this document each time you use the website to ensure that it still meets with your approval.</p>\n\n<p><strong>Contacting Us</strong></p>\n\n<p>If you have any questions about our Privacy Policy, or if you want to know what information we have collected about you, please email us at hd@dummy.com. You can also correct any factual errors in that information or require us to remove your details form any list under our control.</p>\n', 'ASC', 15, 'category_name', 'DESC', 'pub-9456493320432553', 'true', 'ca-app-pub-3940256099942544/1033173712', '5', 'true', 'ca-app-pub-3940256099942544/6300978111', 'pub-9456493320432553', 'ca-app-pub-8356404931736973~1544820074', 'true', 'ca-app-pub-3940256099942544/4411468910', '5', 'true', 'ca-app-pub-3940256099942544/2934735716');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_video`
--

CREATE TABLE `tbl_video` (
  `v_id` int(11) NOT NULL,
  `v_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `v_urls` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `v_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_video`
--

INSERT INTO `tbl_video` (`v_id`, `v_name`, `v_urls`, `v_status`) VALUES
(1, 'Test1', 'Xz0fMH6ClKY', 1),
(2, 'Test2', 'mAPm-ez8GEg', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_adderss`
--
ALTER TABLE `tbl_adderss`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`cm_id`);

--
-- Indexes for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  ADD PRIMARY KEY (`cpn_id`);

--
-- Indexes for table `tbl_custom_order`
--
ALTER TABLE `tbl_custom_order`
  ADD PRIMARY KEY (`co_id`);

--
-- Indexes for table `tbl_data`
--
ALTER TABLE `tbl_data`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `tbl_delivery_boy`
--
ALTER TABLE `tbl_delivery_boy`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `tbl_manager`
--
ALTER TABLE `tbl_manager`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `tbl_ordervalue`
--
ALTER TABLE `tbl_ordervalue`
  ADD PRIMARY KEY (`v_id`);

--
-- Indexes for table `tbl_payment_transaction`
--
ALTER TABLE `tbl_payment_transaction`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_video`
--
ALTER TABLE `tbl_video`
  ADD PRIMARY KEY (`v_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_adderss`
--
ALTER TABLE `tbl_adderss`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `cm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  MODIFY `cpn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_custom_order`
--
ALTER TABLE `tbl_custom_order`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_data`
--
ALTER TABLE `tbl_data`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_delivery_boy`
--
ALTER TABLE `tbl_delivery_boy`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_manager`
--
ALTER TABLE `tbl_manager`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_ordervalue`
--
ALTER TABLE `tbl_ordervalue`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_payment_transaction`
--
ALTER TABLE `tbl_payment_transaction`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=999;

--
-- AUTO_INCREMENT for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_video`
--
ALTER TABLE `tbl_video`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
