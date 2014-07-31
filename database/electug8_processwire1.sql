-- phpMyAdmin SQL Dump
-- version 4.2.0
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2014 at 03:13 AM
-- Server version: 5.6.17
-- PHP Version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `electug8_processwire1`
--

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE IF NOT EXISTS `fieldgroups` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET ascii NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111 ;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`) VALUES
(2, 'admin'),
(3, 'user'),
(4, 'role'),
(5, 'permission'),
(1, 'home'),
(88, 'sitemap'),
(83, 'basic-page'),
(80, 'search'),
(101, 'UsersRatings'),
(98, 'Lessons'),
(102, 'Rating'),
(103, 'RatingType'),
(104, 'login'),
(105, 'createprofile'),
(106, 'UserProfile'),
(107, 'Browse'),
(108, 'CourtLocation'),
(109, 'Event'),
(110, 'EventType');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups_fields`
--

CREATE TABLE IF NOT EXISTS `fieldgroups_fields` (
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fields_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups_fields`
--

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES
(2, 2, 1, NULL),
(2, 1, 0, NULL),
(108, 106, 3, NULL),
(4, 5, 0, NULL),
(5, 1, 0, NULL),
(3, 108, 13, NULL),
(1, 1, 0, NULL),
(1, 44, 5, NULL),
(1, 76, 3, NULL),
(80, 1, 0, NULL),
(83, 1, 0, NULL),
(83, 44, 5, NULL),
(83, 76, 3, NULL),
(83, 82, 4, NULL),
(1, 78, 1, NULL),
(83, 78, 1, NULL),
(83, 79, 2, NULL),
(88, 79, 1, NULL),
(1, 79, 2, NULL),
(1, 82, 4, NULL),
(88, 1, 0, NULL),
(101, 1, 0, NULL),
(98, 1, 1, NULL),
(98, 97, 0, NULL),
(103, 1, 0, NULL),
(102, 116, 2, NULL),
(104, 1, 0, NULL),
(3, 104, 12, NULL),
(105, 1, 0, NULL),
(3, 106, 11, NULL),
(106, 102, 1, NULL),
(106, 1, 0, NULL),
(3, 110, 10, NULL),
(107, 1, 0, NULL),
(108, 109, 6, NULL),
(108, 107, 5, NULL),
(108, 108, 4, NULL),
(108, 105, 2, NULL),
(3, 109, 9, NULL),
(3, 107, 8, NULL),
(108, 110, 7, NULL),
(3, 105, 7, NULL),
(3, 103, 6, NULL),
(3, 101, 5, NULL),
(3, 100, 4, NULL),
(3, 99, 3, NULL),
(3, 4, 2, NULL),
(3, 92, 1, NULL),
(3, 3, 0, NULL),
(108, 104, 1, NULL),
(108, 1, 0, NULL),
(109, 1, 0, NULL),
(110, 1, 0, NULL),
(110, 113, 1, NULL),
(109, 112, 1, NULL),
(102, 115, 1, NULL),
(102, 1, 0, NULL),
(109, 114, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE IF NOT EXISTS `fields` (
`id` int(10) unsigned NOT NULL,
  `type` varchar(128) CHARACTER SET ascii NOT NULL,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=117 ;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES
(1, 'FieldtypePageTitle', 'title', 13, 'Title', '{"required":1,"textformatters":["TextformatterEntities"],"size":0,"maxlength":255}'),
(2, 'FieldtypeModule', 'process', 25, 'Process', '{"description":"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don''t change the value of this unless adding your own pages in the admin.","collapsed":1,"required":1,"moduleTypes":["Process"],"permanent":1}'),
(3, 'FieldtypePassword', 'pass', 24, 'Set Password', '{"collapsed":1,"size":50,"maxlength":128}'),
(5, 'FieldtypePage', 'permissions', 24, 'Permissions', '{"derefAsPage":0,"parent_id":31,"labelFieldName":"title","inputfield":"InputfieldCheckboxes"}'),
(4, 'FieldtypePage', 'roles', 24, 'Roles', '{"derefAsPage":0,"parent_id":30,"labelFieldName":"name","inputfield":"InputfieldCheckboxes","description":"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page''s template."}'),
(92, 'FieldtypeEmail', 'email', 9, 'E-Mail Address', '{"size":70,"maxlength":255}'),
(82, 'FieldtypeTextarea', 'sidebar', 0, 'Sidebar', '{"inputfieldClass":"InputfieldTinyMCE","rows":5,"theme_advanced_buttons1":"formatselect,styleselect|,bold,italic,|,bullist,numlist,|,link,unlink,|,image,|,code,|,fullscreen","theme_advanced_blockformats":"p,h2,h3,h4,blockquote,pre,code","plugins":"inlinepopups,safari,table,media,paste,fullscreen,preelementfix","valid_elements":"@[id|class],a[href|target|name],strong\\/b,em\\/i,br,img[src|id|class|width|height|alt],ul,ol,li,p[class],h2,h3,h4,blockquote,-p,-table[border=0|cellspacing|cellpadding|width|frame|rules|height|align|summary|bgcolor|background|bordercolor],-tr[rowspan|width|height|align|valign|bgcolor|background|bordercolor],tbody,thead,tfoot,#td[colspan|rowspan|width|height|align|valign|bgcolor|background|bordercolor|scope],#th[colspan|rowspan|width|height|align|valign|scope],pre,code"}'),
(44, 'FieldtypeImage', 'images', 0, 'Images', '{"extensions":"gif jpg jpeg png","entityEncode":1,"adminThumbs":1,"inputfieldClass":"InputfieldImage","maxFiles":0,"descriptionRows":1,"fileSchema":2}'),
(79, 'FieldtypeTextarea', 'summary', 1, 'Summary', '{"textformatters":["TextformatterEntities"],"inputfieldClass":"InputfieldTextarea","collapsed":2,"rows":3}'),
(76, 'FieldtypeTextarea', 'body', 0, 'Body', '{"inputfieldClass":"InputfieldTinyMCE","collapsed":0,"rows":10,"theme_advanced_buttons1":"formatselect,|,bold,italic,|,bullist,numlist,|,link,unlink,|,image,|,code,|,fullscreen","theme_advanced_blockformats":"p,h2,h3,h4,blockquote,pre","plugins":"inlinepopups,safari,media,paste,fullscreen","valid_elements":"@[id|class],a[href|target|name],strong\\/b,em\\/i,br,img[src|id|class|width|height|alt],ul,ol,li,p[class],h2,h3,h4,blockquote,-p,-table[border=0|cellspacing|cellpadding|width|frame|rules|height|align|summary|bgcolor|background|bordercolor],-tr[rowspan|width|height|align|valign|bgcolor|background|bordercolor],tbody,thead,tfoot,#td[colspan|rowspan|width|height|align|valign|bgcolor|background|bordercolor|scope],#th[colspan|rowspan|width|height|align|valign|scope],code,pre"}'),
(78, 'FieldtypeText', 'headline', 0, 'Headline', '{"description":"Use this instead of the Title if a longer headline is needed than what you want to appear in navigation.","textformatters":["TextformatterEntities"],"collapsed":2,"size":0,"maxlength":1024}'),
(97, 'FieldtypeText', 'locationName', 0, '', ''),
(98, 'FieldtypePage', 'users', 0, '', '{"derefAsPage":0,"parent_id":0,"labelFieldName":"title","inputfield":"InputfieldSelect"}'),
(99, 'FieldtypeText', 'firstname', 0, '', ''),
(100, 'FieldtypeText', 'lastname', 0, '', ''),
(101, 'FieldtypeImage', 'profileimage', 0, '', '{"fileSchema":2}'),
(102, 'FieldtypePage', 'profileOwnedBy_fk', 0, '', '{"description":"This field relates the profile page to the user it belongs to","derefAsPage":2,"parent_id":29,"template_id":3,"labelFieldName":"name","inputfield":"InputfieldSelect"}'),
(103, 'FieldtypePage', 'user_profilepage_fk', 0, '', '{"description":"use this field to relate(like a FK) to the profile page that exists for the current user","derefAsPage":2,"parent_id":0,"labelFieldName":"title","inputfield":"InputfieldSelect","template_id":52}'),
(104, 'FieldtypeText', 'streetAddress', 0, '', ''),
(105, 'FieldtypeText', 'city', 0, '', ''),
(106, 'FieldtypeText', 'state', 0, '', ''),
(107, 'FieldtypeText', 'country', 0, '', ''),
(108, 'FieldtypeInteger', 'zipcode', 0, '', ''),
(109, 'FieldtypeFloat', 'latitude', 0, '', '{"precision":6,"inputType":"text"}'),
(110, 'FieldtypeFloat', 'longitude', 0, '', '{"precision":6,"inputType":"text"}'),
(111, 'FieldtypePage', 'user_location', 0, '', '{"derefAsPage":2,"parent_id":0,"labelFieldName":"locationName","inputfield":"InputfieldSelect","template_id":54}'),
(112, 'FieldtypePage', 'event_location_fk', 0, '', '{"description":"Use as the foreign key for locations that an event is at. When the location is selected, if it doesnt exist in locations, then it should be created!","derefAsPage":0,"parent_id":0,"labelFieldName":"title","inputfield":"InputfieldSelect","template_id":54}'),
(113, 'FieldtypeText', 'event_type_name', 0, '', ''),
(114, 'FieldtypePage', 'event_type_fk', 0, '', '{"description":"Use this to get the event type page related to the current event"}'),
(115, 'FieldtypeText', 'rating_type_name', 0, '', ''),
(116, 'FieldtypePage', 'rating_type_fk', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `field_body`
--

CREATE TABLE IF NOT EXISTS `field_body` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_body`
--

INSERT INTO `field_body` (`pages_id`, `data`) VALUES
(27, '<h3>The page you were looking for is not found.</h3>\r\n<p>Please use our search engine or navigation above to find the page.</p>'),
(1, '<p>aaaas</p>'),
(1002, '<h2>Ut capio feugiat saepius torqueo olim</h2><h3>In utinam facilisi eum vicis feugait nimis</h3><p>Iusto incassum appellatio cui macto genitus vel. Lobortis aliquam luctus, roto enim, imputo wisi tamen. Ratis odio, genitus acsi, neo illum consequat consectetuer ut. </p><p>Wisi fere virtus cogo, ex ut vel nullus similis vel iusto. Tation incassum adsum in, quibus capto premo diam suscipere facilisi. Uxor laoreet mos capio premo feugait ille et. Pecus abigo immitto epulae duis vel. Neque causa, indoles verto, decet ingenium dignissim. </p><p>Patria iriure vel vel autem proprius indoles ille sit. Tation blandit refoveo, accumsan ut ulciscor lucidus inhibeo capto aptent opes, foras. </p><h3>Dolore ea valde refero feugait utinam luctus</h3><p>Usitas, nostrud transverbero, in, amet, nostrud ad. Ex feugiat opto diam os aliquam regula lobortis dolore ut ut quadrum. Esse eu quis nunc jugis iriure volutpat wisi, fere blandit inhibeo melior, hendrerit, saluto velit. Eu bene ideo dignissim delenit accumsan nunc. Usitas ille autem camur consequat typicus feugait elit ex accumsan nutus accumsan nimis pagus, occuro. Immitto populus, qui feugiat opto pneum letalis paratus. Mara conventio torqueo nibh caecus abigo sit eum brevitas. Populus, duis ex quae exerci hendrerit, si antehabeo nobis, consequat ea praemitto zelus. </p><p>Immitto os ratis euismod conventio erat jus caecus sudo. Appellatio consequat, et ibidem ludus nulla dolor augue abdo tego euismod plaga lenis. Sit at nimis venio venio tego os et pecus enim pneum magna nobis ad pneum. Saepius turpis probo refero molior nonummy aliquam neque appellatio jus luctus acsi. Ulciscor refero pagus imputo eu refoveo valetudo duis dolore usitas. Consequat suscipere quod torqueo ratis ullamcorper, dolore lenis, letalis quia quadrum plaga minim. </p>'),
(1003, '<h2>The site template files are located in /site/templates/</h2><p>Each of the template files in this site profile includes the header template (head.inc), outputs the bodycopy, and then includes the footer template (foot.inc). This is to avoid duplication of the markup that is the same across all pages in the site. This is just one strategy you can use for templates. </p><p>You could of course make each template completely self contained with it''s own markup, but if you have more than one template with some of the same markup, then it wouldn''t be very efficient to do that.</p><p>Another strategy would be to use a have a main template that contains all your markup and has placeholder variables for the dynamic parts. Then your other templates would populate the placeholder variables before including the main template. See the <a href="http://processwire.com/download/">skyscrapers</a> site profile for an example of that strategy. </p><p>Regardless of what strategy you use in your own site, I hope that you find ProcessWire easy to develop with. See the <a href="http://processwire.com/api/">Developer API</a>, and the section on <a href="http://processwire.com/api/templates/">Templates</a> to get you started.</p>'),
(1001, '<h2>Si lobortis singularis genitus ibidem saluto.</h2><p>Dolore ad nunc, mos accumsan paratus duis suscipit luptatum facilisis macto uxor iaceo quadrum. Demoveo, appellatio elit neque ad commodo ea. Wisi, iaceo, tincidunt at commoveo rusticus et, ludus. Feugait at blandit bene blandit suscipere abdo duis ideo bis commoveo pagus ex, velit. Consequat commodo roto accumsan, duis transverbero.</p>'),
(1004, '<h2>Pertineo vel dignissim, natu letalis fere odio</h2><h3>Si lobortis singularis genitus ibidem saluto</h3><p>Magna in gemino, gilvus iusto capto jugis abdo mos aptent acsi qui. Utrum inhibeo humo humo duis quae. Lucidus paulatim facilisi scisco quibus hendrerit conventio adsum. Feugiat eligo foras ex elit sed indoles hos elit ex antehabeo defui et nostrud. Letatio valetudo multo consequat inhibeo ille dignissim pagus et in quadrum eum eu. Aliquam si consequat, ut nulla amet et turpis exerci, adsum luctus ne decet, delenit. Commoveo nunc diam valetudo cui, aptent commoveo at obruo uxor nulla aliquip augue. </p><p>Iriure, ex velit, praesent vulpes delenit capio vero gilvus inhibeo letatio aliquip metuo qui eros. Transverbero demoveo euismod letatio torqueo melior. Ut odio in suscipit paulatim amet huic letalis suscipere eros causa, letalis magna. </p>'),
(1006, '<p>test stuff here</p>');

-- --------------------------------------------------------

--
-- Table structure for table `field_city`
--

CREATE TABLE IF NOT EXISTS `field_city` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_country`
--

CREATE TABLE IF NOT EXISTS `field_country` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_email`
--

CREATE TABLE IF NOT EXISTS `field_email` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_email`
--

INSERT INTO `field_email` (`pages_id`, `data`) VALUES
(41, 'tehandyb@hotmail.com'),
(1007, 'tehandyb@gmail.com'),
(1008, 'test@t.com'),
(1009, 'test1@email.com'),
(1010, 'test2@email.com'),
(1011, 't3@email.com'),
(1012, 't4@email.com'),
(1013, 't5@email.com'),
(1014, 't6@email.com'),
(1016, 't7@e.com'),
(1017, 't7@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `field_eventname`
--

CREATE TABLE IF NOT EXISTS `field_eventname` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_event_location_fk`
--

CREATE TABLE IF NOT EXISTS `field_event_location_fk` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_event_type_fk`
--

CREATE TABLE IF NOT EXISTS `field_event_type_fk` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_event_type_name`
--

CREATE TABLE IF NOT EXISTS `field_event_type_name` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_firstname`
--

CREATE TABLE IF NOT EXISTS `field_firstname` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_firstname`
--

INSERT INTO `field_firstname` (`pages_id`, `data`) VALUES
(1007, 'andrew'),
(1008, 'test'),
(1009, 'a'),
(1010, 'a'),
(1011, 'a'),
(1012, 'a'),
(1013, 'a'),
(1014, 'a'),
(1016, 'a'),
(1017, 'a'),
(41, 'bob');

-- --------------------------------------------------------

--
-- Table structure for table `field_headline`
--

CREATE TABLE IF NOT EXISTS `field_headline` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_headline`
--

INSERT INTO `field_headline` (`pages_id`, `data`) VALUES
(1001, 'About Us'),
(1003, 'Developing Site Templates');

-- --------------------------------------------------------

--
-- Table structure for table `field_images`
--

CREATE TABLE IF NOT EXISTS `field_images` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_lastname`
--

CREATE TABLE IF NOT EXISTS `field_lastname` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_lastname`
--

INSERT INTO `field_lastname` (`pages_id`, `data`) VALUES
(1007, 'blowe'),
(1008, 'b'),
(1009, 'b'),
(1010, 'b'),
(1011, 'b'),
(1012, 'b'),
(1013, 'b'),
(1014, 'b'),
(1016, 'b'),
(1017, 'b'),
(41, 'builder');

-- --------------------------------------------------------

--
-- Table structure for table `field_latitude`
--

CREATE TABLE IF NOT EXISTS `field_latitude` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_locationname`
--

CREATE TABLE IF NOT EXISTS `field_locationname` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_locationobject`
--

CREATE TABLE IF NOT EXISTS `field_locationobject` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_longitude`
--

CREATE TABLE IF NOT EXISTS `field_longitude` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_pass`
--

CREATE TABLE IF NOT EXISTS `field_pass` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` char(40) NOT NULL,
  `salt` char(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

--
-- Dumping data for table `field_pass`
--

INSERT INTO `field_pass` (`pages_id`, `data`, `salt`) VALUES
(41, 'qIrN3twq1oQwaewQbRHrXjp/xGCse3G', '$2y$11$xEyOMVyyIOLXex15nF0cJ.'),
(40, '', ''),
(1007, 'x7PYoxQGWYU2bpU29jnhGEC6gyZrVWi', '$2y$11$AMpfGe.y7ayJ74CNfwj4bu'),
(1008, 'qPNHOJhEGTal74/gkrkdniLEzoWgwGq', '$2y$11$wt.kbF5EcS3xezvIBAJWhO'),
(1009, '/iVUCqB9/.GLIW876BosmLTfE2uzCOO', '$2y$11$HASr2Ku1sIeYYWOiNaf2ne'),
(1010, 'HxwvMROeQgoTP.WzgJdpgjx2RzYPGGC', '$2y$11$ik49vbItlK8iWVct4nO1te'),
(1011, 'kleyk6ksmUELTTZAps5LOzWDdCPrUs2', '$2y$11$AGNjGCXfvRbquFw78bSeJ.'),
(1012, 'k5PXfMbxEM9FRXQOqqcqt4ItMyDZ.9q', '$2y$11$gXSvDa6xj.LyNBsni7mqBu'),
(1013, 'lHHaIYCjxEKgQ4MpMSDRiVFhPOkiS92', '$2y$11$fb/PFjwo9K6Y8js1AvfTi.'),
(1014, 'FJdSNdXl67FLwx5.8JgZGrMo4WdxUs.', '$2y$11$5RfhkQAMCFBfK3ppbCmxIu'),
(1016, 'lQUsnN4Rn4NPAGHvfX067KofDnIwXSy', '$2y$11$LiRwN/ccGnLKUkiiq6PaJ.'),
(1017, 'wKfKkjl6fHXAtYnT./5mNIiwWuWDxfy', '$2y$11$lsiGtdqJsiwTrrP.GgBEG.');

-- --------------------------------------------------------

--
-- Table structure for table `field_permissions`
--

CREATE TABLE IF NOT EXISTS `field_permissions` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_permissions`
--

INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES
(38, 32, 1),
(38, 34, 2),
(38, 35, 3),
(37, 36, 0),
(38, 36, 0),
(38, 50, 4),
(38, 51, 5),
(38, 52, 7),
(38, 53, 8),
(38, 54, 6);

-- --------------------------------------------------------

--
-- Table structure for table `field_process`
--

CREATE TABLE IF NOT EXISTS `field_process` (
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `data` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_process`
--

INSERT INTO `field_process` (`pages_id`, `data`) VALUES
(6, 17),
(3, 12),
(8, 12),
(9, 14),
(10, 7),
(11, 47),
(16, 48),
(300, 104),
(21, 50),
(29, 66),
(23, 10),
(304, 138),
(31, 136),
(22, 76),
(30, 68),
(303, 129),
(2, 87),
(302, 121),
(301, 109),
(28, 76);

-- --------------------------------------------------------

--
-- Table structure for table `field_profileimage`
--

CREATE TABLE IF NOT EXISTS `field_profileimage` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_profileimage`
--

INSERT INTO `field_profileimage` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`) VALUES
(41, 'shooting-brake-front-1200x800.jpg', 0, 'profile image', '2014-07-06 19:57:25', '2014-07-06 19:57:13');

-- --------------------------------------------------------

--
-- Table structure for table `field_profileownedby_fk`
--

CREATE TABLE IF NOT EXISTS `field_profileownedby_fk` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_profileownedby_fk`
--

INSERT INTO `field_profileownedby_fk` (`pages_id`, `data`, `sort`) VALUES
(1019, 1007, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_rating_type_fk`
--

CREATE TABLE IF NOT EXISTS `field_rating_type_fk` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_rating_type_name`
--

CREATE TABLE IF NOT EXISTS `field_rating_type_name` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_roles`
--

CREATE TABLE IF NOT EXISTS `field_roles` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_roles`
--

INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES
(40, 37, 0),
(41, 37, 0),
(1007, 37, 0),
(1008, 37, 0),
(1009, 37, 0),
(1010, 37, 0),
(1011, 37, 0),
(1012, 37, 0),
(1013, 37, 0),
(1014, 37, 0),
(1016, 37, 0),
(1017, 37, 0),
(41, 38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `field_sidebar`
--

CREATE TABLE IF NOT EXISTS `field_sidebar` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_sidebar`
--

INSERT INTO `field_sidebar` (`pages_id`, `data`) VALUES
(1002, '<h3>Sudo nullus</h3><p>Et torqueo vulpes vereor luctus augue quod consectetuer antehabeo causa patria tation ex plaga ut. Abluo delenit wisi iriure eros feugiat probo nisl aliquip nisl, patria. Antehabeo esse camur nisl modo utinam. Sudo nullus ventosus ibidem facilisis saepius eum sino pneum, vicis odio voco opto.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `field_state`
--

CREATE TABLE IF NOT EXISTS `field_state` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_streetaddress`
--

CREATE TABLE IF NOT EXISTS `field_streetaddress` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_summary`
--

CREATE TABLE IF NOT EXISTS `field_summary` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_summary`
--

INSERT INTO `field_summary` (`pages_id`, `data`) VALUES
(1002, 'Dolore ea valde refero feugait utinam luctus. Probo velit commoveo et, delenit praesent, suscipit zelus, hendrerit zelus illum facilisi, regula. '),
(1001, 'This is a placeholder page with two child pages to serve as an example. '),
(1005, 'View this template''s source for a demonstration of how to create a basic site map. '),
(1003, 'More about the templates included in this basic site profile. '),
(1004, 'Mos erat reprobo in praesent, mara premo, obruo iustum pecus velit lobortis te sagaciter populus.');

-- --------------------------------------------------------

--
-- Table structure for table `field_title`
--

CREATE TABLE IF NOT EXISTS `field_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_title`
--

INSERT INTO `field_title` (`pages_id`, `data`) VALUES
(14, 'Edit Template'),
(15, 'Add Template'),
(12, 'Templates'),
(11, 'Templates'),
(19, 'Field groups'),
(20, 'Edit Fieldgroup'),
(16, 'Fields'),
(17, 'Fields'),
(18, 'Edit Field'),
(22, 'Setup'),
(3, 'Pages'),
(6, 'Add Page'),
(8, 'Page List'),
(9, 'Save Sort'),
(10, 'Edit Page'),
(21, 'Modules'),
(29, 'Users'),
(30, 'Roles'),
(2, 'Admin'),
(7, 'Trash'),
(27, '404 Page Not Found'),
(302, 'Insert Link'),
(23, 'Login'),
(304, 'Profile'),
(301, 'Empty Trash'),
(300, 'Search'),
(303, 'Insert Image'),
(28, 'Access'),
(31, 'Permissions'),
(32, 'Edit pages'),
(34, 'Delete pages'),
(35, 'Move pages (change parent)'),
(36, 'View pages'),
(50, 'Sort child pages'),
(51, 'Change templates on pages'),
(52, 'Administer users (role must also have template edit access)'),
(53, 'User can update profile/password'),
(54, 'Lock or unlock a page'),
(1, 'UserDash'),
(1001, 'About'),
(1002, 'Child page example 1'),
(1000, 'Search'),
(1003, 'Templates'),
(1004, 'Child page example 2'),
(1005, 'Site Map'),
(1006, 'testpage'),
(1015, 'createprofile'),
(1018, 'Browse'),
(1019, 'test profile tehandyb');

-- --------------------------------------------------------

--
-- Table structure for table `field_users`
--

CREATE TABLE IF NOT EXISTS `field_users` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_user_location`
--

CREATE TABLE IF NOT EXISTS `field_user_location` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_user_profilepage_fk`
--

CREATE TABLE IF NOT EXISTS `field_user_profilepage_fk` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_user_profilepage_fk`
--

INSERT INTO `field_user_profilepage_fk` (`pages_id`, `data`, `sort`) VALUES
(1007, 1019, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_zipcode`
--

CREATE TABLE IF NOT EXISTS `field_zipcode` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
`id` int(10) unsigned NOT NULL,
  `class` varchar(128) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `data` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=150 ;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `class`, `flags`, `data`) VALUES
(1, 'FieldtypeTextarea', 0, ''),
(2, 'FieldtypeNumber', 0, ''),
(3, 'FieldtypeText', 0, ''),
(4, 'FieldtypePage', 0, ''),
(30, 'InputfieldForm', 0, ''),
(6, 'FieldtypeFile', 0, ''),
(7, 'ProcessPageEdit', 1, ''),
(10, 'ProcessLogin', 0, ''),
(147, 'TextformatterPstripper', 1, ''),
(12, 'ProcessPageList', 0, '{"pageLabelField":"title","paginationLimit":25,"limit":50}'),
(121, 'ProcessPageEditLink', 1, ''),
(14, 'ProcessPageSort', 0, ''),
(15, 'InputfieldPageListSelect', 0, ''),
(117, 'JqueryUI', 1, ''),
(17, 'ProcessPageAdd', 0, ''),
(122, 'InputfieldPassword', 0, ''),
(25, 'InputfieldAsmSelect', 0, ''),
(116, 'JqueryCore', 1, ''),
(27, 'FieldtypeModule', 0, ''),
(28, 'FieldtypeDatetime', 0, ''),
(29, 'FieldtypeEmail', 0, ''),
(108, 'InputfieldURL', 0, ''),
(32, 'InputfieldSubmit', 0, ''),
(33, 'InputfieldWrapper', 0, ''),
(34, 'InputfieldText', 0, ''),
(35, 'InputfieldTextarea', 0, ''),
(36, 'InputfieldSelect', 0, ''),
(37, 'InputfieldCheckbox', 0, ''),
(38, 'InputfieldCheckboxes', 0, ''),
(39, 'InputfieldRadios', 0, ''),
(40, 'InputfieldHidden', 0, ''),
(41, 'InputfieldName', 0, ''),
(43, 'InputfieldSelectMultiple', 0, ''),
(45, 'JqueryWireTabs', 0, ''),
(46, 'ProcessPage', 0, ''),
(47, 'ProcessTemplate', 0, ''),
(48, 'ProcessField', 0, ''),
(50, 'ProcessModule', 0, ''),
(114, 'PagePermissions', 3, ''),
(97, 'FieldtypeCheckbox', 1, ''),
(115, 'PageRender', 3, '{"clearCache":1}'),
(55, 'InputfieldFile', 0, ''),
(56, 'InputfieldImage', 0, ''),
(57, 'FieldtypeImage', 0, ''),
(60, 'InputfieldPage', 0, '{"inputfieldClasses":["InputfieldSelect","InputfieldSelectMultiple","InputfieldCheckboxes","InputfieldRadios","InputfieldAsmSelect","InputfieldPageListSelect","InputfieldPageListSelectMultiple"]}'),
(61, 'TextformatterEntities', 0, ''),
(145, 'TextformatterMarkdownExtra', 1, ''),
(146, 'TextformatterSmartypants', 1, ''),
(66, 'ProcessUser', 0, '{"showFields":["name","email","roles"]}'),
(67, 'MarkupAdminDataTable', 0, ''),
(68, 'ProcessRole', 0, '{"showFields":["name"]}'),
(76, 'ProcessList', 0, ''),
(78, 'InputfieldFieldset', 0, ''),
(79, 'InputfieldMarkup', 0, ''),
(80, 'InputfieldEmail', 0, ''),
(89, 'FieldtypeFloat', 1, ''),
(83, 'ProcessPageView', 0, ''),
(84, 'FieldtypeInteger', 0, ''),
(85, 'InputfieldInteger', 0, ''),
(86, 'InputfieldPageName', 0, ''),
(87, 'ProcessHome', 0, ''),
(90, 'InputfieldFloat', 0, ''),
(92, 'InputfieldTinyMCE', 0, ''),
(94, 'InputfieldDatetime', 0, ''),
(98, 'MarkupPagerNav', 0, ''),
(129, 'ProcessPageEditImageSelect', 1, ''),
(102, 'JqueryFancybox', 1, ''),
(103, 'JqueryTableSorter', 1, ''),
(104, 'ProcessPageSearch', 1, '{"searchFields":"title body","displayField":"title path"}'),
(105, 'FieldtypeFieldsetOpen', 1, ''),
(106, 'FieldtypeFieldsetClose', 1, ''),
(107, 'FieldtypeFieldsetTabOpen', 1, ''),
(109, 'ProcessPageTrash', 1, ''),
(111, 'FieldtypePageTitle', 1, ''),
(112, 'InputfieldPageTitle', 0, ''),
(113, 'MarkupPageArray', 3, ''),
(131, 'InputfieldButton', 0, ''),
(133, 'FieldtypePassword', 1, ''),
(134, 'ProcessPageType', 1, '{"showFields":[]}'),
(135, 'FieldtypeURL', 1, ''),
(136, 'ProcessPermission', 1, '{"showFields":["name","title"]}'),
(137, 'InputfieldPageListSelectMultiple', 0, ''),
(138, 'ProcessProfile', 1, '{"profileFields":["pass","email"]}'),
(139, 'SystemUpdater', 1, '{"systemVersion":4}'),
(148, 'AdminThemeDefault', 2, '{"colors":"classic"}'),
(149, 'JqueryMagnific', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
`id` int(10) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `templates_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET ascii NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `sort` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1020 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `sort`) VALUES
(1, 0, 1, 'home', 9, '2014-06-21 23:41:52', 41, '0000-00-00 00:00:00', 2, 0),
(2, 1, 2, 'processwire', 1035, '2014-06-18 23:57:16', 40, '0000-00-00 00:00:00', 2, 5),
(3, 2, 2, 'page', 21, '2011-03-30 03:37:06', 41, '0000-00-00 00:00:00', 2, 0),
(6, 3, 2, 'add', 21, '2011-03-30 03:37:06', 41, '0000-00-00 00:00:00', 2, 0),
(7, 1, 2, 'trash', 1039, '2011-08-15 04:04:52', 41, '2010-02-07 12:29:39', 2, 6),
(8, 3, 2, 'list', 21, '2011-03-30 03:37:06', 41, '0000-00-00 00:00:00', 2, 1),
(9, 3, 2, 'sort', 23, '2011-03-30 03:37:06', 41, '0000-00-00 00:00:00', 2, 2),
(10, 3, 2, 'edit', 21, '2011-03-30 03:37:06', 41, '0000-00-00 00:00:00', 2, 3),
(11, 22, 2, 'template', 21, '2011-03-30 03:37:06', 41, '2010-02-01 18:04:54', 2, 0),
(16, 22, 2, 'field', 21, '2011-03-30 03:37:06', 41, '2010-02-01 19:44:07', 2, 2),
(21, 2, 2, 'module', 21, '2011-03-30 03:37:06', 41, '2010-02-02 17:02:24', 2, 2),
(22, 2, 2, 'setup', 21, '2011-03-30 03:37:06', 41, '2010-02-09 19:16:59', 2, 1),
(23, 2, 2, 'login', 1035, '2011-05-04 05:38:10', 41, '2010-02-17 16:59:39', 2, 4),
(27, 1, 29, 'http404', 1035, '2011-08-15 04:04:52', 41, '2010-06-03 12:53:03', 3, 4),
(28, 2, 2, 'access', 13, '2011-05-04 05:38:10', 41, '2011-03-20 01:14:20', 2, 3),
(29, 28, 2, 'users', 29, '2011-04-05 06:39:08', 41, '2011-03-20 01:15:29', 2, 0),
(30, 28, 2, 'roles', 29, '2011-04-05 06:38:39', 41, '2011-03-20 01:15:45', 2, 1),
(31, 28, 2, 'permissions', 29, '2011-04-05 06:53:52', 41, '2011-03-20 01:16:00', 2, 2),
(32, 31, 5, 'page-edit', 25, '2011-09-06 21:34:24', 41, '2011-03-20 01:17:03', 2, 2),
(34, 31, 5, 'page-delete', 25, '2011-09-06 21:34:33', 41, '2011-03-20 01:17:23', 2, 3),
(35, 31, 5, 'page-move', 25, '2011-09-06 21:34:48', 41, '2011-03-20 01:17:41', 2, 4),
(36, 31, 5, 'page-view', 25, '2011-09-06 21:34:14', 41, '2011-03-20 01:17:57', 2, 0),
(37, 30, 4, 'guest', 25, '2011-04-05 07:37:19', 41, '2011-03-20 01:18:41', 2, 0),
(38, 30, 4, 'superuser', 25, '2011-08-17 20:34:39', 41, '2011-03-20 01:18:55', 2, 1),
(41, 29, 3, 'admin', 1, '2014-07-07 01:57:25', 41, '2011-03-20 01:41:26', 2, 0),
(40, 29, 3, 'guest', 25, '2011-08-17 20:26:09', 41, '2011-03-20 23:31:59', 2, 1),
(50, 31, 5, 'page-sort', 25, '2011-09-06 21:34:58', 41, '2011-03-27 04:04:50', 41, 5),
(51, 31, 5, 'page-template', 25, '2011-09-06 21:35:09', 41, '2011-03-27 04:25:31', 41, 6),
(52, 31, 5, 'user-admin', 25, '2011-09-06 21:35:42', 41, '2011-03-30 06:06:47', 41, 10),
(53, 31, 5, 'profile-edit', 1, '2011-08-17 04:32:48', 41, '2011-04-26 06:02:22', 41, 13),
(54, 31, 5, 'page-lock', 1, '2011-08-15 23:48:12', 41, '2011-08-15 23:45:48', 41, 8),
(300, 3, 2, 'search', 21, '2011-03-30 03:37:06', 41, '2010-08-04 11:23:59', 2, 5),
(301, 3, 2, 'trash', 23, '2011-03-30 03:37:06', 41, '2010-09-28 11:39:30', 2, 5),
(302, 3, 2, 'link', 17, '2011-03-30 03:37:06', 41, '2010-10-01 11:03:56', 2, 6),
(303, 3, 2, 'image', 17, '2011-03-30 03:37:06', 41, '2010-10-13 09:56:48', 2, 7),
(304, 2, 2, 'profile', 1025, '2011-05-04 05:38:10', 41, '2011-04-26 05:57:18', 41, 5),
(1000, 1, 26, 'search', 1025, '2011-09-01 01:17:38', 41, '2010-09-06 11:05:28', 2, 3),
(1001, 1, 29, 'about', 1, '2011-09-05 22:02:24', 41, '2010-10-26 04:39:33', 2, 0),
(1002, 1001, 29, 'what', 1, '2011-09-06 20:50:53', 41, '2010-10-26 05:21:34', 2, 0),
(1003, 1, 29, 'templates', 1, '2011-09-05 22:08:59', 41, '2010-10-26 07:59:44', 2, 1),
(1004, 1001, 29, 'background', 1, '2011-08-18 20:47:47', 41, '2010-11-30 05:11:36', 2, 1),
(1005, 1, 34, 'site-map', 1, '2011-09-01 01:17:38', 41, '2010-12-01 04:16:49', 2, 2),
(1006, 1, 29, 'testpage', 1, '2014-06-21 23:18:29', 41, '2014-06-21 23:18:19', 41, 7),
(1007, 29, 3, 'tehandyb-gmail.com', 1, '2014-07-07 03:53:01', 41, '2014-06-25 04:03:30', 40, 2),
(1008, 29, 3, 'test-t.com', 1, '2014-06-25 19:42:38', 40, '2014-06-25 19:42:38', 40, 3),
(1009, 29, 3, 'test1-email.com', 1, '2014-07-05 01:00:26', 40, '2014-07-05 01:00:26', 40, 4),
(1010, 29, 3, 'test2-email.com', 1, '2014-07-05 01:21:46', 40, '2014-07-05 01:21:46', 40, 5),
(1011, 29, 3, 't3-email.com', 1, '2014-07-05 02:24:09', 40, '2014-07-05 02:24:09', 40, 6),
(1012, 29, 3, 't4-email.com', 1, '2014-07-05 02:26:11', 40, '2014-07-05 02:26:11', 40, 7),
(1013, 29, 3, 't5-email.com', 1, '2014-07-05 02:27:23', 40, '2014-07-05 02:27:23', 40, 8),
(1014, 29, 3, 't6-email.com', 1, '2014-07-05 02:28:15', 40, '2014-07-05 02:28:15', 40, 9),
(1015, 1, 51, 'createprofile', 1, '2014-07-05 02:34:19', 41, '2014-07-05 02:34:19', 41, 8),
(1016, 29, 3, 't7-e.com', 1, '2014-07-05 02:36:17', 40, '2014-07-05 02:36:17', 40, 10),
(1017, 29, 3, 't7-email.com', 1, '2014-07-05 03:12:43', 40, '2014-07-05 03:12:43', 40, 11),
(1018, 1, 53, 'browse', 1025, '2014-07-07 03:51:57', 41, '2014-07-07 03:51:36', 41, 9),
(1019, 1018, 52, 'test-profile-tehandyb', 1, '2014-07-07 03:55:02', 41, '2014-07-07 03:52:30', 41, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages_access`
--

CREATE TABLE IF NOT EXISTS `pages_access` (
  `pages_id` int(11) NOT NULL,
  `templates_id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages_access`
--

INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES
(37, 2, '2014-06-21 23:41:44'),
(38, 2, '2014-06-21 23:41:44'),
(32, 2, '2014-06-21 23:41:44'),
(34, 2, '2014-06-21 23:41:44'),
(35, 2, '2014-06-21 23:41:44'),
(36, 2, '2014-06-21 23:41:44'),
(50, 2, '2014-06-21 23:41:44'),
(51, 2, '2014-06-21 23:41:44'),
(52, 2, '2014-06-21 23:41:44'),
(53, 2, '2014-06-21 23:41:44'),
(54, 2, '2014-06-21 23:41:44'),
(1015, 1, '2014-07-05 02:34:19'),
(1018, 1, '2014-07-07 03:51:36'),
(1019, 1, '2014-07-07 03:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `pages_parents`
--

CREATE TABLE IF NOT EXISTS `pages_parents` (
  `pages_id` int(10) unsigned NOT NULL,
  `parents_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages_parents`
--

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES
(2, 1),
(3, 1),
(3, 2),
(7, 1),
(22, 1),
(22, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(29, 28),
(30, 1),
(30, 2),
(30, 28),
(31, 1),
(31, 2),
(31, 28),
(1001, 1),
(1002, 1),
(1002, 1001),
(1003, 1),
(1004, 1),
(1004, 1001),
(1005, 1),
(1018, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages_sortfields`
--

CREATE TABLE IF NOT EXISTS `pages_sortfields` (
  `pages_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sortfield` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE IF NOT EXISTS `templates` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cache_time` mediumint(9) NOT NULL DEFAULT '0',
  `data` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES
(2, 'admin', 2, 8, 0, '{"useRoles":1,"parentTemplates":[2],"allowPageNum":1,"redirectLogin":23,"slashUrls":1,"noGlobal":1}'),
(3, 'user', 3, 8, 0, '{"useRoles":1,"noChildren":1,"parentTemplates":[2],"slashUrls":1,"pageClass":"User","noGlobal":1,"noMove":1,"noTrash":1,"noSettings":1,"noChangeTemplate":1,"nameContentTab":1}'),
(4, 'role', 4, 8, 0, '{"noChildren":1,"parentTemplates":[2],"slashUrls":1,"pageClass":"Role","noGlobal":1,"noMove":1,"noTrash":1,"noSettings":1,"noChangeTemplate":1,"nameContentTab":1}'),
(5, 'permission', 5, 8, 0, '{"noChildren":1,"parentTemplates":[2],"slashUrls":1,"guestSearchable":1,"pageClass":"Permission","noGlobal":1,"noMove":1,"noTrash":1,"noSettings":1,"noChangeTemplate":1,"nameContentTab":1}'),
(1, 'home', 1, 0, 0, '{"useRoles":1,"noParents":1,"slashUrls":1,"roles":[37]}'),
(29, 'basic-page', 83, 0, 0, '{"slashUrls":1}'),
(26, 'search', 80, 0, 0, '{"noChildren":1,"noParents":1,"allowPageNum":1,"slashUrls":1}'),
(34, 'sitemap', 88, 0, 0, '{"noChildren":1,"noParents":1,"redirectLogin":23,"slashUrls":1}'),
(47, 'UsersRatings', 101, 0, 0, '{"slashUrls":1}'),
(44, 'Lessons', 98, 0, 0, '{"slashUrls":1}'),
(48, 'Rating', 102, 0, 0, '{"slashUrls":1}'),
(49, 'RatingType', 103, 0, 0, '{"slashUrls":1}'),
(50, 'login', 104, 0, 0, '{"useRoles":1,"slashUrls":1,"roles":[37]}'),
(51, 'createprofile', 105, 0, 0, '{"slashUrls":1}'),
(52, 'UserProfile', 106, 0, 0, '{"noChildren":1,"slashUrls":1}'),
(53, 'Browse', 107, 0, 0, '{"slashUrls":1}'),
(54, 'CourtLocation', 108, 0, 0, '{"noChildren":1,"parentTemplates":[53],"slashUrls":1}'),
(55, 'Event', 109, 0, 0, '{"slashUrls":1}'),
(56, 'EventType', 110, 0, 0, '{"slashUrls":1}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `fieldgroups_fields`
--
ALTER TABLE `fieldgroups_fields`
 ADD PRIMARY KEY (`fieldgroups_id`,`fields_id`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `type` (`type`);

--
-- Indexes for table `field_body`
--
ALTER TABLE `field_body`
 ADD PRIMARY KEY (`pages_id`), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_city`
--
ALTER TABLE `field_city`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`(255)), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_country`
--
ALTER TABLE `field_country`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`(255)), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_email`
--
ALTER TABLE `field_email`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_eventname`
--
ALTER TABLE `field_eventname`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`(255)), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_event_location_fk`
--
ALTER TABLE `field_event_location_fk`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`,`pages_id`,`sort`);

--
-- Indexes for table `field_event_type_fk`
--
ALTER TABLE `field_event_type_fk`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`,`pages_id`,`sort`);

--
-- Indexes for table `field_event_type_name`
--
ALTER TABLE `field_event_type_name`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`(255)), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_firstname`
--
ALTER TABLE `field_firstname`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`(255)), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_headline`
--
ALTER TABLE `field_headline`
 ADD PRIMARY KEY (`pages_id`), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_images`
