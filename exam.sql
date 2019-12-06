-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2019 at 04:09 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exam`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `avg` (IN `id` INT)  BEGIN	
DECLARE a,b,c,d INT;
select score INTO c from css where reg_id = id;
select score INTO a from angular where reg_id = id;
set b=a+c;
set d=b/2;
select d;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `avg1` (IN `id` INT)  BEGIN
DECLARE a,b,c,d int;
select score into a from mongodb where reg_id = id;
select score into b from nodejs where reg_id = id;
set c=a+b;
set d=c/2;
select d;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `angular`
--

CREATE TABLE `angular` (
  `reg_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `angular`
--

INSERT INTO `angular` (`reg_id`, `score`) VALUES
(468085, 4),
(379859, 7),
(21184, 9),
(6202486, 8),
(1794672, 4),
(4030304, 0),
(4698232, 0);

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `sno` int(11) NOT NULL,
  `answer` varchar(30) DEFAULT NULL,
  `q_id` varchar(6) DEFAULT NULL,
  `sub_id` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`sno`, `answer`, `q_id`, `sub_id`) VALUES
(1, 'option_a', '1cs01', '1cs'),
(2, 'option_b', '1cs02', '1cs'),
(3, 'option_a', '1cs03', '1cs'),
(4, 'option_a', '1cs04', '1cs'),
(5, 'option_b', '1cs05', '1cs'),
(6, 'option_a', '1cs06', '1cs'),
(7, 'option_a', '1cs07', '1cs'),
(8, 'option_a', '1cs08', '1cs'),
(9, 'option_b', '1cs09', '1cs'),
(10, 'option_a', '1cs10', '1cs'),
(11, 'option_a', '1ng01', '1ng'),
(12, 'option_b', '1ng02', '1ng'),
(13, 'option_a', '1ng03', '1ng'),
(14, 'option_a', '1ng04', '1ng'),
(15, 'option_b', '1ng05', '1ng'),
(16, 'option_b', '1ng06', '1ng'),
(17, 'option_c', '1ng07', '1ng'),
(18, 'option_c', '1ng08', '1ng'),
(19, 'option_c', '1ng09', '1ng'),
(20, 'option_a', '1ng10', '1ng'),
(21, 'option_b', '2nj01', '2nj'),
(22, 'option_d', '2nj02', '2nj'),
(23, 'option_a', '2nj03', '2nj'),
(24, 'option_d', '2nj04', '2nj'),
(25, 'option_a', '2nj05', '2nj'),
(26, 'option_d', '2nj06', '2nj'),
(27, 'option_a', '2nj07', '2nj'),
(28, 'option_b', '2nj08', '2nj'),
(29, 'option_a', '2nj09', '2nj'),
(30, 'option_c', '2nj10', '2nj');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course`) VALUES
(1, 'FrontEnd'),
(2, 'BackEnd');

-- --------------------------------------------------------

--
-- Table structure for table `css`
--

CREATE TABLE `css` (
  `reg_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `css`
--

