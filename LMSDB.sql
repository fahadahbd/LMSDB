-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 08, 2022 at 02:34 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `LMSDB`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_member`
-- (See below for the actual view)
--
CREATE TABLE `all_member` (
`First_name` varchar(100)
,`Last_name` varchar(100)
,`Dept_name` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `Auth_id` int(11) NOT NULL,
  `First_name` varchar(100) NOT NULL,
  `Last_name` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`Auth_id`, `First_name`, `Last_name`, `Email`, `Country`) VALUES
(1, 'Thomas', 'H. Cormen', 'cormen@gmail.com', 'USA'),
(2, 'Brian', 'W. Kernighan', 'kernighan@gmail.com', 'Canada'),
(3, 'Daniel', 'Liang', 'daniel@hotmail.com', 'USA'),
(4, 'Robert', 'Sedgewick', 'robert@yahoo.com', 'USA'),
(5, 'Kazi Nazrul ', 'Islam', 'nationalpoet@govt.bd', 'Bangladesh'),
(6, 'Rabindranath ', 'Tagore', 'tagore@govt.in', 'India'),
(7, 'Humayun ', 'Ahmed', 'humayun@ahmed.me', 'Bangladesh');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `Serial` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Shelf_id` varchar(5) NOT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `Number_of_pages` int(11) DEFAULT NULL,
  `Publication` varchar(50) DEFAULT NULL,
  `Edition` varchar(5) DEFAULT NULL,
  `Publish_date` date DEFAULT NULL,
  `Library_name` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Serial`, `Name`, `Shelf_id`, `ISBN`, `Number_of_pages`, `Publication`, `Edition`, `Publish_date`, `Library_name`) VALUES
(1, 'Introduction to algorithms', 'A1', '9780262033848', 1312, 'The MIT Press', '3rd', '1989-01-01', 'EWU Library'),
(2, 'The C Programming Language', 'A2', '9780131103627', 288, 'Pretice Hall', '2nd', '1988-03-22', 'EWU Library'),
(3, 'Introduction to Java programming', 'B1', '9780133813487', 1344, '', '7th', '1997-01-12', 'EWU Library'),
(4, 'Algorithms', 'B2', '9780321573513', 967, '', '4th', '1983-01-01', 'EWU Library'),
(5, ' Agni-veena', 'C1', '9845553095', 120, '', '1st', '1922-10-01', 'EWU Library'),
(6, 'Gitanjali', 'C1', '9780333422175', 104, '', '1st', '1910-01-01', 'EWU Library'),
(7, 'Jochona O Jononir Golpo', 'C1', '9848682767', 527, 'Onnona', '2nd', '2004-02-01', 'EWU Library');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `Inst_id` varchar(20) NOT NULL,
  `First_name` varchar(100) NOT NULL,
  `Last_name` varchar(100) DEFAULT NULL,
  `Dept_name` varchar(10) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Postal_code` int(11) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `MembershipID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`Inst_id`, `First_name`, `Last_name`, `Dept_name`, `Email`, `Postal_code`, `City`, `Street`, `Date_of_birth`, `MembershipID`) VALUES
('1001', 'TJ', 'Taskid Jabed', 'CSE', 'tj@ewubd.edu', 1212, 'Dhaka', 'Jahurul Islam', NULL, 1),
('1002', 'DAWR', 'Ahamed Reza', 'CSE', 'dawr@ewubd.edu', 1212, 'Dhaka', 'Jahurul Islam', NULL, 2),
('1003', 'MI', 'Maheen Islam', 'CSE', 'mi@ewubd.edu', 1212, 'Dhaka', 'Jahurul Islam', NULL, 3),
('1004', 'MRA', 'Ruhul Amin', 'MPS', 'mra@ewubd.edu', 1212, 'Dhaka', 'Jahurul Islam', NULL, 4),
('1005', 'MKR', 'Mostofa Kamal Rasel', 'CSE', 'mkr@ewund.edu', 1212, 'Dhaka', 'Jahurul Islam', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `instructor_Phone`
--

CREATE TABLE `instructor_Phone` (
  `Phone` varchar(15) NOT NULL,
  `Inst_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instructor_Phone`
--

INSERT INTO `instructor_Phone` (`Phone`, `Inst_id`) VALUES
('01512345678', '1004'),
('01612345678', '1003'),
('01712345678', '1001'),
('01812345678', '1001'),
('01812345678', '1005'),
('01912345678', '1002');

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `MembershipID` int(11) NOT NULL,
  `Serial` int(11) NOT NULL,
  `Borrow_date` date NOT NULL,
  `Return_date` date NOT NULL,
  `Number_of_books` int(11) DEFAULT NULL CHECK (`Number_of_books` <= 2 and `Number_of_books` > 0),
  `Fine` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`MembershipID`, `Serial`, `Borrow_date`, `Return_date`, `Number_of_books`, `Fine`) VALUES
(2, 7, '2022-09-04', '2022-09-11', 1, NULL),
(7, 3, '2022-09-05', '2022-09-12', 1, NULL),
(10, 1, '2022-09-04', '2022-09-08', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `Library_name` varchar(15) NOT NULL,
  `Contact` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`Library_name`, `Contact`) VALUES
('EWU Library', '09666775577');

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE `Member` (
  `MembershipID` int(11) NOT NULL,
  `Status` varchar(15) NOT NULL,
  `Library_name` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`MembershipID`, `Status`, `Library_name`) VALUES
(1, 'Instructor', 'EWU Library'),
(2, 'Instructor', 'EWU Library'),
(3, 'Instructor', 'EWU Library'),
(4, 'Instructor', 'EWU Library'),
(5, 'Instructor', 'EWU Library'),
(6, 'Student', 'EWU Library'),
(7, 'Student', 'EWU Library'),
(8, 'Student', 'EWU Library'),
(9, 'Student', 'EWU Library'),
(10, 'Student', 'EWU Library'),
(11, 'Student', 'EWU Library');

-- --------------------------------------------------------

--
-- Table structure for table `shelf`
--

CREATE TABLE `shelf` (
  `Shelf_id` varchar(5) NOT NULL,
  `Row_number` int(11) NOT NULL,
  `Shelf_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shelf`
--

INSERT INTO `shelf` (`Shelf_id`, `Row_number`, `Shelf_number`) VALUES
('A1', 10, 2),
('A2', 10, 2),
('B1', 10, 3),
('B2', 10, 3),
('C1', 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_id` int(11) NOT NULL,
  `First_name` varchar(100) NOT NULL,
  `Last_name` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `Postal_code` int(11) DEFAULT NULL,
  `Library_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_id`, `First_name`, `Last_name`, `Email`, `City`, `Street`, `Postal_code`, `Library_name`) VALUES