--
ALTER TABLE `field_images`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`), ADD KEY `modified` (`modified`), ADD KEY `created` (`created`), ADD FULLTEXT KEY `description` (`description`);

--
-- Indexes for table `field_lastname`
--
ALTER TABLE `field_lastname`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`(255)), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_latitude`
--
ALTER TABLE `field_latitude`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data` (`data`);

--
-- Indexes for table `field_locationname`
--
ALTER TABLE `field_locationname`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`(255)), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_locationobject`
--
ALTER TABLE `field_locationobject`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`,`pages_id`,`sort`);

--
-- Indexes for table `field_longitude`
--
ALTER TABLE `field_longitude`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data` (`data`);

--
-- Indexes for table `field_pass`
--
ALTER TABLE `field_pass`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data` (`data`);

--
-- Indexes for table `field_permissions`
--
ALTER TABLE `field_permissions`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`,`pages_id`,`sort`);

--
-- Indexes for table `field_process`
--
ALTER TABLE `field_process`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data` (`data`);

--
-- Indexes for table `field_profileimage`
--
ALTER TABLE `field_profileimage`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`), ADD KEY `modified` (`modified`), ADD KEY `created` (`created`), ADD FULLTEXT KEY `description` (`description`);

--
-- Indexes for table `field_profileownedby_fk`
--
ALTER TABLE `field_profileownedby_fk`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`,`pages_id`,`sort`);

--
-- Indexes for table `field_rating_type_fk`
--
ALTER TABLE `field_rating_type_fk`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`,`pages_id`,`sort`);