INSERT INTO `css` (`reg_id`, `score`) VALUES
(468085, 2),
(2039241, 1),
(489365, 1),
(489365, 1),
(489365, 1),
(4049606, 2),
(379859, 4),
(21184, 8),
(6202486, 7),
(1794672, 2),
(4030304, 4),
(4698232, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mongodb`
--

CREATE TABLE `mongodb` (
  `reg_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mongodb`
--

INSERT INTO `mongodb` (`reg_id`, `score`) VALUES
(1794672, 0),
(4030304, 0),
(4698232, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nodejs`
--

CREATE TABLE `nodejs` (
  `reg_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nodejs`
--

INSERT INTO `nodejs` (`reg_id`, `score`) VALUES
(1794672, 0),
(4030304, 0),
(4698232, 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `q_id` varchar(6) NOT NULL,
  `question` varchar(200) DEFAULT NULL,
  `option_a` varchar(100) DEFAULT NULL,
  `option_b` varchar(100) DEFAULT NULL,
  `option_c` varchar(100) DEFAULT NULL,
  `option_d` varchar(100) DEFAULT NULL,
  `sub_id` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`q_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `sub_id`) VALUES
('1cs01', 'If we want define style for an unique element, then which css selector will we use?', 'id', 'class', 'text', 'name', '1cs'),
('1cs02', 'If we don\'t want to allow a floating div to the left side of an element, which css property will we use?', 'margin', 'clear', 'padding', 'float', '1cs'),
('1cs03', 'If we want to wrap a block of text around an image, which css property will we use?', 'float', 'margin', 'padding', 'wrap', '1cs'),
('1cs04', 'Which of the following properties will we use to display border around a cell without any content?', 'empty-cell', 'content-cell', 'noncontent-cell', 'none', '1cs'),
('1cs05', 'What should be the table width, so that the width of a table adjust to the current width of the browser window?', '640px', '100%', '1024px', 'full-screen', '1cs'),
('1cs06', 'Which attribute can be added to many HTML / XHTML elements to identify them as a member of a specific group?', 'class', 'id', 'span', 'div', '1cs'),
('1cs07', 'How can we write comment along with CSS code?', '/* a comment */', '/ a comment /', '// a comment //', ' a comment', '1cs'),
('1cs08', 'Which css property you will use if you want to add some margin between a DIV\'s border and its inner text?', 'padding', 'margin', 'float', 'inner-margin', '1cs'),
('1cs09', 'Which CSS property is used to control the text size of an element?', 'font-style', 'font-size', 'text-size', 'text-style', '1cs'),
('1cs10', 'The default value of POSITION attribute is', 'default', 'fixed', 'relative', 'sticky', '1cs'),
('1ng01', 'Which file is responsible for startup of angular2+ project?', 'main.ts', 'index.js', 'app.ts', 'angular.cli.json', '1ng'),
('1ng02', 'which of the following is correct way to apply a filter?', '-Property-value || filter', '-Property-value | filter', '-Property-value & filter', 'None of the above', '1ng'),
('1ng03', 'What is the decorator used for configuring your module class?', '@NgModule', '@NgApp', '@NgDecorator', '@NgConfigure', '1ng'),
('1ng04', 'Interpolation in Angular is done using', '{{}}', '{}', '!!!!', '[]', '1ng'),
('1ng05', 'What does AOT stand for?', 'Angular Object template', 'ahead-of-time compilation', 'Angular Open Terminal', 'None Of the above', '1ng'),
('1ng06', 'Which of the following is a filter that changes all alphabets to uppercase?', 'upper', 'uppercase', 'toUpper', 'None of the above', '1ng'),
('1ng07', 'Which of the following is not a life cycle hook in Angular?', 'ngOnInit', 'ngOnChanges', 'ngViewStart', 'ngAfterViewInit', '1ng'),
('1ng08', 'What is .subscribe?', 'streams data asynchronously', 'Streams data synchronously', 'Both', 'None of the Above', '1ng'),
('1ng09', 'Rxjs can be used for', 'Server Side', 'Browser', 'Both', 'None', '1ng'),
('1ng10', 'Which type of data do Observables help to manage?', 'Asynchronous', 'Synchronous', 'Static', 'Both A and B', '1ng'),
('2nj01', 'Node Js is written in', 'c', 'c++', 'Javascript', 'Python', '2nj'),
('2nj02', 'Which of the following is not a built-in node module?', 'path', 'http', 'dgram', 'fsread', '2nj'),
('2nj03', 'What is the default scope in Node.js application?', 'Local', 'Private', 'Public', 'Global', '2nj'),
('2nj04', 'In which of the following areas, node Js is suitable', 'I/O bound Applications', 'Data Streaming Applications', 'Data Intensive Realtime Applications DIRT', 'All of the above', '2nj'),
('2nj05', 'REPL stands for', 'Read Eval Print Loop', 'Research Eval Program Learn', 'Read Earn Point Learn', 'Read Eval Point Loop', '2nj'),
('2nj06', 'Which of the following are Node.js stream types?', 'Writable', 'Duplex', 'Readable', 'All of the above', '2nj'),
('2nj07', 'Node uses _____ engine in core', 'chrome V8', 'Microsoft Chakra', 'SpiderMonkey', 'All of the above', '2nj'),
('2nj08', 'The Node Js modules can be exposed using', 'module.expose', 'module.export', 'module', 'None', '2nj'),
('2nj09', 'Which of the following converts buffer buf to JSON?', 'buf.json()', 'buf.toJson()', 'buf.ConvertToJson()', 'buf.jsonify', '2nj'),
('2nj10', 'Which of the following is a GUI based debugging tool for Node?', 'console', 'core node debugger', 'Node Inspector', 'None', '2nj');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `reg_id` int(11) NOT NULL,
  `reg_name` varchar(30) DEFAULT NULL,
  `reg_email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`reg_id`, `reg_name`, `reg_email`) VALUES
(21184, 'loki', 'loki@gmail.com'),
(379859, 'america', 'america@gmail.com'),
(468085, 'bulba', 'bulba@gmail.com'),
(489365, 'thor', 'thor@gmail.com'),
(666144, 'test23', 'test23@gmail.com'),
(698276, 'dylan', 'dylan@gmail.com'),
(750346, 'pika', 'pika@gmail.com'),
(1534423, 'teja7', 'teja7@gmail.com'),
(1690997, 'siddhesh', 'siddu@gmail.com'),
(1794672, 'antman', 'antman@gmail.com'),
(1867235, 'undefined', 'undefined'),
(2039241, 'rhino', 'rhino@gmail.com'),
(2498849, 'keshav ', 'dadabhainoroji@gmail.com'),
(2586511, 'undefined', 'undefined'),
(3138945, 'keshav ', 'keshav@gmial.com'),
(3226314, 'teja2', 'teja2@gmail.com'),
(3619632, 'bhanu teja', 'teja@gmail.com'),
(4030304, 'panther', 'panther@gmail.com'),
(4049606, 'hulk', 'hulk@gmail.com'),
(4495275, 'ganavi', 'ganavi@gmail.com'),
(4659052, 'stilinski', 'stilinski@gmail.com'),
(4698232, 'cheetah', 'cheetah@gmail.com'),
(4874293, 'bhanu1', 'bhanu1@gmail.com'),
(5138224, 'test24', 'test24@gmail.com'),
(5362982, 'undefined', 'undefined'),
(5368295, 'ravi teja', 'ravi@gmail.com'),
(5535477, 'teja3', 'teja3@gmail.com'),
(5945747, 'undefined', 'undefined'),
(5976914, 'nachiketh', 'nachiketh011@gmail.com'),
(6060717, 'sourabh', 'sourabh@gmail.com'),
(6202486, 'drake', 'drake@gmail.com'),
(6275286, 'undefined', 'undefined'),
(6666291, 'teja1', 'teja1@gmail.com'),
(7396625, 'nikhil', 'nikhil@gmail.com'),
(7624806, 'undefined', 'undefined'),
(8237047, 'bhanu teja', 'bhanu.teja958@gmail.com'),
(8847997, 'undefined', 'undefined'),
(9228662, 'harish', 'harish@gmail.com'),
(9805026, 'mutahar', 'mutahar@gmail.com');

--
-- Triggers `registration`
--
DELIMITER $$
CREATE TRIGGER `regmanager` AFTER INSERT ON `registration` FOR EACH ROW BEGIN
insert into css values(new.reg_id,0);
insert into angular values(new.reg_id,0);
insert into mongodb values(new.reg_id,0);
insert into nodejs values(new.reg_id,0);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `sub_id` varchar(3) NOT NULL,
  `sub_name` varchar(30) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`sub_id`, `sub_name`, `course_id`) VALUES
('1cs', 'CSS', 1),
('1ng', 'Angular', 1),
('2md', 'MongoDB', 2),
('2nj', 'Node', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `angular`
--
ALTER TABLE `angular`
  ADD KEY `reg_id` (`reg_id`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `q_id` (`q_id`),
  ADD KEY `sub_id` (`sub_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `css`
--
ALTER TABLE `css`
  ADD KEY `reg_id` (`reg_id`);

--
-- Indexes for table `mongodb`
--
ALTER TABLE `mongodb`
  ADD KEY `reg_id` (`reg_id`);

--
-- Indexes for table `nodejs`
--
ALTER TABLE `nodejs`
  ADD KEY `reg_id` (`reg_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`q_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`reg_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`sub_id`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `angular`
--
ALTER TABLE `angular`
  ADD CONSTRAINT `angular_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `registration` (`reg_id`);

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`q_id`) REFERENCES `questions` (`q_id`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`sub_id`);

--
-- Constraints for table `css`
--
ALTER TABLE `css`
  ADD CONSTRAINT `css_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `registration` (`reg_id`);

--
-- Constraints for table `mongodb`
--
ALTER TABLE `mongodb`
  ADD CONSTRAINT `mongodb_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `registration` (`reg_id`);

--
-- Constraints for table `nodejs`
--
ALTER TABLE `nodejs`
  ADD CONSTRAINT `nodejs_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `registration` (`reg_id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