(1, 'Kazi', 'Anuar', 'anuar@ewubd.edu', 'Dhaka', 'Jahurul Islam', 1212, 'EWU Library'),
(2, 'Hossain', 'Alam', 'alam@ewubd.edu', 'Dhaka', 'Jatrabari', 1310, 'EWU Library'),
(3, 'Kajol', 'Rahman', 'rah@ewubd.edu', 'Dhaka', 'Nuzrul Avenue', 1310, 'EWU Library');

-- --------------------------------------------------------

--
-- Table structure for table `staff_Phone`
--

CREATE TABLE `staff_Phone` (
  `Phone` varchar(15) NOT NULL,
  `Staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff_Phone`
--

INSERT INTO `staff_Phone` (`Phone`, `Staff_id`) VALUES
('01511122234', 2),
('01512121212', 1),
('01521212121', 2),
('01999121212', 3);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Std_id` varchar(20) NOT NULL,
  `First_name` varchar(100) NOT NULL,
  `Last_name` varchar(100) DEFAULT NULL,
  `MembershipID` int(11) DEFAULT NULL,
  `Dept_name` varchar(10) NOT NULL,
  `Semester` varchar(20) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Postal_code` int(11) DEFAULT NULL,
  `Date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Std_id`, `First_name`, `Last_name`, `MembershipID`, `Dept_name`, `Semester`, `Email`, `Street`, `City`, `Postal_code`, `Date_of_birth`) VALUES
('2020-1-60-001', 'Bob', 'B', 9, 'CSE', 'Spring2020', '2020-1-60-001@std.ewubd.edu', 'Jahurul Islam', 'Dhaka', 1212, NULL),
('2020-2-60-001', 'Tom', 'T', 10, 'CSE', 'Summer2020', '2020-2-60-001@std.ewubd.edu', 'Jahurul Islam', 'Dhaka', 1212, '2000-02-06'),
('2021-2-50-111', 'Job', 'J', 8, 'MPS', 'Summer2021', '2021-2-50-111@std.ewubd.edu', NULL, 'Dhaka', 1361, '1999-03-09'),
('2021-3-80-101', 'Ramim', 'R', 7, 'EEE', 'Fall2021', '2021-3-80-101@std.ewubd.edu', NULL, 'Dhaka', 1222, '2000-03-09');

-- --------------------------------------------------------

--
-- Table structure for table `student_Phone`
--

