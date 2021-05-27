-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2021 at 02:13 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rasadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `level_1`
--

CREATE TABLE `level_1` (
  `level_1_id` int(11) NOT NULL,
  `payload` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_1`
--

INSERT INTO `level_1` (`level_1_id`, `payload`, `title`) VALUES
(1, 'undergraduate', 'Undergraduate'),
(2, 'postgraduate', 'Postgraduate'),
(3, 'postgraduatediploma', 'Postgraduate Diploma'),
(4, 'diploma', 'Diploma'),
(5, 'phd', 'PhD');

-- --------------------------------------------------------

--
-- Table structure for table `level_2`
--

CREATE TABLE `level_2` (
  `level_2_id` int(11) NOT NULL,
  `payload` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `level_1_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_2`
--

INSERT INTO `level_2` (`level_2_id`, `payload`, `title`, `level_1_id_fk`) VALUES
(1, 'aviation', 'Aviation, Hospitality & Customer Service', 4),
(2, 'hindi', 'Hindi', 5),
(3, 'geography', 'Geography', 5),
(4, 'geography', 'Geography', 3),
(5, 'computerscience', 'Computer Science', 3),
(6, 'masterofarts', 'Master of Arts', 2),
(7, 'masterofscience', 'Master of Sciece', 2),
(8, 'bachelorofvocation', 'Bachelor of Vocation', 1),
(9, 'bachelorofarts', 'Bachelor of Arts', 1),
(10, 'bachelorofscience', 'Bachelor of Science', 1);

-- --------------------------------------------------------

--
-- Table structure for table `level_3`
--

CREATE TABLE `level_3` (
  `level_3_id` int(11) NOT NULL,
  `payload` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `level_2_id_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_3`
--

INSERT INTO `level_3` (`level_3_id`, `payload`, `title`, `level_2_id_fk`) VALUES
(1, 'computerscience', 'Computer Science', 10),
(2, 'chemistry', 'Chemistry', 10),
(3, 'biochemistry', 'Biochemistry', 10),
(4, 'geography', 'Geography', 10),
(5, 'mathematics', 'Mathematics', 10),
(6, 'geology', 'Geology', 10),
(7, 'biotechnology', 'Biotechonology', 10),
(8, 'botany', 'Botany', 10),
(9, 'physics', 'Physics', 10),
(10, 'english', 'English', 9),
(11, 'economics', 'Economics', 9),
(12, 'hindi', 'Hindi', 9),
(13, 'geography', 'Geography', 9),
(14, 'history', 'History', 9),
(15, 'french', 'French', 9),
(16, 'konkani', 'Konkani', 9),
(17, 'marathi', 'Marathi', 9),
(18, 'psychology', 'Psychology', 9),
(19, 'philosophy', 'Philosophy', 9),
(20, 'sociology ', 'Sociology', 9),
(21, 'portuguese', 'Portuguese', 9),
(22, 'softwaredevelopment', 'Software Development', 8),
(23, 'multimedia', 'Multimedia', 8),
(24, 'VFX', 'VFX', 8),
(25, 'computerscience', 'Computer Science', 7),
(26, 'chemistry', 'Chemistry', 7),
(27, 'geography', 'Geography', 7),
(28, 'economics', 'Economics', 6),
(29, 'english', 'English', 6),
(30, 'psychology', 'Psychology', 6),
(31, 'geography', 'Geography', 6),
(32, 'na', 'na', 5),
(33, 'na', 'na', 4),
(34, 'na', 'na', 3),
(35, 'na', 'na', 2),
(36, 'na', 'na', 1),
(37, 'zoology', 'Zoology', 10);

-- --------------------------------------------------------

--
-- Table structure for table `level_4`
--

CREATE TABLE `level_4` (
  `level_4_id` int(11) NOT NULL,
  `payload` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `level_3_id_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_4`
--

INSERT INTO `level_4` (`level_4_id`, `payload`, `title`, `level_3_id_fk`) VALUES
(1, 'subjectdetails', 'Subject Details', 1),
(2, 'fees', 'Fees', 1),
(3, 'admissiondetails', 'Admission Details', 1),
(4, 'faq', 'FAQ\'s', 1),
(5, 'subjectdetails', 'Subject Details', 2),
(6, 'fees', 'Fees', 2),
(7, 'admissiondetails', 'Admission Details', 2),
(8, 'faqs', 'FAQ\'s', 2),
(9, 'subjectdetails', 'Subject Details', 3),
(10, 'fees', 'Fees', 3),
(11, 'admissiondetails', 'Admission Details', 3),
(12, 'faqs', 'FAQ\'s', 3),
(13, 'subjectdetails', 'Subject Details', 4),
(14, 'fees', 'Fees', 4),
(15, 'admissiondetails', 'Admission Details', 4),
(16, 'faqs', 'FAQ\'s', 4),
(17, 'subjectdetails', 'Subject Details', 5),
(18, 'fees', 'Fees', 5),
(19, 'admissiondetails', 'Admission Details', 5),
(20, 'faq', 'FAQ\'s', 5),
(21, 'subjectdetails', 'Subject Details', 6),
(22, 'fees', 'Fees', 6),
(23, 'admissiondetails', 'Admission Details', 6),
(24, 'faq', 'FAQ\'s', 6),
(25, 'subjectdetails', 'Subject Details', 7),
(26, 'fees', 'Fees', 7),
(27, 'admissiondetails', 'Admission Details', 7),
(28, 'faq', 'FAQ\'s', 7),
(29, 'subjectdetails', 'Subject Details', 8),
(30, 'fees', 'Fees', 8),
(31, 'admissiondetails', 'Admission Details', 8),
(32, 'faq', 'FAQ\'s', 8),
(33, 'subjectdetails', 'Subject Details', 9),
(34, 'fees', 'Fees', 9),
(35, 'admissiondetails', 'Admission Details', 9),
(36, 'faq', 'FAQ\'s', 9),
(37, 'subjectdetails', 'Subject Details', 10),
(38, 'fees', 'Fees', 10),
(39, 'admissiondetails', 'Admission Details', 10),
(40, 'faq', 'FAQ\'s', 10),
(41, 'subjectdetails', 'Subject Details', 11),
(42, 'fees', 'Fees', 11),
(43, 'admissiondetails', 'Admission Details', 11),
(44, 'faq', 'FAQ\'s', 11),
(45, 'subjectdetails', 'Subject Details', 12),
(46, 'fees', 'Fees', 12),
(47, 'admissiondetails', 'Admission Details', 12),
(48, 'faq', 'FAQ\'s', 12),
(49, 'subjectdetails', 'Subject Details', 13),
(50, 'fees', 'Fees', 13),
(51, 'admissiondetails', 'Admission Details', 13),
(52, 'faq', 'FAQ\'s', 13),
(53, 'subjectdetails', 'Subject Details', 14),
(54, 'fees', 'Fees', 14),
(55, 'admissiondetails', 'Admission Details', 14),
(56, 'faq', 'FAQ\'s', 14),
(57, 'subjectdetails', 'Subject Details', 15),
(58, 'fees', 'Fees', 15),
(59, 'admissiondetails', 'Admission Details', 15),
(60, 'faq', 'FAQ\'s', 15),
(61, 'subjectdetails', 'Subject Details', 16),
(62, 'fees', 'Fees', 16),
(63, 'admissiondetails', 'Admission Details', 16),
(64, 'faq', 'FAQ\'s', 16),
(65, 'subjectdetails', 'Subject Details', 17),
(66, 'fees', 'Fees', 17),
(67, 'admissiondetails', 'Admission Details', 17),
(68, 'faq', 'FAQ\'s', 17),
(69, 'subjectdetails', 'Subject Details', 18),
(70, 'fees', 'Fees', 18),
(71, 'admissiondetails', 'Admission Details', 18),
(72, 'faq', 'FAQ\'s', 18),
(73, 'subjectdetails', 'Subject Details', 19),
(74, 'fees', 'Fees', 19),
(75, 'admissiondetails', 'Admission Details', 19),
(76, 'faq', 'FAQ\'s', 19),
(77, 'subjectdetails', 'Subject Details', 20),
(78, 'fees', 'Fees', 20),
(79, 'admissiondetails', 'Admission Details', 20),
(80, 'faq', 'FAQ\'s', 20),
(81, 'subjectdetails', 'Subject Details', 21),
(82, 'fees', 'Fees', 21),
(83, 'admissiondetails', 'Admission Details', 21),
(84, 'faq', 'FAQ\'s', 21),
(85, 'subjectdetails', 'Subject Details', 22),
(86, 'fees', 'Fees', 22),
(87, 'admissiondetails', 'Admission Details', 22),
(88, 'faq', 'FAQ\'s', 22),
(89, 'subjectdetails', 'Subject Details', 23),
(90, 'fees', 'Fees', 23),
(91, 'admissiondetails', 'Admission Details', 23),
(92, 'faq', 'FAQ\'s', 23),
(93, 'subjectdetails', 'Subject Details', 24),
(94, 'fees', 'Fees', 24),
(95, 'admissiondetails', 'Admission Details', 24),
(96, 'faq', 'FAQ\'s', 24),
(97, 'subjectdetails', 'Subject Details', 25),
(98, 'fees', 'Fees', 25),
(99, 'admissiondetails', 'Admission Details', 25),
(100, 'faq', 'FAQ\'s', 25),
(101, 'subjectdetails', 'Subject Details', 37),
(102, 'fees', 'Fees', 37),
(103, 'admissiondetails', 'Admission Details', 37),
(104, 'faq', 'FAQ\'s', 37),
(105, 'subjectdetails', 'Subject Details', 26),
(106, 'fees', 'Fees', 26),
(107, 'admissiondetails', 'Admission Details', 26),
(108, 'faq', 'FAQ\'s', 26),
(109, 'subjectdetails', 'Subject Details', 27),
(110, 'fees', 'Fees', 27),
(111, 'admissiondetails', 'Admission Details', 27),
(112, 'faq', 'FAQ\'s', 27),
(113, 'subjectdetails', 'Subject Details', 28),
(114, 'fees', 'Fees', 28),
(115, 'admissiondetails', 'Admission Details', 28),
(116, 'faq', 'FAQ\'s', 28),
(117, 'subjectdetails', 'Subject Details', 29),
(118, 'fees', 'Fees', 29),
(119, 'admissiondetails', 'Admission Details', 29),
(120, 'faq', 'FAQ\'s', 29),
(121, 'subjectdetails', 'Subject Details', 30),
(122, 'fees', 'Fees', 30),
(123, 'admissiondetails', 'Admission Details', 30),
(124, 'faq', 'FAQ\'s', 30),
(125, 'subjectdetails', 'Subject Details', 31),
(126, 'fees', 'Fees', 31),
(127, 'admissiondetails', 'Admission Details', 31),
(128, 'faq', 'FAQ\'s', 31),
(129, 'subjectdetails', 'Subject Details', 33),
(130, 'fees', 'Fees', 33),
(131, 'admissiondetails', 'Admission Details', 33),
(132, 'faq', 'FAQ\'s', 33),
(133, 'subjectdetails', 'Subject Details', 34),
(134, 'fees', 'Fees', 34),
(135, 'admissiondetails', 'Admission Details', 34),
(136, 'faq', 'FAQ\'s', 34),
(137, 'subjectdetails', 'Subject Details', 35),
(138, 'fees', 'Fees', 35),
(139, 'admissiondetails', 'Admission Details', 35),
(140, 'faq', 'FAQ\'s', 35),
(141, 'subjectdetails', 'Subject Details', 36),
(142, 'fees', 'Fees', 36),
(143, 'admissiondetails', 'Admission Details', 36),
(144, 'faq', 'FAQ\'s', 36);

-- --------------------------------------------------------

--
-- Table structure for table `level_5`
--

CREATE TABLE `level_5` (
  `level_5_id` int(11) NOT NULL,
  `level_4_id_fk` int(11) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_5`
--

INSERT INTO `level_5` (`level_5_id`, `level_4_id_fk`, `details`) VALUES
(1, 1, 'This B.Sc programme is for students interested in \r\nObject Oriented Programming, \r\nDatabase Administration, \r\nWeb Designing, \r\nSoftware Engineering, \r\nComputer Networking, \r\nOperating systems, \r\nServer Side Programming, \r\nMobile Application Development, \r\nMultimedia Techniques etc.\r\n\r\nB.Sc curriculum includes core courses in:\r\nProgramming, \r\nAdvanced Database Management Systems, \r\nOperating Systems, Data Structures, \r\nComputer Networking, \r\nComputer Architecture & Organization etc. \r\n\r\nThe elective courses include:\r\nSoftware engineering, \r\nWeb Designing, Server Side Programming, \r\nEmbedded Systems, \r\nHCI, \r\nCloud Computing, software Testing, \r\nMultimedia Techniques, \r\nDigital Marketing etc.\r\n'),
(2, 2, 'University fees : 630.00\r\nTuition fees : 2050.00\r\nExamination fees : 3550.00\r\nGeneral deposit : 230.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLaboratory pract fee : 2470.00\r\nLibrary fee : 470.00\r\nOther fee : 420.00\r\nI.T fee : 820.00\r\nStudent service charge : 10000.00\r\nIAIMS fees : 225.00\r\n\r\nTotal : 21415.00'),
(3, 3, 'How to apply:\r\nTo apply for admission, please visit our college website http://www.chowgules.ac.in/admission/\r\nand complete the online admission form as per instructions provided therein.\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self-attested) of each of the following documents\r\nalong with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript of\r\nrecords, copy of syllabus containing details of course of studies pursued in various courses in the\r\nexamination passed by the applicant (duly countersigned by High Commissioner of India in the\r\ncountry). If the student is found eligible, prima facie letter will be sent to the student for carrying\r\nout further necessary formalities. Following documents are required to be submitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy\r\n'),
(4, 4, ''),
(5, 5, 'BSc Chemistry is a 3 years undergraduate course in India. The course curriculum deals with various aspects of chemistry including chemical reactions and chemical composition of substances.\r\n\r\nB.Sc curriculum includes core courses in:\r\nGeneral Physical and Inorganic Chemistry,\r\nGeneral Organic and Inorganic Chemistry,\r\nConcepts in Physical and Analytical Chemistry,\r\nConcepts in Organic and Inorganic Chemistry,\r\nComprehensive Chemistry –I,\r\nComprehensive Chemistry –II,\r\nAdvanced Chemistry – I (Physical & Inorganic Chemistry), \r\nAdvanced Chemistry-II : Organic and Analytical Chemistry, etc.\r\n\r\nThe elective courses include:\r\nName Reactions and Synthetic Methodologies,\r\nIntroduction to Industrial Chemistry,\r\nSurface Chemistry and Catalysis,\r\nBioinorganic Chemistry,\r\nPharmaceutical Chemistry,\r\nPolymer and Colloid Science,\r\nSpectroscopic Techniques,\r\nChemistry of Natural Products, \r\nHeterocyclic Chemistry,\r\nNanomaterials and solid state Chemistry,\r\nOrganometallic Chemistry,\r\nChemistry of main group elements,\r\nSpectroscopic Methods in Organic Chemistry,\r\nEnvironmental Chemistry,\r\nSelected Topics in Inorganic Chemistry, etc\r\n'),
(6, 6, 'University fees : 630.00\r\nTuition fees : 2050.00\r\nExamination fees : 3550.00\r\nGeneral deposit : 230.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLaboratory pract fee : 2470.00\r\nLibrary fee : 470.00\r\nOther fee : 420.00\r\nI.T fee : 820.00\r\nStudent service charge : 10000.00\r\nIAIMS fees : 225.00\r\n\r\nTotal : 49300.00\r\n'),
(7, 7, 'How to apply: To apply for admission, please visit our college website http://www.chowgules.ac.in/admission/ and complete the online admission form as per instructions provided therein. Contact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in Documents required: Students are required to bring two photocopies (self-attested) of each of the following documents along with the originals at the time of admission.  a. For Goa Board students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Two photocopies of Leaving Certificate. 3. Two Photographs .  b. For other Board/Universities students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Original as well as two photocopies of Transfer/Leaving certificate. 3. Original as well as two photocopies of Migration certificate. 4. Provisional Eligibility Certificate from Chowgule college. 5. Two Photographs .  c. For International students: International students applying directly for admission need to submit an application to the Principal stating their desire to seek admission along with their Passing Certificate, Transcript of records, copy of syllabus containing details of course of studies pursued in various courses in the examination passed by the applicant (duly countersigned by High Commissioner of India in the country). If the student is found eligible, prima facie letter will be sent to the student for carrying out further necessary formalities. Following documents are required to be submitted: 1. Four photocopies of qualifying examination mark sheets (XIIth). 2. Two Photographs. 3. Two photocopies of Student Visa. 4. Two photocopies of Passport. 5. Original AIDS Test Report. 6. Certificate of proficiency in English. 7. Equivalence Certificate. 8. Resident Permit and ‘C’ Form.  Once the student’s admission is confirmed, he/she is required to attend the Counselling session organized by the faculty of the department, the date of which will be intimated to students by the college authorities. a) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts  b) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above  c)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy'),
(8, 8, ''),
(9, 9, 'Bachelor of Science in Biochemistry or BSc Biochemistry is a 3-year undergraduate course in chemical and physio-chemical processes. It is a branch of science that deals with chemistry applied to the study of living organisms and the atoms and molecules which comprise living organisms.\r\n\r\nB.Sc curriculum includes core courses in:\r\nMolecules of Life, Cell Biology, \r\nProtein chemistry, Biophysics, \r\nEnzymology, \r\nMetabolism of Biomolecules, \r\nTools & Techniques in Biochemistry, \r\nMicrobiology, \r\nMolecular biology, \r\nImmunology, etc\r\n\r\nThe elective courses include:\r\nBioethics and Biosafety, \r\nPlant Biochemistry, \r\nHuman physiology, \r\nNutritional Biochemistry, \r\nHormone: Biochemistry and Function, \r\nAdvanced Cell Biology, \r\nConcepts in genetics, \r\nRegulation of gene expression, \r\nGenetic Engineering and Biotechnology, \r\nBioinformatics, \r\nBiochemical correlation of Diseases, \r\nClinical Biochemistry,\r\nEnvironmental Biochemistry, \r\nIndustrial Biochemistry, etc.\r\n'),
(10, 10, 'University fees : 800.00\r\nTuition fees : 2050.00\r\nExamination fees : 3550.00\r\nGeneral deposit : 230.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLaboratory pract fee : 2470.00\r\nLibrary fee : 470.00\r\nOther fee : 420.00\r\nI.T fee : 820.00\r\nStudent service charge : 10000.00\r\nIAIMS fees : 225.00\r\n\r\nTotal : 43000.00\r\n'),
(11, 11, 'How to apply: To apply for admission, please visit our college website http://www.chowgules.ac.in/admission/ and complete the online admission form as per instructions provided therein. Contact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in Documents required: Students are required to bring two photocopies (self-attested) of each of the following documents along with the originals at the time of admission.  a. For Goa Board students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Two photocopies of Leaving Certificate. 3. Two Photographs .  b. For other Board/Universities students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Original as well as two photocopies of Transfer/Leaving certificate. 3. Original as well as two photocopies of Migration certificate. 4. Provisional Eligibility Certificate from Chowgule college. 5. Two Photographs .  c. For International students: International students applying directly for admission need to submit an application to the Principal stating their desire to seek admission along with their Passing Certificate, Transcript of records, copy of syllabus containing details of course of studies pursued in various courses in the examination passed by the applicant (duly countersigned by High Commissioner of India in the country). If the student is found eligible, prima facie letter will be sent to the student for carrying out further necessary formalities. Following documents are required to be submitted: 1. Four photocopies of qualifying examination mark sheets (XIIth). 2. Two Photographs. 3. Two photocopies of Student Visa. 4. Two photocopies of Passport. 5. Original AIDS Test Report. 6. Certificate of proficiency in English. 7. Equivalence Certificate. 8. Resident Permit and ‘C’ Form.  Once the student’s admission is confirmed, he/she is required to attend the Counselling session organized by the faculty of the department, the date of which will be intimated to students by the college authorities. a) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts  b) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above  c)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy'),
(12, 12, ''),
(13, 13, 'BSc Geography or Bachelor in Science in Geography is an undergraduate degree with an emphasis on Geography for 3 years. It is the study of the Earth and its many properties, characteristics, people and phenomena, in addition to the map and geographical image-interpretation.\r\n\r\nB.Sc curriculum includes core courses in:\r\nIntroduction to Geography,\r\nFundamentals of Physical Geography,\r\nMeasurement Systems in Geography (Practical),\r\nPractical’s in Physical Geography (Practical),\r\nBasics of Human Geography,\r\nBasics of Regional Geography,\r\nPractical’s in Human Geography (Practical’s),\r\nPracticals  in Regional Geography (Practical’s),\r\nFundamentals of Remote Sensing and GIS,\r\nFundamentals of Geomorphology,\r\nFundamentals of Climatology,\r\nEcology and Terrestrial Environment\r\n\r\nThe elective courses include:\r\nSpatial Analysis,\r\nRaster and Vector Data Models in GIS,\r\nParticipatory GIS,\r\nApplied GIS,\r\nCoastal Geomorphology,\r\nFluvial Geomorphology,\r\nWatershed Management,\r\nBiogeography,\r\nGeography of Soil Studies,\r\nAgroMeteorology: Principles and Applications,\r\nField Survey in Physical Geography,\r\nQuantitative Techniques in Geography,\r\nRemote Sensing and Forest Ecology,\r\nAdvanced Coastal Geomorphology,\r\nEcology of Estuarine Environment,\r\nDisaster Management: Urban and Coastal, etc\r\n'),
(14, 14, 'University fees : 650.00\r\nTuition fees : 4000.00\r\nExamination fees : 3550.00\r\nGeneral deposit : 230.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLaboratory pract fee : 1470.00\r\nLibrary fee : 470.00\r\nOther fee : 420.00\r\nI.T fee : 820.00\r\nStudent service charge : 10000.00\r\nIAIMS fees : 225.00\r\n\r\nTotal : 41000.00\r\n'),
(15, 15, 'How to apply: To apply for admission, please visit our college website http://www.chowgules.ac.in/admission/ and complete the online admission form as per instructions provided therein. Contact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in Documents required: Students are required to bring two photocopies (self-attested) of each of the following documents along with the originals at the time of admission.  a. For Goa Board students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Two photocopies of Leaving Certificate. 3. Two Photographs .  b. For other Board/Universities students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Original as well as two photocopies of Transfer/Leaving certificate. 3. Original as well as two photocopies of Migration certificate. 4. Provisional Eligibility Certificate from Chowgule college. 5. Two Photographs .  c. For International students: International students applying directly for admission need to submit an application to the Principal stating their desire to seek admission along with their Passing Certificate, Transcript of records, copy of syllabus containing details of course of studies pursued in various courses in the examination passed by the applicant (duly countersigned by High Commissioner of India in the country). If the student is found eligible, prima facie letter will be sent to the student for carrying out further necessary formalities. Following documents are required to be submitted: 1. Four photocopies of qualifying examination mark sheets (XIIth). 2. Two Photographs. 3. Two photocopies of Student Visa. 4. Two photocopies of Passport. 5. Original AIDS Test Report. 6. Certificate of proficiency in English. 7. Equivalence Certificate. 8. Resident Permit and ‘C’ Form.  Once the student’s admission is confirmed, he/she is required to attend the Counselling session organized by the faculty of the department, the date of which will be intimated to students by the college authorities. a) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts  b) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above  c)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy'),
(16, 16, ''),
(17, 17, 'B.Sc curriculum includes core courses in:\r\nBasic Algebra\r\nBasic Real Analysis\r\nCoordinate Geometry\r\nMathematical Analysis\r\nDifferential Equations\r\nLinear Algebra\r\nFunctions of Several Variables\r\nVector Analysis\r\n\r\nThe elective courses include:\r\nAbstract Algebra\r\nNumber theory\r\nCombinatorics\r\nNumerical Methods\r\nAdvanced Analysis\r\nOperations Research\r\nCryptography\r\nMetric Spaces\r\nGraph Theory\r\nPedagogy of Mathematics\r\nComplex Analysis\r\nProbability Theory\r\nComputers for Mathematics\r\nComputational Linear Algebra\r\n'),
(18, 18, 'University fees : 780.00\r\nTuition fees : 5050.00\r\nExamination fees : 3550.00\r\nGeneral deposit : 230.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLibrary fee : 470.00\r\nOther fee : 420.00\r\nStudent service charge : 10000.00\r\nIAIMS fees : 225.00\r\n\r\nTotal : 46390.00\r\n'),
(19, 19, 'How to apply: To apply for admission, please visit our college website http://www.chowgules.ac.in/admission/ and complete the online admission form as per instructions provided therein. Contact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in Documents required: Students are required to bring two photocopies (self-attested) of each of the following documents along with the originals at the time of admission.  a. For Goa Board students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Two photocopies of Leaving Certificate. 3. Two Photographs .  b. For other Board/Universities students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Original as well as two photocopies of Transfer/Leaving certificate. 3. Original as well as two photocopies of Migration certificate. 4. Provisional Eligibility Certificate from Chowgule college. 5. Two Photographs .  c. For International students: International students applying directly for admission need to submit an application to the Principal stating their desire to seek admission along with their Passing Certificate, Transcript of records, copy of syllabus containing details of course of studies pursued in various courses in the examination passed by the applicant (duly countersigned by High Commissioner of India in the country). If the student is found eligible, prima facie letter will be sent to the student for carrying out further necessary formalities. Following documents are required to be submitted: 1. Four photocopies of qualifying examination mark sheets (XIIth). 2. Two Photographs. 3. Two photocopies of Student Visa. 4. Two photocopies of Passport. 5. Original AIDS Test Report. 6. Certificate of proficiency in English. 7. Equivalence Certificate. 8. Resident Permit and ‘C’ Form.  Once the student’s admission is confirmed, he/she is required to attend the Counselling session organized by the faculty of the department, the date of which will be intimated to students by the college authorities. a) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts  b) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above  c)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy'),
(20, 20, ''),
(21, 21, 'BSc Geology or Bachelor of Science in Geology is a 3 year-long undergraduate level bachelor degree course focused on earth science. The course involves the study of rocks, minerals, other solid substances, their compositions, their history and other processes involving them.\r\n\r\nB.Sc curriculum includes core courses in:\r\nFundamentals of Mineralogy,\r\nEarth’s Dynamics and Tectonics,\r\nElementary Petrology,\r\nPrinciples of Stratigraphy and Paleontology,\r\nAdvanced Mineralogy and Geochemistry,\r\nStructural Geology,\r\nSedimentary Petrology,\r\nCore Project,\r\nIgneous Petrology.\r\n\r\nThe elective courses include:\r\nPhysical Geology\r\nGroundwater and Hydrogeology\r\nOre Genesis\r\nMarine Geology\r\nOperational Geology and Gemmology\r\nEngineering Geology\r\nOptical Mineralogy\r\nNatural Hazards and Management\r\nGeotectonics GIS for Beginners \r\nPrecambrian Stratigraphy of India\r\nPetroleum Geology\r\nMetamorphic Petrology\r\nRemote Sensing and Digital Image Processing\r\nPhanerozoic Stratigraphy of India\r\nRock Structures and Deformation Microstructures\r\nSurveying, Mapping and Field Geology\r\nPrinciples of Geophysical Exploration and Mining\r\n'),
(22, 22, 'University fees : 620.00\r\nTuition fees : 4000.00\r\nExamination fees : 5000.00\r\nGeneral deposit : 230.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLaboratory pract fee : 3070.00\r\nLibrary fee : 470.00\r\nOther fee : 420.00\r\nI.T fee : 820.00\r\nStudent service charge : 10000.00\r\nIAIMS fees : 225.00\r\n\r\nTotal : 39600.00\r\n'),
(23, 23, 'How to apply: To apply for admission, please visit our college website http://www.chowgules.ac.in/admission/ and complete the online admission form as per instructions provided therein. Contact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in Documents required: Students are required to bring two photocopies (self-attested) of each of the following documents along with the originals at the time of admission.  a. For Goa Board students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Two photocopies of Leaving Certificate. 3. Two Photographs .  b. For other Board/Universities students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Original as well as two photocopies of Transfer/Leaving certificate. 3. Original as well as two photocopies of Migration certificate. 4. Provisional Eligibility Certificate from Chowgule college. 5. Two Photographs .  c. For International students: International students applying directly for admission need to submit an application to the Principal stating their desire to seek admission along with their Passing Certificate, Transcript of records, copy of syllabus containing details of course of studies pursued in various courses in the examination passed by the applicant (duly countersigned by High Commissioner of India in the country). If the student is found eligible, prima facie letter will be sent to the student for carrying out further necessary formalities. Following documents are required to be submitted: 1. Four photocopies of qualifying examination mark sheets (XIIth). 2. Two Photographs. 3. Two photocopies of Student Visa. 4. Two photocopies of Passport. 5. Original AIDS Test Report. 6. Certificate of proficiency in English. 7. Equivalence Certificate. 8. Resident Permit and ‘C’ Form.  Once the student’s admission is confirmed, he/she is required to attend the Counselling session organized by the faculty of the department, the date of which will be intimated to students by the college authorities. a) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts  b) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above  c)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy'),
(24, 24, ''),
(25, 25, 'Bachelor of Science in Biotechnology is a 3-year undergraduate course that allows the candidates to learn how technology is utilized to create useful and necessary products from living organisms. With advancement of genetic engineering and the subsequent rise in research related to the field of pharmacy, Courses in Biotechnology are in huge demand.\r\n\r\nB.Sc curriculum includes core courses in:\r\nBiomolecules, \r\nCell Biology, \r\nFundamental Genetics, \r\nBasic Microbiology, \r\nMolecular Biology, \r\nImmunology, \r\nConcepts in Genetic Engineering, \r\nIndustrial Biotechnology, etc.\r\n\r\nThe elective courses include:\r\nBasics of Plant and Animal Sciences,\r\nMetabolism of Biomolecules, \r\nBiostatistics, Enzymology, \r\nPlant and Animal Physiology, \r\nTools & Techniques in Biotechnology, \r\nEvolution and Anthropology, \r\nMolecular genetics, \r\nMolecular medicine,\r\nEnvironmental Biotechnology, \r\nPlant Biotechnology, \r\nBioinformatics, \r\nBioethics and Biosafety, \r\nAdvanced Cell Biology,\r\nFood Biotechnology, \r\nAnimal Cell Culture, etc.\r\n'),
(26, 26, 'University fees : 750.00\r\nTuition fees : 3000.00\r\nExamination fees : 3550.00\r\nGeneral deposit : 330.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 620.00\r\nLaboratory pract fee : 2470.00\r\nLibrary fee : 470.00\r\nOther fee : 420.00\r\nI.T fee : 820.00\r\nStudent service charge : 9000\r\nTotal : 41500.00\r\n'),
(27, 27, 'How to apply: To apply for admission, please visit our college website http://www.chowgules.ac.in/admission/ and complete the online admission form as per instructions provided therein. Contact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in Documents required: Students are required to bring two photocopies (self-attested) of each of the following documents along with the originals at the time of admission.  a. For Goa Board students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Two photocopies of Leaving Certificate. 3. Two Photographs .  b. For other Board/Universities students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Original as well as two photocopies of Transfer/Leaving certificate. 3. Original as well as two photocopies of Migration certificate. 4. Provisional Eligibility Certificate from Chowgule college. 5. Two Photographs .  c. For International students: International students applying directly for admission need to submit an application to the Principal stating their desire to seek admission along with their Passing Certificate, Transcript of records, copy of syllabus containing details of course of studies pursued in various courses in the examination passed by the applicant (duly countersigned by High Commissioner of India in the country). If the student is found eligible, prima facie letter will be sent to the student for carrying out further necessary formalities. Following documents are required to be submitted: 1. Four photocopies of qualifying examination mark sheets (XIIth). 2. Two Photographs. 3. Two photocopies of Student Visa. 4. Two photocopies of Passport. 5. Original AIDS Test Report. 6. Certificate of proficiency in English. 7. Equivalence Certificate. 8. Resident Permit and ‘C’ Form.  Once the student’s admission is confirmed, he/she is required to attend the Counselling session organized by the faculty of the department, the date of which will be intimated to students by the college authorities. a) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts  b) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above  c)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy'),
(28, 28, ''),
(29, 29, 'BSc Botany or Bachelor of Science in Botany is a 3-year undergraduate degree course, which deals with the study of plants and their physiology.\r\n\r\nB.Sc curriculum includes core courses in:\r\nPlant diversity,\r\nCell Biology & Biomolecules,\r\nPlant Anatomy and Embryology,\r\nMicrobiology,\r\nPhysiology of Plants,\r\nCytogenetics,\r\nPlant Molecular Biology,\r\nPlant Biotechnology and Genetic Engineering, etc.\r\n\r\nThe elective courses include:\r\nEcology & Conservation,\r\nTechniques and Instrumentation in Botany,\r\nEnzymes and metabolic pathways,\r\nHerbal Cosmetology,\r\nPlant Breeding and Biostatistics,\r\nSystematics of Flowering plants and Phylogeny,\r\nPlant pathology,\r\nAlgal Biotechnology,\r\nBioinformatics,\r\nSeed Technology,\r\nPlant drug Technology & Pharmacognosy,\r\nOrganic Farming,\r\nPlant tissue culture,\r\nHorticulture, Floriculture & Landscaping,\r\nEconomic Botany,\r\nApplied Mycology,etc\r\n'),
(30, 30, 'University fees : 6400.00\r\nTuition fees : 3900.00\r\nExamination fees : 3550.00\r\nGeneral deposit : 230.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLaboratory pract fee : 2470.00\r\nLibrary fee : 470.00\r\nOther fee : 420.00\r\nStudent service charge : 10000.00\r\nIAIMS fees : 265.00\r\n\r\nTotal : 48000.00\r\n'),
(31, 31, 'How to apply: To apply for admission, please visit our college website http://www.chowgules.ac.in/admission/ and complete the online admission form as per instructions provided therein. Contact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in Documents required: Students are required to bring two photocopies (self-attested) of each of the following documents along with the originals at the time of admission.  a. For Goa Board students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Two photocopies of Leaving Certificate. 3. Two Photographs .  b. For other Board/Universities students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Original as well as two photocopies of Transfer/Leaving certificate. 3. Original as well as two photocopies of Migration certificate. 4. Provisional Eligibility Certificate from Chowgule college. 5. Two Photographs .  c. For International students: International students applying directly for admission need to submit an application to the Principal stating their desire to seek admission along with their Passing Certificate, Transcript of records, copy of syllabus containing details of course of studies pursued in various courses in the examination passed by the applicant (duly countersigned by High Commissioner of India in the country). If the student is found eligible, prima facie letter will be sent to the student for carrying out further necessary formalities. Following documents are required to be submitted: 1. Four photocopies of qualifying examination mark sheets (XIIth). 2. Two Photographs. 3. Two photocopies of Student Visa. 4. Two photocopies of Passport. 5. Original AIDS Test Report. 6. Certificate of proficiency in English. 7. Equivalence Certificate. 8. Resident Permit and ‘C’ Form.  Once the student’s admission is confirmed, he/she is required to attend the Counselling session organized by the faculty of the department, the date of which will be intimated to students by the college authorities. a) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts  b) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above  c)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy'),
(32, 32, ''),
(33, 33, 'Bachelor of Science in Physics or BSc Physics is a 3 year undergraduate course, which deals with the nuances of Physics and its various properties. The curriculum is divided into 6 semesters, spanning over three years. It includes the specialized scientific study of Physics, Mathematics, and Chemistry in detail.\r\n\r\nB.Sc curriculum includes core courses in:\r\nIntroduction to Mathematical Physics\r\nMechanics\r\nHeat and Thermodynamics\r\nElectricity and Magnetism\r\nElectromagnetic Theory\r\nQuantum Mechanics\r\nAtomic and Molecular Physics\r\n\r\nThe elective courses include:\r\nOptics\r\nModern Physics\r\nOscillations, Waves and Sound\r\nIntroduction to Astronomy and Astrophysics\r\nInstrumentation \r\nElectronics \r\nIntroduction to Error Analysis\r\nProperties of Matter and Acoustics\r\nComputational Physics\r\nSolid State Physics\r\nThermodynamics and Statistical Mechanics\r\nMathematical Physics\r\nSolid State Devices\r\nNuclear and Elementary Particle Physics\r\nIntroduction to Special Theory of Relativity\r\nIntroduction to Material Science\r\n'),
(34, 34, 'University fees : 620.00\r\nTuition fees : 4000.00\r\nExamination fees : 5000.00\r\nGeneral deposit : 230.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLaboratory pract fee : 6000.00\r\nLibrary fee : 470.00\r\nOther fee : 420.00\r\nI.T fee : 820.00\r\nStudent service charge : 10000.00\r\nIAIMS fees : 225.00\r\n\r\nTotal : 42600.00\r\n'),
(35, 35, 'How to apply: To apply for admission, please visit our college website http://www.chowgules.ac.in/admission/ and complete the online admission form as per instructions provided therein. Contact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in Documents required: Students are required to bring two photocopies (self-attested) of each of the following documents along with the originals at the time of admission.  a. For Goa Board students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Two photocopies of Leaving Certificate. 3. Two Photographs .  b. For other Board/Universities students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Original as well as two photocopies of Transfer/Leaving certificate. 3. Original as well as two photocopies of Migration certificate. 4. Provisional Eligibility Certificate from Chowgule college. 5. Two Photographs .  c. For International students: International students applying directly for admission need to submit an application to the Principal stating their desire to seek admission along with their Passing Certificate, Transcript of records, copy of syllabus containing details of course of studies pursued in various courses in the examination passed by the applicant (duly countersigned by High Commissioner of India in the country). If the student is found eligible, prima facie letter will be sent to the student for carrying out further necessary formalities. Following documents are required to be submitted: 1. Four photocopies of qualifying examination mark sheets (XIIth). 2. Two Photographs. 3. Two photocopies of Student Visa. 4. Two photocopies of Passport. 5. Original AIDS Test Report. 6. Certificate of proficiency in English. 7. Equivalence Certificate. 8. Resident Permit and ‘C’ Form.  Once the student’s admission is confirmed, he/she is required to attend the Counselling session organized by the faculty of the department, the date of which will be intimated to students by the college authorities. a) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts  b) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above  c)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy'),
(36, 36, ''),
(37, 37, 'A three year bachelor\'s degree program in English language focuses on different aspects of the subject. This course looks at the history, grammar, and ancient forms of English.. Individuals who wish to teach English will need to take additional education courses in order to obtain a teaching license.\r\n\r\nB.a curriculum includes core courses in:\r\nUnderstanding Poetry & Drama\r\nHistory of English Literature from Fifth Century to the Eighteenth Century\r\nUnderstanding\r\nFiction An Introduction to Linguistics & Stylistics\r\nContemporary Indian English Literature \r\nLiterary Criticism\r\nNineteenth Century English Literature\r\nTwentieth Century English Literature\r\n\r\nEffective English Communication (Science Stream)\r\n\r\nThe elective courses include:\r\nWomen’s Writing in India\r\nAmerican Literature of the Twentieth Century\r\nWriting for the Media \r\nNew Literatures in English\r\nThe Literature of the Indian Diaspora\r\nVisual Literature\r\nWorld Literature\r\nShakespeare Today\r\nEnglish Language and Literature Teaching\r\nAncient Indian Classics in Translation OR Modern Indian Literature in Translation\r\nLatin American Literature\r\nFilm Studies\r\nContemporary Literary Theory\r\nGoan Literature and Culture\r\nRepresentation of Gender & Sexuality in Literature\r\n'),
(38, 38, 'University fees : 630.00\r\nTuition fees : 1530.00\r\nExamination fees : 3250.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 8000\r\nLibrary fee : 470.00\r\nStudent service charges : 10000.00\r\nIAIMS fees: 225\r\n\r\nTotal : 26035.00\r\n'),
(39, 39, 'How to apply:\r\nTo apply for admission, please visit our college website http://www.chowgules.ac.in/admission/\r\nand complete the online admission form as per instructions provided therein.\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self-attested) of each of the following documents\r\nalong with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript of\r\nrecords, copy of syllabus containing details of course of studies pursued in various courses in the\r\nexamination passed by the applicant (duly countersigned by High Commissioner of India in the\r\ncountry). If the student is found eligible, prima facie letter will be sent to the student for carrying\r\nout further necessary formalities. Following documents are required to be submitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy\r\n'),
(40, 40, ''),
(41, 41, 'economics'),
(42, 42, 'University fees : 620.00\r\nTuition fees : 1930.00\r\nExamination fees : 3650.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 8000\r\nLibrary fee : 470.00\r\nStudent service charges : 10000.00\r\nIAIMS fees: 225\r\n\r\nTotal : 28995.00\r\n'),
(43, 43, 'How to apply:\r\nTo apply for admission, please visit our college website http://www.chowgules.ac.in/admission/\r\nand complete the online admission form as per instructions provided therein.\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self-attested) of each of the following documents\r\nalong with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript of\r\nrecords, copy of syllabus containing details of course of studies pursued in various courses in the\r\nexamination passed by the applicant (duly countersigned by High Commissioner of India in the\r\ncountry). If the student is found eligible, prima facie letter will be sent to the student for carrying\r\nout further necessary formalities. Following documents are required to be submitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy\r\n'),
(44, 44, ''),
(45, 45, 'hindi details'),
(46, 46, 'University fees : 720.00\r\nTuition fees : 1230.00\r\nExamination fees : 3250.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 8000\r\nLibrary fee : 470.00\r\nStudent service charges : 8000.00\r\nIAIMS fees: 225\r\n\r\nTotal : 25600.00\r\n'),
(47, 47, 'How to apply:\r\nTo apply for admission, please visit our college website http://www.chowgules.ac.in/admission/\r\nand complete the online admission form as per instructions provided therein.\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self-attested) of each of the following documents\r\nalong with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript of\r\nrecords, copy of syllabus containing details of course of studies pursued in various courses in the\r\nexamination passed by the applicant (duly countersigned by High Commissioner of India in the\r\ncountry). If the student is found eligible, prima facie letter will be sent to the student for carrying\r\nout further necessary formalities. Following documents are required to be submitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy\r\n'),
(48, 48, ''),
(49, 49, 'BA in geography details'),
(50, 50, 'University fees : 750.00\r\nTuition fees : 1860.00\r\nExamination fees : 3650.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 8000\r\nLibrary fee : 470.00\r\nStudent service charges : 10000.00\r\nIAIMS fees: 225\r\n\r\nTotal : 23500.00\r\n'),
(51, 51, 'How to apply:\r\nTo apply for admission, please visit our college website\r\nhttp://www.chowgules.ac.in/admission/ and complete the online admission form as per\r\ninstructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self attested) of each of the following\r\ndocuments along with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript\r\nof records, copy of syllabus containing details of course of studies pursued in various courses\r\nin the examination passed by the applicant (duly countersigned by High Commissioner of\r\nIndia in the country). If the student is found eligible, prima facie letter will be sent to the\r\nstudent for carrying out further necessary formalities. Following documents are required to be\r\nSubmitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(52, 52, ''),
(53, 53, 'history'),
(54, 54, 'University fees : 620.00\r\nTuition fees : 1230.00\r\nExamination fees : 2250.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 6000\r\nLibrary fee : 470.00\r\nStudent service charges : 9000.00\r\nIAIMS fees: 225\r\n\r\nTotal : 27660.00\r\n');
INSERT INTO `level_5` (`level_5_id`, `level_4_id_fk`, `details`) VALUES
(55, 55, 'How to apply:\r\nTo apply for admission, please visit our college website\r\nhttp://www.chowgules.ac.in/admission/ and complete the online admission form as per\r\ninstructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self attested) of each of the following\r\ndocuments along with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript\r\nof records, copy of syllabus containing details of course of studies pursued in various courses\r\nin the examination passed by the applicant (duly countersigned by High Commissioner of\r\nIndia in the country). If the student is found eligible, prima facie letter will be sent to the\r\nstudent for carrying out further necessary formalities. Following documents are required to be\r\nSubmitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(56, 56, ''),
(57, 57, 'BA French or Bachelor of Arts in French language is a 3 year undergraduate course degree which is one of the premium language courses offered by many colleges and universities in India. This course consists of integrated French language and literature with emphasis being laid on spoken French, structure, grammar and writing skills as well as studying literature and poems of France to gain more knowledge and grasp complex language phonetics and linguistic approaches\r\n\r\nB.a curriculum includes core courses in:\r\nLanguage in Context: Developing Reading and Writing Skills\r\nLanguage in Context: Developing Listening and Speaking Skills\r\n\r\nThe elective courses include:\r\nFrench for Tourism and Hospitality \r\nStudy of Selected Elementary Texte in French\r\nIntroduction to Francophone\r\nInitiation to Translation\r\nOverview of 17th Century French Literature\r\nOverview of 18th Century French Literature\r\nOverview of 19th Century French Literature\r\nBusiness Communication in French\r\nStudy of Collection of French Short Stories\r\n'),
(58, 58, 'University fees : 630.00\r\nTuition fees : 1500.00\r\nExamination fees : 3650.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 8000\r\nLibrary fee : 470.00\r\nStudent service charges : 10000.00\r\nIAIMS fees: 225\r\n\r\nTotal : 25690.00\r\n'),
(59, 59, 'How to apply:\r\nTo apply for admission, please visit our college website\r\nhttp://www.chowgules.ac.in/admission/ and complete the online admission form as per\r\ninstructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self attested) of each of the following\r\ndocuments along with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript\r\nof records, copy of syllabus containing details of course of studies pursued in various courses\r\nin the examination passed by the applicant (duly countersigned by High Commissioner of\r\nIndia in the country). If the student is found eligible, prima facie letter will be sent to the\r\nstudent for carrying out further necessary formalities. Following documents are required to be\r\nSubmitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(60, 60, ''),
(61, 61, 'konkani details'),
(62, 62, 'University fees : 660.00\r\nTuition fees : 1600.00\r\nExamination fees : 3650.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 8000\r\nLibrary fee : 470.00\r\nStudent service charges : 10000.00\r\nIAIMS fees: 225\r\n\r\nTotal : 28500.00\r\n'),
(63, 63, 'How to apply:\r\nTo apply for admission, please visit our college website\r\nhttp://www.chowgules.ac.in/admission/ and complete the online admission form as per\r\ninstructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self attested) of each of the following\r\ndocuments along with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript\r\nof records, copy of syllabus containing details of course of studies pursued in various courses\r\nin the examination passed by the applicant (duly countersigned by High Commissioner of\r\nIndia in the country). If the student is found eligible, prima facie letter will be sent to the\r\nstudent for carrying out further necessary formalities. Following documents are required to be\r\nSubmitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(64, 64, ''),
(65, 65, 'marathi details'),
(66, 66, 'University fees : 630.00\r\nTuition fees : 1300.00\r\nExamination fees : 5650.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 8000\r\nLibrary fee : 470.00\r\nStudent service charges : 9000.00\r\nIAIMS fees: 225\r\n\r\n\r\nTotal : 25500.00\r\n'),
(67, 67, 'How to apply:\r\nTo apply for admission, please visit our college website\r\nhttp://www.chowgules.ac.in/admission/ and complete the online admission form as per\r\ninstructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self attested) of each of the following\r\ndocuments along with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript\r\nof records, copy of syllabus containing details of course of studies pursued in various courses\r\nin the examination passed by the applicant (duly countersigned by High Commissioner of\r\nIndia in the country). If the student is found eligible, prima facie letter will be sent to the\r\nstudent for carrying out further necessary formalities. Following documents are required to be\r\nSubmitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(68, 68, ''),
(69, 69, 'psychology details'),
(70, 70, 'University fees : 800.00\r\nTuition fees : 1600.00\r\nExamination fees : 3650.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 8000\r\nLibrary fee : 470.00\r\nLaboratory fees : 6000\r\nStudent service charges : 10000.00\r\nIAIMS fees: 225\r\n\r\nTotal : 30500.00\r\n'),
(71, 71, 'How to apply:\r\nTo apply for admission, please visit our college website\r\nhttp://www.chowgules.ac.in/admission/ and complete the online admission form as per\r\ninstructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self attested) of each of the following\r\ndocuments along with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript\r\nof records, copy of syllabus containing details of course of studies pursued in various courses\r\nin the examination passed by the applicant (duly countersigned by High Commissioner of\r\nIndia in the country). If the student is found eligible, prima facie letter will be sent to the\r\nstudent for carrying out further necessary formalities. Following documents are required to be\r\nSubmitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(72, 72, ''),
(73, 73, 'philosophy details'),
(74, 74, 'University fees : 620.00\r\nTuition fees : 1800.00\r\nExamination fees : 3650.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 8000\r\nLibrary fee : 470.00\r\nLaboratory fees : 6000\r\nStudent service charges : 10000.00\r\nIAIMS fees: 225\r\n\r\nTotal : 26600.00\r\n'),
(75, 75, 'How to apply:\r\nTo apply for admission, please visit our college website\r\nhttp://www.chowgules.ac.in/admission/ and complete the online admission form as per\r\ninstructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self attested) of each of the following\r\ndocuments along with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript\r\nof records, copy of syllabus containing details of course of studies pursued in various courses\r\nin the examination passed by the applicant (duly countersigned by High Commissioner of\r\nIndia in the country). If the student is found eligible, prima facie letter will be sent to the\r\nstudent for carrying out further necessary formalities. Following documents are required to be\r\nSubmitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(76, 76, ''),
(77, 77, 'sociology details'),
(78, 78, 'University fees : 620.00\r\nTuition fees : 1900.00\r\nExamination fees : 8650.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 7000\r\nLibrary fee : 470.00\r\nLaboratory fees : 6000\r\nStudent service charges : 9000.00\r\nIAIMS fees: 225\r\n\r\nTotal : 24600.00\r\n'),
(79, 79, 'How to apply:\r\nTo apply for admission, please visit our college website\r\nhttp://www.chowgules.ac.in/admission/ and complete the online admission form as per\r\ninstructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self attested) of each of the following\r\ndocuments along with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript\r\nof records, copy of syllabus containing details of course of studies pursued in various courses\r\nin the examination passed by the applicant (duly countersigned by High Commissioner of\r\nIndia in the country). If the student is found eligible, prima facie letter will be sent to the\r\nstudent for carrying out further necessary formalities. Following documents are required to be\r\nSubmitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(80, 80, ''),
(81, 81, 'Portuguese details'),
(82, 82, 'University fees : 640.00\r\nTuition fees : 1500.00\r\nExamination fees : 3650.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nAdditional credits: 8000\r\nLibrary fee : 470.00\r\nLaboratory fees : 6000\r\nStudent service charges : 10000.00\r\nIAIMS fees: 225\r\n\r\nTotal : 27000.00\r\n'),
(83, 83, 'How to apply:\r\nTo apply for admission, please visit our college website\r\nhttp://www.chowgules.ac.in/admission/ and complete the online admission form as per\r\ninstructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self attested) of each of the following\r\ndocuments along with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XII).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript\r\nof records, copy of syllabus containing details of course of studies pursued in various courses\r\nin the examination passed by the applicant (duly countersigned by High Commissioner of\r\nIndia in the country). If the student is found eligible, prima facie letter will be sent to the\r\nstudent for carrying out further necessary formalities. Following documents are required to be\r\nSubmitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(84, 84, ''),
(85, 85, 'software development'),
(86, 86, 'University fees : 630.00\r\nTuition fees : 32375.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLibrary fee : 1000.00\r\nOther fee : 420.00\r\nComp lab fee : 3000.00\r\nExamination fees : 4500.00\r\nStudent service charge : 10000.00\r\nGeneral deposit : 230.00\r\nIAIMS fees : 225.00\r\n\r\nTotal : 52700.00\r\n'),
(87, 87, 'How to apply:\r\nTo apply for admission, please visit our college website http://www.chowgules.ac.in/admission/\r\nand complete the online admission form as per instructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self-attested) of each of the following documents\r\nalong with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript of\r\nrecords, copy of syllabus containing details of course of studies pursued in various courses in the\r\nexamination passed by the applicant (duly countersigned by High Commissioner of India in the\r\ncountry). If the student is found eligible, prima facie letter will be sent to the student for carrying\r\nout further necessary formalities. Following documents are required to be submitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(88, 88, ''),
(89, 89, 'multimedia details'),
(90, 90, 'Tuition fees : 42680.00\r\nLab fee : 21500.00\r\nAdmnst fees : 1000.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLibrary fee : 2000.00\r\nOther fee : 420.00\r\nExamination fees : 7150.00\r\nStudent service charge : 10000.00\r\nGeneral deposit : 230.00\r\nIAIMS fees : 225.00\r\n\r\n\r\nTotal : 85525.00\r\n'),
(91, 91, 'How to apply:\r\nTo apply for admission, please visit our college website http://www.chowgules.ac.in/admission/\r\nand complete the online admission form as per instructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self-attested) of each of the following documents\r\nalong with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript of\r\nrecords, copy of syllabus containing details of course of studies pursued in various courses in the\r\nexamination passed by the applicant (duly countersigned by High Commissioner of India in the\r\ncountry). If the student is found eligible, prima facie letter will be sent to the student for carrying\r\nout further necessary formalities. Following documents are required to be submitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(92, 92, ''),
(93, 93, 'VFX details'),
(94, 94, 'Tuition fees : 42680.00\r\nLab fee : 21500.00\r\nAdmnst fees : 1000.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLibrary fee : 2000.00\r\nOther fee : 420.00\r\nExamination fees : 7150.00\r\nStudent service charge : 10000.00\r\nGeneral deposit : 230.00\r\nIAIMS fees : 225.00\r\n\r\n\r\nTotal : 85525.00\r\n'),
(95, 95, 'How to apply:\r\nTo apply for admission, please visit our college website http://www.chowgules.ac.in/admission/\r\nand complete the online admission form as per instructions provided therein.\r\nThe online admission will be open 30th April 2020\r\nContact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in\r\nDocuments required:\r\nStudents are required to bring two photocopies (self-attested) of each of the following documents\r\nalong with the originals at the time of admission.\r\n\r\na. For Goa Board students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two photocopies of Leaving Certificate.\r\n3. Two Photographs .\r\n\r\nb. For other Board/Universities students:\r\n1. Two photocopies of qualifying examination mark sheets (XIIth).\r\n2. Original as well as two photocopies of Transfer/Leaving certificate.\r\n3. Original as well as two photocopies of Migration certificate.\r\n4. Provisional Eligibility Certificate from Chowgule college.\r\n5. Two Photographs .\r\n\r\nc. For International students:\r\nInternational students applying directly for admission need to submit an application to the\r\nPrincipal stating their desire to seek admission along with their Passing Certificate, Transcript of\r\nrecords, copy of syllabus containing details of course of studies pursued in various courses in the\r\nexamination passed by the applicant (duly countersigned by High Commissioner of India in the\r\ncountry). If the student is found eligible, prima facie letter will be sent to the student for carrying\r\nout further necessary formalities. Following documents are required to be submitted:\r\n1. Four photocopies of qualifying examination mark sheets (XIIth).\r\n2. Two Photographs.\r\n3. Two photocopies of Student Visa.\r\n4. Two photocopies of Passport.\r\n5. Original AIDS Test Report.\r\n6. Certificate of proficiency in English.\r\n7. Equivalence Certificate.\r\n8. Resident Permit and ‘C’ Form.\r\n\r\nOnce the student’s admission is confirmed, he/she is required to attend the Counselling\r\nsession organized by the faculty of the department, the date of which will be intimated to\r\nstudents by the college authorities.\r\na) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts\r\n\r\nb) The conditions of the minimum and maximum age limit of persons for admissions as a student in a\r\nparticular course or programme of study is 18 years and above\r\n\r\nc)The process of selection of eligible candidates applying for such admission: Based on Merit and\r\nPersonal Counseling and Reservation Policy\r\n'),
(96, 96, ''),
(97, 97, 'MSc in computer science'),
(98, 98, 'University fees : 630.00\r\nTuition fees : 87580.00\r\nStudent aid fund : 120.00\r\nGymkhana fund : 420.00\r\nLaboratory fee : 5000.00\r\nLibrary fee : 2000.00\r\nOther fee : 420.00\r\nStudent activity fee : 420.00\r\nStudent service charge : 10000.00\r\n\r\nTotal : 106170.00\r\n'),
(99, 99, ''),
(100, 100, ''),
(101, 101, 'B.Sc. (Hons.) in Zoology is a 3 year under-graduate degree program, the minimum eligibility is the 12th class in science from a recognized school board or its equivalent exam. Interested candidates can get admission to B.Sc. (Hons.) in Zoology on the premise of a candidate\'s performance in a relevant entrance exam, and subsequent round of counseling.\r\n\r\nB.Sc curriculum includes core courses in:\r\nAnimal Diversity : Non Chordates\r\nCell and Molecular Biology / Cell Biology & Biomolecules\r\nDiversity and Biological\r\nSystems of Chordates\r\nFundamentals of Animal and Human Genetics\r\nHuman Physiology\r\nBiochemistry and Metabolic Regulation\r\nDevelopmental Biology\r\nWildlife Biology\r\n\r\nThe elective courses include:\r\nVertebrate Endocrinology\r\nBasic Microbiology and Fundamentals of Animal Biotechnology\r\nEnvironmental Toxicology\r\nWaste Management Techniques\r\nAnimal Cell Culture and Applications\r\nAquaculture and Fisheries\r\nImmunology\r\nParasitology\r\nMolecular Genetics and Forensic Science\r\nEconomic Zoology\r\nBasic and Applied Entomology\r\nFish Preservation and Processing\r\nHealth and Nutrition\r\nEcology and Ethology\r\nLaboratory Techniques in Pathology\r\nBio Entrepreneurship\r\n'),
(102, 102, 'University fees : 600.00\r\nTuition fees : 1050.00\r\nExamination fees : 3550.00\r\nGeneral deposit : 230.00\r\nStudent aid fund : 130.00\r\nGymkhana fund : 420.00\r\nLaboratory pract fee : 2470.00\r\nLibrary fee : 470.00\r\nOther fee : 420.00\r\nI.T fee : 820.00\r\nStudent service charge : 10000.00\r\nIAIMS fees : 225.00\r\n\r\nTotal : 42500.00\r\n'),
(103, 103, 'How to apply: To apply for admission, please visit our college website http://www.chowgules.ac.in/admission/ and complete the online admission form as per instructions provided therein. Contact Person: Mr. Harish Nadkarni, Vice Principal email: hsn001@chowgules.ac.in Documents required: Students are required to bring two photocopies (self-attested) of each of the following documents along with the originals at the time of admission.  a. For Goa Board students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Two photocopies of Leaving Certificate. 3. Two Photographs .  b. For other Board/Universities students: 1. Two photocopies of qualifying examination mark sheets (XIIth). 2. Original as well as two photocopies of Transfer/Leaving certificate. 3. Original as well as two photocopies of Migration certificate. 4. Provisional Eligibility Certificate from Chowgule college. 5. Two Photographs .  c. For International students: International students applying directly for admission need to submit an application to the Principal stating their desire to seek admission along with their Passing Certificate, Transcript of records, copy of syllabus containing details of course of studies pursued in various courses in the examination passed by the applicant (duly countersigned by High Commissioner of India in the country). If the student is found eligible, prima facie letter will be sent to the student for carrying out further necessary formalities. Following documents are required to be submitted: 1. Four photocopies of qualifying examination mark sheets (XIIth). 2. Two Photographs. 3. Two photocopies of Student Visa. 4. Two photocopies of Passport. 5. Original AIDS Test Report. 6. Certificate of proficiency in English. 7. Equivalence Certificate. 8. Resident Permit and ‘C’ Form.  Once the student’s admission is confirmed, he/she is required to attend the Counselling session organized by the faculty of the department, the date of which will be intimated to students by the college authorities. a) The number of seats approved by the appropriate statutory authority in respect of each course or programme of study for the academic year for which admission is proposed to be made is 180 for Arts  b) The conditions of the minimum and maximum age limit of persons for admissions as a student in a particular course or programme of study is 18 years and above  c)The process of selection of eligible candidates applying for such admission: Based on Merit and Personal Counseling and Reservation Policy'),
(104, 104, ''),
(105, 105, 'MSc in chemistry'),
(106, 106, 'University fees : 630.00\r\nTuition fees : 580.00\r\nStudent aid fund : 120.00\r\nGymkhana fund : 420.00\r\nLaboratory fee : 4000.00\r\nLibrary fee : 2000.00\r\nOther fee : 420.00\r\nStudent activity fee : 420.00\r\nStudent service charge : 12000.00\r\n\r\n\r\nTotal : 105176\r\n'),
(107, 107, ''),
(108, 108, ''),
(109, 109, 'MSc in geography'),
(110, 110, 'University fees : 630.00\r\nTuition fees : 5580.00\r\nStudent aid fund : 120.00\r\nGymkhana fund : 420.00\r\nLaboratory fee : 6000.00\r\nLibrary fee : 2000.00\r\nOther fee : 420.00\r\nStudent activity fee : 420.00\r\nStudent service charge : 11000.00\r\n\r\n\r\nTotal : 108170.00\r\n'),
(111, 111, ''),
(112, 112, ''),
(113, 113, 'MA in economics '),
(114, 114, 'Tuition fees : 47865.00\r\nStudent activity fee : 420.00\r\nGymkhana fund : 420.00\r\nLaboratory fee : 4000.00\r\nLibrary fee : 2000.00\r\nOther fee : 420.00\r\nStudent activity fee : 420.00\r\nStudent service charge : 10000.00\r\n\r\n\r\nTotal : 60955.00\r\n'),
(115, 115, ''),
(116, 116, ''),
(117, 117, 'MA in english'),
(118, 118, 'Tuition fees : 50000.00\r\nStudent activity fee : 420.00\r\nGymkhana fund : 420.00\r\nLaboratory fee : 4000.00\r\nLibrary fee : 2000.00\r\nOther fee : 420.00\r\nStudent activity fee : 420.00\r\nStudent service charge : 10000.00\r\n\r\n\r\nTotal : 63090.00\r\n'),
(119, 119, ''),
(120, 120, ''),
(121, 121, 'MA in physchology'),
(122, 122, 'Tuition fees : 32500.00\r\nStudent activity fee : 420.00\r\nGymkhana fund : 420.00\r\nLaboratory fee : 4000.00\r\nLibrary fee : 2000.00\r\nOther fee : 420.00\r\nStudent activity fee : 420.00\r\nStudent service charge : 10000.00\r\n\r\n\r\nTotal : 45590.00\r\n'),
(123, 123, ''),
(124, 124, ''),
(125, 125, 'MA in geography'),
(126, 126, 'University fee : 630.00\r\nTuition fees : 35200.00\r\nStudent activity fee : 420.00\r\nGymkhana fund : 420.00\r\nLaboratory fee : 4000.00\r\nLibrary fee : 2000.00\r\nOther fee : 420.00\r\nStudent activity fee : 420.00\r\nStudent service charge : 10000.00\r\n\r\n\r\nTotal : 49300.00\r\n'),
(127, 127, ''),
(128, 128, ''),
(129, 129, 'subject details'),
(130, 130, ''),
(131, 131, ''),
(132, 132, ''),
(133, 133, 'subject details'),
(134, 134, ''),
(135, 135, ''),
(136, 136, ''),
(137, 137, 'subject details'),
(138, 138, ''),
(139, 139, ''),
(140, 140, ''),
(141, 141, 'subject details'),
(142, 142, ''),
(143, 143, ''),
(144, 144, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_queries`
--

CREATE TABLE `user_queries` (
  `query` varchar(255) DEFAULT NULL,
  `bot_responses` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_queries`
--

INSERT INTO `user_queries` (`query`, `bot_responses`) VALUES
('query', 'bot_responses\r'),
('', 'NULL\r'),
('/\n\n/stop', 'NULL\r'),
('7t7t7t', 'NULL\r'),
('Are most classes in BA reading/writing intensive?', 'NULL\r'),
('Are most classes in this department reading/writing intensive?', 'NULL\r'),
('Are the assignments difficult in psychology course?', 'NULL\r'),
('Are there any industry interactions related to multimedia in BVoc?', 'NULL\r'),
('Are there any industry interactions related to Software Development in Bachelor of Vocational', 'NULL\r'),
('Are there any industry interactions related to Software Development in BVoc?', 'Yes. There are workshops & hands-on interraction sessions in which industry experts come to give talks on various trending technologies.\r'),
('Are there any industry interactions related to VFX in BVoc?', 'NULL\r'),
('are there any psychology projects to do in these 3 years?', 'Yes. In the third year, students are expected to do a project for 4 credits\r'),
('Are there different subjects in one course?', 'NULL\r'),
('Are there Seminary courses conducted in college?', 'NULL\r'),
('Are they any facilities for Internship in college itself after completing BA?', 'NULL\r'),
('Are we provided internship after completing the BA in psychology?', 'NULL\r'),
('are yo a bot', 'NULL\r'),
('are you a bot', 'NULL\r'),
('are you boooooooot', 'NULL\r'),
('Boi', 'NULL\r'),
('Can I be a full stack developer after a bvoc software development course?', 'NULL\r'),
('Can I do bsc in a particular subject?', 'NULL\r'),
('Can I do double master\'s in psychology?', 'parvatibai chowgule college doesn\'t support double major in Psychology\r'),
('Can I do Ma in psychology?', 'Yes. Parvatibai Chowgule College offers a Post graduate program in Child Psychology and Child Development.\r'),
('can I do single major in bachelor\'s of science?', 'NULL\r'),
('can I do single major in bsc ?', 'NULL\r'),
('Can I get a diploma in BVoc multimedia?', 'NULL\r'),
('Can I get a diploma in bvoc software development?', 'Yes. If you pass in all the subjects in 1st year,you can get diploma and again if you clear in all the subjects for the second year then you get advanced diploma, and if you complete for all three years with no backlogs then you can get the degree.\r'),
('Can I get a diploma in bvoc VFX?', 'NULL\r'),
('Can I get a list of all the degrees in the college', 'NULL\r'),
('Can I take admission in two different courses or some course in different college after declaration of a cut off?', 'NULL\r'),
('Can I take admission in two different courses?', 'NULL\r'),
('Can we do a double major in bvoc in multimedia course?', 'NULL\r'),
('can we do a double major in bvoc vfx course?', 'NULL\r'),
('Can we do a single  major in bvoc in multimedia course?', 'NULL\r'),
('can we do a single major in bvoc vfx course?', 'NULL\r'),
('Can we do double major in bsc?', 'NULL\r'),
('can we do single major in bsc in  biochemistry?', 'NULL\r'),
('can we do single major in bsc in  biotechnology?', 'NULL\r'),
('can we do single major in bsc in  chemistry?', 'NULL\r'),
('can we do single major in bsc in  geography?', 'NULL\r'),
('can we do single major in bsc in  geology?', 'NULL\r'),
('can we do single major in bsc in  mathematics?', 'NULL\r'),
('can we do single major in bsc in botany?', 'NULL\r'),
('can we do single major in bsc in computer science?', 'Yes. Autonomy programme structure of our college allows it.\r'),
('can we do single major in bsc in maths?', 'NULL\r'),
('can we do single major in bsc in physics?', 'NULL\r'),
('can we do single major in bsc in zoology?', 'NULL\r'),
('Can we do single major in bsc?', 'NULL\r'),
('Can we get an internship while studying BVoc in a multimedia course?', 'NULL\r'),
('Can we get an internship while studying bvoc VFX course?', 'NULL\r'),
('Can we get internship while studying bvoc course?', 'Yes. We can get internships.The internship cell of the college helps you to get the right internship\r'),
('Can we see the prospectus?', 'NULL\r'),
('Can we take double major in chemistry!', 'NULL\r'),
('Can you give me a list of Bachelor of Art\'s degrees?', 'NULL\r'),
('can you give me a list of Bachelor of Science degrees', 'NULL\r'),
('Can you give me the list of bachelor degree', 'NULL\r'),
('Can you give me the list of bvoc degree?', 'NULL\r'),
('Can you give me the list of pgdc in computer science?', 'NULL\r'),
('Can you give me the list of pgdc?', 'NULL\r'),
('Can you give me the list of post graduate courses', 'NULL\r'),
('Can you give me the list of under graduate degre', 'NULL\r'),
('can you help me', 'NULL\r'),
('can you help?', 'NULL\r'),
('can you show me a list of Science degrees?', 'NULL\r'),
('Can you show me all the courses available in bsc?', 'NULL\r'),
('Can you show me all the subjects available in bsc?', 'NULL\r'),
('Can you show me the list of bachelor\'s in science degree?', 'NULL\r'),
('Can you tell me more details on the subjects offered?', 'NULL\r'),
('can you tell me something about bvoc', 'NULL\r'),
('Can you tell me which editing softwares used in bvoc in multimedia courses?', 'NULL\r'),
('Could you tell me about bvoc', 'NULL\r'),
('could you tell me something about Bvoc?', 'NULL\r'),
('D', 'NULL\r'),
('date for bsc admissions?', 'NULL\r'),
('Do the college provide child psychology?', 'NULL\r'),
('Do the college provide DSC english and communicative english?', 'NULL\r'),
('Do the college provide DSC psychology?', 'NULL\r'),
('Do we get mentors in bvoc courses?', 'NULL\r'),
('Does', 'NULL\r'),
('Does psychology course conduct any trips?', 'As and when it is feasible, a study tour is organised.\r'),
('Does the college have an Aviation course?', 'NULL\r'),
('Does the literature course helps us in writing a book and will the college help us in publishing it?', 'NULL\r'),
('Does this college also have a post graduate level education for BVoc?', 'No. In the state of Goa there is no provision for M.Voc. People who do Bvoc can apply for MSc. I.T offered by the college.\r'),
('Does this college also have a post graduate level education for multimedia BVoc?', 'NULL\r'),
('Does this college also have a post graduate level education for vfx BVoc?', 'NULL\r'),
('Does this college also have a post graduate level education?', 'NULL\r'),
('Each semester consists of how many subjects?', 'NULL\r'),
('Ft', 'NULL\r'),
('gfdgdfhgerht384ytioaweg t9qpw4yf kgfbueihflshdfuodshglkrjbgahSfgerjnggksuietjgne;ioaogfefyuakasiusdjlkgosiusedibdbkxdnxjauahj', 'NULL\r'),
('give me a list of Bachelor of Science degrees', 'NULL\r'),
('Give me details of the syllabus structure in bvoc course.', 'NULL\r'),
('Give me the eligibility for computer science?', '12th Science with Mathematics\r'),
('help me /', 'NULL\r'),
('Hi, Can you tell me which editing softwares used in bvoc Vfx course?', 'NULL\r'),
('Hoi there', 'NULL\r'),
('How are BA in geography and BSc in geography different from each other', 'NULL\r'),
('How are BA in mathematics and BSc in mathematics different from each other', 'NULL\r'),
('How are Semester End exams conducted for bvoc in multimedia course?', 'NULL\r'),
('How are Semester End exams conducted for bvoc software development course?', '1.It is decided by the faculty how they want to conduct the exams. 2.College has some continuous way of assessment in which students are assessed throughout the semester. 3.College conducts few exams in continuous assessment and then the semester ends.\r'),
('How are Semester End exams conducted for bvoc VFX course?', 'NULL\r'),
('How are the practicals conducted?', 'NULL\r'),
('how are you', 'NULL\r'),
('How are you?', 'NULL\r'),
('How can I register myself for undergraduate courses?', 'NULL\r'),
('How can sociology course benefit us in future?', 'NULL\r'),
('how can yo help?', 'NULL\r'),
('How helpful BA in psychology  is?', 'NULL\r'),
('How long are the BVoc in multimedia courses?', 'NULL\r'),
('How long are the BVoc VFX courses?', 'NULL\r'),
('How long is the bachelor\'s course?', 'NULL\r'),
('how long is the BVoc courses', 'The degree is for 3 Years. There are 3 different exit points, If you leave the course in the first year you get the dimploma and if you leave in the second year you get advanced diploma and for the third year its the degree.\r'),
('How long is the BVoc in a multimedia course?', 'NULL\r'),
('How long is the BVoc in Software development course?', 'The degree is for 3 Years. There are 3 different exit points, If you leave the course in the first year you get the dimploma and if you leave in the second year you get advanced diploma and for the third year its the degree.\r'),
('How long is the BVoc in VFX course?', 'NULL\r'),
('How long is the English course?', 'NULL\r'),
('How long is the history course?', 'NULL\r'),
('How long will be the B.A course?', 'NULL\r'),
('How many colleges in Goa offer bvoc software development courses?', 'NULL\r'),
('How many credits are required to pass the course?', 'NULL\r'),
('How many diploma courses are available?', 'NULL\r'),
('How many internal tests are conducted for a semester in bvoc in multimedia?', 'NULL\r'),
('How many internal tests are conducted for a semester in bvoc software development?', 'That depends on the course and also the credit of the course generally for the 3-4 credit course we have 4 contineous assesment and 3 credit course we generally have 2 contineous assesment\r'),
('How many internal tests are conducted for a semester in bvoc vfx course?', 'NULL\r'),
('How many internal tests are conducted for a semester in bvoc vfx?', 'NULL\r'),
('How many seats are available for Bsc geography course? Is there any limit?', 'NULL\r'),
('How many subject are there for bsc', 'NULL\r'),
('How many subjects are there for ba', 'NULL\r'),
('How many subjects are there in each semester of bvoc multimedia?', 'NULL\r'),
('How many subjects are there in each semester of bvoc software development?', 'NULL\r'),
('How many subjects are there in each semester of bvoc VFX?', 'NULL\r'),
('How many subjects can we choose in B.A?', 'NULL\r'),
('How many years does it take to complete the bvoc in multimedia course?', 'NULL\r'),
('How many years does it take to complete the bvoc vfx course?', 'NULL\r'),
('How many years has a bvoc in multimedia courses consist of?', 'NULL\r'),
('How many years has a bvoc vfx course consist of?', 'NULL\r'),
('How many years is a bvoc course consist of?', 'The degree is for 3 Years. There are 3 different exit points, If you leave the course in the first year you get the dimploma and if you leave in the second year you get advanced diploma and for the third year its the degree.\r'),
('How many years is for phd course?', 'NULL\r'),
('How many years is of post graduate course', 'NULL\r'),
('how many years it takes to complete bachelor\'s of science', 'In chowgule college it takes minimum 3 years to complete Bsc\r'),
('how many years it takes to complete bsc?', 'In chowgule college it takes minimum 3 years to complete Bsc\r'),
('How many years it takes to complete bvoc software development course?', 'The degree is for 3 Years. There are 3 different exit points, If you leave the course in the first year you get the dimploma and if you leave in the second year you get advanced diploma and for the third year its the degree.\r'),
('How much is the fee structure for a whole year for Bachelors in Vocational?', 'NULL\r'),
('How to get admission form?', 'NULL\r'),
('How will be the psychology experiments conducted?', 'Psychology practicals are conducted on campus in the laboratory. However due the the pandemic, the same are being done in an online mode.\r'),
('Hw r u', 'NULL\r'),
('I am a student from Rosary HSS and I have done 12th computer science. I got 48% so am I eligible for bvoc in multimedia course?', 'NULL\r'),
('I am a student from Rosary HSS and I have done 12th computer science. I got 48% so am I eligible for bvoc Vfx course?', 'NULL\r'),
('I am From Abu Dhabi and I want to do a Bvoc in a multimedia course? Is that possible for me to do?', 'NULL\r'),
('I am From Abu Dhabi and I want to do a Bvoc VFX course? Is that possible for me to do?', 'NULL\r'),
('I am interested in the multimedia course, which type of cameras and PC is used in the course?', 'NULL\r'),
('I am interested in the Vfx course, which type of cameras and PC is used in the course?', 'NULL\r'),
('I did not have taken mathematics in class 12th so Can i opt for B.A.(H) Economic?', 'NULL\r'),
('I did not have taken mathematics in class 12th so Can i opt for or B.A.(H) Business Economics?', 'NULL\r'),
('I have done 12th Arts, am I eligible for bvoc in multimedia course?', 'NULL\r'),
('I have done 12th Arts, am I eligible for bvoc vfx course?', 'NULL\r'),
('I have done 12th Commerce, am I eligible for bvoc in multimedia course?', 'NULL\r'),
('I have done 12th Commerce, am I eligible for bvoc vfx course?', 'NULL\r'),
('I have done 12th Science, am I eligible for bvoc in multimedia course?', 'NULL\r'),
('I have done 12th Science, am I eligible for bvoc vfx course?', 'NULL\r'),
('I have done 12th Vocational, am I eligible for bvoc in multimedia course?', 'NULL\r'),
('I have done 12th Vocational, am I eligible for bvoc vfx course?', 'NULL\r'),
('I want to apply for a vocational course. How should I do it?', 'NULL\r'),
('i want to hi my fall back', 'NULL\r'),
('I want to know what are the technologies used in multimedia courses?', 'NULL\r'),
('I want to know what are the technologies used in vfx courses?', 'NULL\r'),
('I want to know what is the eligibility criteria for multimedia?', 'NULL\r'),
('I want to know what is the eligibility criteria for VFX?', 'NULL\r'),
('I want to know which is better in BVoc multimedia/CS?', 'NULL\r'),
('I want to know which is better VFX/CS?', 'NULL\r'),
('In which year the internship is done for bvoc in multimedia courses?', 'NULL\r'),
('In which year the internship is done for bvoc software development courses?', 'Internships usually starts from the second year as the first year is full of gaining the basic skillset.You can do your full internships by third year.\r'),
('In which year the internship is done for bvoc vfx courses?', 'NULL\r'),
('Is B.A good for IAS?', 'NULL\r'),
('Is bvoc software development equivalent to bsc computer science?', 'NULL\r'),
('Is classroom facility available for bvoc in multimedia?', 'NULL\r'),
('Is classroom facility available for bvoc software development?', 'Yes. The real as well as virtual classrooms are available for this course.\r'),
('Is classroom facility available for bvoc vfx?', 'NULL\r'),
('Is Double major subjects included in the bvoc in multimedia course?', 'NULL\r'),
('Is Double major subjects included in the bvoc software development course?', 'No! Its pure skill orinteted course where you have to study the paper which are offered.\r'),
('Is Double major subjects included in the bvoc vfx course?', 'NULL\r'),
('is it possible to complete one year in this college and other years in another college?', 'NULL\r'),
('Is it possible to obtain a bachelor\'s degree and a master\'s degree at the same time?', 'NULL\r'),
('Is it worth applying for bvoc course?', 'Bvoc is an initiative by UGC which is started to enhance student on a particular skillset rather than generalising on everything. \r'),
('Is it worth applying for bvoc in a multimedia course?', 'NULL\r'),
('Is it worth applying for bvoc vfx course?', 'NULL\r'),
('Is MA in psychology available then how long will the degree course be?', 'Yes, we offer MA in Child Psychology and Child Development. It\'s a post graduate program of 2 years.\r'),
('Is Single major subjects included in the bvoc in multimedia course?', 'NULL\r'),
('Is Single major subjects included in the bvoc software development course?', 'No! We dont have a concept of single magor or double.\r'),
('Is Single major subjects included in the bvoc vfx course?', 'NULL\r'),
('Is the course allows semester or quarter systems?', 'NULL\r'),
('Is there a Marine microbiology  course in your college?', 'NULL\r'),
('is there scope for higher studies for BA in psychology?', 'After BA in Psychology, you can enrol for Masters in Psychology with the specialization of your choice. Clinical, Industrial, Social, Child, Counselling, Criminal Psychology are some of the specializations in Psychology.\r'),
('is there scope for higher studies?', 'NULL\r'),
('List all the courses available in bachelor\'s of science ?', 'NULL\r'),
('List all the courses available in bsc?', 'NULL\r'),
('list of BA degrees', 'NULL\r'),
('list of BSc degrees', 'NULL\r'),
('List of computer science courses', '8 core courses,12 Elective courses,1 project work\r'),
('List of pg diploma courses?', 'NULL\r'),
('qwertyuiop', 'NULL\r'),
('show me all the subjects available for bachelors in science degree', 'NULL\r'),
('Show me the eligibility criteria for bvoc?', 'NULL\r'),
('Show me the syllabus for bvoc course?', 'NULL\r'),
('Show me two companies which are recruiting bvoc students?', 'NULL\r'),
('some new  message to hit up my fallback action', 'NULL\r'),
('some new kind of text', 'NULL\r'),
('Suppose if I do Ma in psychology than can I opt for a career to be a psychologist?', 'If you pursue Clinical Psychology, you have to do MPhil to be able to call yourself a psychologist and practice in the field. \r'),
('tell abot Bachelor of Arts in english', 'NULL\r'),
('tell me about bsc in biochemistry', 'NULL\r'),
('tell me about bsc in botany?', 'NULL\r'),
('tell me about bsc in chemistry', 'NULL\r'),
('tell me about bsc in geography?', 'NULL\r'),
('tell me about bsc in geology?', 'NULL\r'),
('tell me about bsc in mathematics?', 'NULL\r'),
('tell me about bsc in maths?', 'NULL\r'),
('tell me about bsc in physics?', 'NULL\r'),
('tell me about bsc in zoology?', 'NULL\r'),
('Tell me about BVoc in a multimedia course?', 'NULL\r'),
('Tell me about BVoc in software development course?', 'Bvoc is a degree course which has multiple exit points there is purely skill orented and mostly handson and less of theory and more of practical and all the courses are related to building a skillset to become a good software developer.\r'),
('Tell me about BVoc in vfx course?', 'NULL\r'),
('Tell me about bvoc?', 'NULL\r'),
('Tell me about the courses offered by the college', 'NULL\r'),
('tell me about the UG programs?', 'NULL\r'),
('tell me bvoc', 'NULL\r'),
('Tell me eligibility for bvoc course?', 'NULL\r'),
('tell me something about courese realated to CS', 'NULL\r'),
('wat is bvoc', 'NULL\r'),
('What are the activities conducted in B.A psychology?', 'Psychospectrum(Psychology Exhibition)wherein students of the department exhibit charts,models and equipment,social experiments,Discussion Forum (extension activity)wherein experts interact with the audience.\r'),
('What are the activities conducted in BA geography?', 'NULL\r'),
('What are the activities conducted in BA psychology?', 'NULL\r'),
('What are the career options open for Philosophical course?', 'NULL\r'),
('What are the courses offered by the college', 'NULL\r'),
('What are the different streams offered at this college?', 'NULL\r'),
('What are the dvantages of BA in psychology?', 'NULL\r'),
('What are the eligibility for admission for ba in English', 'NULL\r'),
('What are the facilities offered in bvoc course?', 'NULL\r'),
('What are the field work in BA psychology?', 'Students are expected to complete 120 hours of internship in an organisation that works in the field of their choice.\r'),
('What are the field work in BA?', 'NULL\r'),
('What are the grades needed for bvoc?', 'NULL\r'),
('what are the internship opportunities in BA?', 'NULL\r'),
('What are the job opportunities offered by bvoc software development course?', 'NULL\r'),
('What are the number of seats offered in bvoc?', 'NULL\r'),
('What are the other possibilities that the History course will help us?', 'NULL\r'),
('What are the outcomes of bvoc software development course?', 'NULL\r'),
('What are the pros and cons of taking bvoc software development programme?', 'NULL\r'),
('What are the streams offered at this college?', 'NULL\r'),
('What are the subjects offered under bvoc multimedia courses?', 'NULL\r'),
('What are the subjects offered under bvoc software development courses?', 'NULL\r'),
('What are the subjects offered under bvoc VFXcourses?', 'NULL\r'),
('what are the vision and mission of the BA/BSc/BVoc course?', 'NULL\r'),
('What are the work-study opportunities in computer science degree?', 'NULL\r'),
('What assessment methods are used by bvoc in multimedia course?', 'NULL\r'),
('What assessment methods are used by bvoc vfx course?', 'NULL\r'),
('What assessment methods are used by bvoc vfx course.?', 'NULL\r'),
('What assessments methods are used by bvoc software development course.?', 'We use everything from presentation to written exams to projects and assignments.\r'),
('what can you do', 'NULL\r'),
('what can you do?', 'NULL\r'),
('what courses u r providing ?wanna know about ba course in details.', 'NULL\r'),
('What do I get after completion of the course?', 'NULL\r'),
('What does the bsc computer science covers?', 'NULL\r'),
('What does the bvoc course cover?', 'NULL\r'),
('what does this college have for BA courses that the rest don\'t?', 'NULL\r'),
('what is bovc', 'NULL\r'),
('what is bvoc', 'Bachelor of Vocational Education is a specialized undergraduate bachelor\'s degree which qualifies the graduate as a vocational teacher in public schools or trainer for private companies.\r'),
('What is bvoc software development course?', 'NULL\r'),
('what is bvoc!', 'NULL\r'),
('what is bvoc?', 'Bachelor of Vocational Education is a specialized undergraduate bachelor\'s degree which qualifies the graduate as a vocational teacher in public schools or trainer for private companies.\r'),
('What is the admission process of bvoc software development course?', 'To be eligible for B.Voc you need to have passing certificate of any higher-secondary and you should have percentage more than 55%.\r'),
('What is the admission process of the bvoc in multimedia course?', 'NULL\r'),
('What is the admission process of the bvoc vfx course?', 'NULL\r'),
('What is the attendance scheme in bvoc software development course?', 'The attendance scheme for the whole college is same i.e. You need tgo have minimum 75% of attendance to answer the exams.\r'),
('What is the campus placement rate in bvoc in multimedia course?', 'NULL\r'),
('What is the campus placement rate in bvoc software development?', 'The first batch was passed out in 2019. Thirteen students were appeared in exam out of which ten are passed out and currently four are working at different places. \r'),
('What is the campus placement rate in bvoc vfx course?', 'NULL\r'),
('What is the credit system in bvoc in multimedia course?', 'NULL\r'),
('What is the credit system in Bvoc?', 'NULL\r'),
('What is the cut off point for bvoc course?', 'NULL\r'),
('What is the cutoff for computer science degree?', 'Merit list is prepared based on 12th marks and students are admitted as per the merit list\r'),
('What is the degree to be awarded after completion of the course', 'NULL\r'),
('What is the difference between BA in mathematics and BSc in mathematics', 'NULL\r'),
('What is the duration of bvoc in multimedia course?', 'NULL\r'),
('What is the duration of bvoc software development course?', 'The degree is for 3 Years. There are 3 different exit points, If you leave the course in the first year you get the dimploma and if you leave in the second year you get advanced diploma and for the third year its the degree.\r'),
('What is the duration of each course', 'NULL\r'),
('what is the eligibility criteria for bsc in biochemistry?', 'NULL\r'),
('what is the eligibility criteria for bsc in biotechnology', 'NULL\r'),
('what is the eligibility criteria for bsc in botany', 'NULL\r'),
('what is the eligibility criteria for bsc in chemistry?', 'NULL\r'),
('what is the eligibility criteria for bsc in computer science?', '12th Science with Mathematics\r'),
('what is the eligibility criteria for bsc in geography?', 'NULL\r'),
('what is the eligibility criteria for bsc in geology?', 'NULL\r'),
('what is the eligibility criteria for bsc in mathematics', 'NULL\r'),
('what is the eligibility criteria for bsc in maths?', 'NULL\r'),
('what is the eligibility criteria for bsc in physics?', 'NULL\r'),
('what is the eligibility criteria for bsc in zoology', 'NULL\r'),
('What is the eligibility criteria to get into BA?', 'NULL\r'),
('What is the group size of students in the lab for bvoc software development course?', 'NULL\r'),
('What is the outcome of Bsc computer science', 'Students pursue Masters in Computer Science or become entrepreneurs\r'),
('What is the procedure to get into BA?', 'NULL\r'),
('what is the scope of taking BA?', 'NULL\r'),
('What is the size of each batch for practicals ?', 'NULL\r'),
('What is the syllabus for the bvoc course?', 'NULL\r'),
('What is the weight of each credit', 'NULL\r'),
('what jobs can i apply for after BVOC in softwear devolopment', 'NULL\r'),
('What kind of extra curricular activiies are provided here?', 'NULL\r'),
('What kind of practicals are conducted?', 'NULL\r'),
('What makes the BA in psychology interesting?', '\"Besides the core courses we offer 4 verticals as electives - lifespan development, applied psychology, individual and society, and biological foundations of Psychology. \r'),
('What more does psychology course offer?', 'Besides the core courses we offer 4 verticals as electives - lifespan development, applied psychology, individual and society, and biological foundations of Psychology. \r'),
('what other academic certificates or courses should I do to boost my BA degree value?', 'NULL\r'),
('What percentage of students get interenship in computer science?', 'NULL\r'),
('what qualifications are required for bsc in biochemistry?', 'NULL\r'),
('what qualifications are required for bsc in biotechnology?', 'NULL\r'),
('what qualifications are required for bsc in botany?', 'NULL\r'),
('what qualifications are required for bsc in chemistry?', 'NULL\r'),
('what qualifications are required for bsc in computer science?', '12th Science with Mathematics\r'),
('what qualifications are required for bsc in geography', 'NULL\r'),
('what qualifications are required for bsc in geology?', 'NULL\r'),
('what qualifications are required for bsc in mathematics?', 'NULL\r'),
('what qualifications are required for bsc in maths?', 'NULL\r'),
('what qualifications are required for bsc in zoology?', 'NULL\r'),
('What qualifications are required for bvoc in multimedia course?', 'NULL\r'),
('What qualifications are required for bvoc software development course.', 'To be eligible for B.Voc you need to have passing certificate of any higher-secondary and you should have percentage more than 55%.\r'),
('What qualifications are required for bvoc vfx course?', 'NULL\r'),
('What research opportunities are available for undergraduates in BA in psychology?', 'Yes. In the third year, students are expected to do a project for 4 credits\r'),
('What time does the college starts in the morning', 'NULL\r'),
('What will be the topics in Economics whether it will be Major economic or Micro economic in the first semester?', 'NULL\r'),
('What would we study in BA in BVoc?', 'NULL\r'),
('What would we study in BA in CS?', 'NULL\r'),
('What would we study in BA in psychology?', '\"In the first year you will study only the core courses in Psychology. \r'),
('What\'s the fees for bsc in computer science', 'Around 22,000/-. Please contact Accounts Dept of College for the exact fees.\r'),
('Where will I find admission form', 'NULL\r'),
('Which other courses should I take if I want to do master\'s in psychology?', 'If you want to do Master\'s in Psychology, I would strongly recommend that you take up Single Major in Psychology. The courses offered by the department are sufficient to create a strong basis for post graduate studies.\r'),
('Which teacher or sir I should meet if I want to know more about ba', 'NULL\r'),
('Which teacher or sir I should meet if I want to know more about bsc in c.s', 'NULL\r'),
('Which teacher or sir I should meet if I want to know more about bsc in chemistry', 'NULL\r'),
('Which teacher or sir I should meet if I want to know more about bsc in computer science', 'NULL\r'),
('Who are the professors of psychology subject?', 'NULL\r'),
('what time is it right now?', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `level_1`
--
ALTER TABLE `level_1`
  ADD PRIMARY KEY (`level_1_id`);

--
-- Indexes for table `level_2`
--
ALTER TABLE `level_2`
  ADD PRIMARY KEY (`level_2_id`),
  ADD KEY `FK_level_1_id` (`level_1_id_fk`);

--
-- Indexes for table `level_3`
--
ALTER TABLE `level_3`
  ADD PRIMARY KEY (`level_3_id`),
  ADD KEY `FK_level_2_id` (`level_2_id_fk`);

--
-- Indexes for table `level_4`
--
ALTER TABLE `level_4`
  ADD PRIMARY KEY (`level_4_id`),
  ADD KEY `FK_level_3_id` (`level_3_id_fk`);

--
-- Indexes for table `level_5`
--
ALTER TABLE `level_5`
  ADD PRIMARY KEY (`level_5_id`),
  ADD KEY `level_4_id_fk` (`level_4_id_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `level_5`
--
ALTER TABLE `level_5`
  MODIFY `level_5_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `level_2`
--
ALTER TABLE `level_2`
  ADD CONSTRAINT `FK_level_1_id` FOREIGN KEY (`level_1_id_fk`) REFERENCES `level_1` (`level_1_id`);

--
-- Constraints for table `level_3`
--
ALTER TABLE `level_3`
  ADD CONSTRAINT `FK_level_2_id` FOREIGN KEY (`level_2_id_fk`) REFERENCES `level_2` (`level_2_id`);

--
-- Constraints for table `level_4`
--
ALTER TABLE `level_4`
  ADD CONSTRAINT `FK_level_3_id` FOREIGN KEY (`level_3_id_fk`) REFERENCES `level_3` (`level_3_id`);

--
-- Constraints for table `level_5`
--
ALTER TABLE `level_5`
  ADD CONSTRAINT `level_4_id_fk` FOREIGN KEY (`level_4_id_fk`) REFERENCES `level_4` (`level_4_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