--
-- Indexes for table `field_rating_type_name`
--
ALTER TABLE `field_rating_type_name`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`(255)), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_roles`
--
ALTER TABLE `field_roles`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`,`pages_id`,`sort`);

--
-- Indexes for table `field_sidebar`
--
ALTER TABLE `field_sidebar`
 ADD PRIMARY KEY (`pages_id`), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_state`
--
ALTER TABLE `field_state`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`(255)), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_streetaddress`
--
ALTER TABLE `field_streetaddress`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`(255)), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_summary`
--
ALTER TABLE `field_summary`
 ADD PRIMARY KEY (`pages_id`), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_title`
--
ALTER TABLE `field_title`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data_exact` (`data`(255)), ADD FULLTEXT KEY `data` (`data`);

--
-- Indexes for table `field_users`
--
ALTER TABLE `field_users`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`,`pages_id`,`sort`);

--
-- Indexes for table `field_user_location`
--
ALTER TABLE `field_user_location`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`,`pages_id`,`sort`);

--
-- Indexes for table `field_user_profilepage_fk`
--
ALTER TABLE `field_user_profilepage_fk`
 ADD PRIMARY KEY (`pages_id`,`sort`), ADD KEY `data` (`data`,`pages_id`,`sort`);

--
-- Indexes for table `field_zipcode`
--
ALTER TABLE `field_zipcode`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `data` (`data`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `class` (`class`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name_parent_id` (`name`,`parent_id`), ADD KEY `parent_id` (`parent_id`), ADD KEY `templates_id` (`templates_id`), ADD KEY `modified` (`modified`), ADD KEY `created` (`created`), ADD KEY `status` (`status`);

--
-- Indexes for table `pages_access`
--
ALTER TABLE `pages_access`
 ADD PRIMARY KEY (`pages_id`), ADD KEY `templates_id` (`templates_id`);

--
-- Indexes for table `pages_parents`
--
ALTER TABLE `pages_parents`
 ADD PRIMARY KEY (`pages_id`,`parents_id`);

--
-- Indexes for table `pages_sortfields`
--
ALTER TABLE `pages_sortfields`
 ADD PRIMARY KEY (`pages_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `fieldgroups_id` (`fieldgroups_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=150;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1020;
--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