CREATE TABLE `student_Phone` (
  `Phone` varchar(15) NOT NULL,
  `Std_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_Phone`
--

INSERT INTO `student_Phone` (`Phone`, `Std_id`) VALUES
('01521583475', '2021-2-50-111'),
('01712345600', '2020-1-60-001'),
('01712345611', '2020-2-60-001'),
('01712345999', '2021-3-80-101'),
('01812345111', '2021-2-50-111');

-- --------------------------------------------------------

--
-- Table structure for table `written_by`
--

CREATE TABLE `written_by` (
  `Auth_id` int(11) NOT NULL,
  `Serial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `written_by`
--

INSERT INTO `written_by` (`Auth_id`, `Serial`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- --------------------------------------------------------

--
-- Structure for view `all_member`
--
DROP TABLE IF EXISTS `all_member`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lmsdb`.`all_member`  AS   (select `lmsdb`.`instructor`.`First_name` AS `First_name`,`lmsdb`.`instructor`.`Last_name` AS `Last_name`,`lmsdb`.`instructor`.`Dept_name` AS `Dept_name` from (`lmsdb`.`instructor` join `lmsdb`.`member`) where `lmsdb`.`instructor`.`MembershipID` = `lmsdb`.`member`.`MembershipID`) union (select `lmsdb`.`student`.`First_name` AS `First_name`,`lmsdb`.`student`.`Last_name` AS `Last_name`,`lmsdb`.`student`.`Dept_name` AS `Dept_name` from (`lmsdb`.`student` join `lmsdb`.`member`) where `lmsdb`.`student`.`MembershipID` = `lmsdb`.`member`.`MembershipID`)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`Auth_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Serial`),
  ADD KEY `Shelf_id` (`Shelf_id`),
  ADD KEY `Library_name` (`Library_name`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`Inst_id`),
  ADD KEY `MembershipID` (`MembershipID`);

--
-- Indexes for table `instructor_Phone`
--
ALTER TABLE `instructor_Phone`
  ADD PRIMARY KEY (`Phone`,`Inst_id`),
  ADD KEY `Inst_id` (`Inst_id`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`MembershipID`),
  ADD KEY `Serial` (`Serial`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`Library_name`);

--
-- Indexes for table `Member`
--
ALTER TABLE `Member`
  ADD PRIMARY KEY (`MembershipID`),
  ADD KEY `Library_name` (`Library_name`);

--
-- Indexes for table `shelf`
--
ALTER TABLE `shelf`
  ADD PRIMARY KEY (`Shelf_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_id`),
  ADD KEY `Library_name` (`Library_name`);

--
-- Indexes for table `staff_Phone`
--
ALTER TABLE `staff_Phone`
  ADD PRIMARY KEY (`Phone`,`Staff_id`),
  ADD KEY `Staff_id` (`Staff_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Std_id`),
  ADD KEY `MembershipID` (`MembershipID`);

--
-- Indexes for table `student_Phone`
--
ALTER TABLE `student_Phone`
  ADD PRIMARY KEY (`Phone`,`Std_id`),
  ADD KEY `Std_id` (`Std_id`);

--
-- Indexes for table `written_by`
--
ALTER TABLE `written_by`
  ADD PRIMARY KEY (`Auth_id`,`Serial`),
  ADD KEY `Serial` (`Serial`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `Auth_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `Serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Member`
--
ALTER TABLE `Member`
  MODIFY `MembershipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `Staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `written_by`
--
ALTER TABLE `written_by`
  MODIFY `Auth_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`Shelf_id`) REFERENCES `shelf` (`Shelf_id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`Library_name`) REFERENCES `library` (`Library_name`);

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`MembershipID`) REFERENCES `Member` (`MembershipID`);

--
-- Constraints for table `instructor_Phone`
--
ALTER TABLE `instructor_Phone`
  ADD CONSTRAINT `instructor_phone_ibfk_1` FOREIGN KEY (`Inst_id`) REFERENCES `instructor` (`Inst_id`);

--
-- Constraints for table `issue`
--
ALTER TABLE `issue`
  ADD CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`MembershipID`) REFERENCES `Member` (`MembershipID`),
  ADD CONSTRAINT `issue_ibfk_2` FOREIGN KEY (`Serial`) REFERENCES `book` (`Serial`);

--
-- Constraints for table `Member`
--
ALTER TABLE `Member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`Library_name`) REFERENCES `library` (`Library_name`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Library_name`) REFERENCES `library` (`Library_name`);

--
-- Constraints for table `staff_Phone`
--
ALTER TABLE `staff_Phone`
  ADD CONSTRAINT `staff_phone_ibfk_1` FOREIGN KEY (`Staff_id`) REFERENCES `staff` (`Staff_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`MembershipID`) REFERENCES `Member` (`MembershipID`);

--
-- Constraints for table `student_Phone`
--
ALTER TABLE `student_Phone`
  ADD CONSTRAINT `student_phone_ibfk_1` FOREIGN KEY (`Std_id`) REFERENCES `student` (`Std_id`);

--
-- Constraints for table `written_by`
--
ALTER TABLE `written_by`
  ADD CONSTRAINT `written_by_ibfk_1` FOREIGN KEY (`Auth_id`) REFERENCES `author` (`Auth_id`),
  ADD CONSTRAINT `written_by_ibfk_2` FOREIGN KEY (`Serial`) REFERENCES `book` (`Serial`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
