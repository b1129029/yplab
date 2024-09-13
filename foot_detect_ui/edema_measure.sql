-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-09-11 09:30:25
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `edema_measure`
--

-- --------------------------------------------------------

--
-- 資料表結構 `水腫程度`
--

CREATE TABLE `水腫程度` (
  `測量編號` varchar(50) NOT NULL,
  `病患_ID` varchar(50) DEFAULT NULL,
  `測量時間` datetime DEFAULT NULL,
  `腳圍` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- 傾印資料表的資料 `水腫程度`
--

INSERT INTO `水腫程度` (`測量編號`, `病患_ID`, `測量時間`, `腳圍`) VALUES
('A001', '001', '2024-09-11 15:05:31', 50),
('A002', '001', '2024-09-11 15:05:32', 90),
('A003', '003', '2024-09-11 12:30:00', 30);

-- --------------------------------------------------------

--
-- 資料表結構 `病患資料`
--

CREATE TABLE `病患資料` (
  `病患_ID` varchar(50) NOT NULL,
  `名字` varchar(50) DEFAULT NULL,
  `性別` varchar(50) DEFAULT NULL,
  `身高` float DEFAULT NULL,
  `病患_LineID` varchar(50) DEFAULT NULL,
  `等級` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- 傾印資料表的資料 `病患資料`
--

INSERT INTO `病患資料` (`病患_ID`, `名字`, `性別`, `身高`, `病患_LineID`, `等級`) VALUES
('001', '高翊恩', '男', 172, 'n112233', 'A'),
('002', '李子捷', '男', 168, 'j112233', 'B'),
('003', '朱少謙', '男', 150, 'c112233', 'C');

-- --------------------------------------------------------

--
-- 資料表結構 `病患體重`
--

CREATE TABLE `病患體重` (
  `病患_ID` varchar(50) DEFAULT NULL,
  `體重` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- 傾印資料表的資料 `病患體重`
--

INSERT INTO `病患體重` (`病患_ID`, `體重`) VALUES
('001', 59),
('002', 50),
('003', 120);

-- --------------------------------------------------------

--
-- 資料表結構 `腳圍資料`
--

CREATE TABLE `腳圍資料` (
  `測量編號` varchar(50) DEFAULT NULL,
  `腳點1` double DEFAULT NULL,
  `腳點2` double DEFAULT NULL,
  `腳點3` double DEFAULT NULL,
  `腳點4` double DEFAULT NULL,
  `腳點5` double DEFAULT NULL,
  `腳點6` double DEFAULT NULL,
  `腳點7` double DEFAULT NULL,
  `腳點8` double DEFAULT NULL,
  `腳點9` double DEFAULT NULL,
  `腳點10` double DEFAULT NULL,
  `腳點11` double DEFAULT NULL,
  `腳點12` double DEFAULT NULL,
  `腳點13` double DEFAULT NULL,
  `腳點14` double DEFAULT NULL,
  `腳點15` double DEFAULT NULL,
  `腳點16` double DEFAULT NULL,
  `腳點17` double DEFAULT NULL,
  `腳點18` double DEFAULT NULL,
  `腳點19` double DEFAULT NULL,
  `腳點20` double DEFAULT NULL,
  `腳點21` double DEFAULT NULL,
  `腳點22` double DEFAULT NULL,
  `腳點23` double DEFAULT NULL,
  `腳點24` double DEFAULT NULL,
  `腳點25` double DEFAULT NULL,
  `腳點26` double DEFAULT NULL,
  `腳點27` double DEFAULT NULL,
  `腳點28` double DEFAULT NULL,
  `腳點29` double DEFAULT NULL,
  `腳點30` double DEFAULT NULL,
  `腳點31` double DEFAULT NULL,
  `腳點32` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- 傾印資料表的資料 `腳圍資料`
--

INSERT INTO `腳圍資料` (`測量編號`, `腳點1`, `腳點2`, `腳點3`, `腳點4`, `腳點5`, `腳點6`, `腳點7`, `腳點8`, `腳點9`, `腳點10`, `腳點11`, `腳點12`, `腳點13`, `腳點14`, `腳點15`, `腳點16`, `腳點17`, `腳點18`, `腳點19`, `腳點20`, `腳點21`, `腳點22`, `腳點23`, `腳點24`, `腳點25`, `腳點26`, `腳點27`, `腳點28`, `腳點29`, `腳點30`, `腳點31`, `腳點32`) VALUES
('A001', 0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, -27, 28, 29, 30, 31, 32, 33),
('A002', 0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, -27, 28, 29, 30, 31, 32, 33),
('A003', 0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, -27, 28, 29, 30, 31, 32, 33);

-- --------------------------------------------------------

--
-- 資料表結構 `醫生_病患關聯`
--

CREATE TABLE `醫生_病患關聯` (
  `醫生_ID` varchar(50) DEFAULT NULL,
  `病患_ID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- 傾印資料表的資料 `醫生_病患關聯`
--

INSERT INTO `醫生_病患關聯` (`醫生_ID`, `病患_ID`) VALUES
('D001', '001'),
('D001', '002'),
('D002', '002'),
('D002', '003');

-- --------------------------------------------------------

--
-- 資料表結構 `醫生資料`
--

CREATE TABLE `醫生資料` (
  `醫生_ID` varchar(50) NOT NULL,
  `名字` varchar(50) DEFAULT NULL,
  `醫生_LineID` varchar(50) DEFAULT NULL,
  `密碼` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- 傾印資料表的資料 `醫生資料`
--

INSERT INTO `醫生資料` (`醫生_ID`, `名字`, `醫生_LineID`, `密碼`) VALUES
('D001', '利侑謙', 'L112233', '123'),
('D002', '鄭羽雁', 'y112233', '123');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `水腫程度`
--
ALTER TABLE `水腫程度`
  ADD PRIMARY KEY (`測量編號`),
  ADD KEY `病患_ID` (`病患_ID`);

--
-- 資料表索引 `病患資料`
--
ALTER TABLE `病患資料`
  ADD PRIMARY KEY (`病患_ID`);

--
-- 資料表索引 `病患體重`
--
ALTER TABLE `病患體重`
  ADD KEY `病患_ID` (`病患_ID`);

--
-- 資料表索引 `腳圍資料`
--
ALTER TABLE `腳圍資料`
  ADD KEY `測量編號` (`測量編號`);

--
-- 資料表索引 `醫生_病患關聯`
--
ALTER TABLE `醫生_病患關聯`
  ADD KEY `病患_ID` (`病患_ID`),
  ADD KEY `醫生_ID` (`醫生_ID`);

--
-- 資料表索引 `醫生資料`
--
ALTER TABLE `醫生資料`
  ADD PRIMARY KEY (`醫生_ID`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `水腫程度`
--
ALTER TABLE `水腫程度`
  ADD CONSTRAINT `水腫程度_ibfk_1` FOREIGN KEY (`病患_ID`) REFERENCES `病患資料` (`病患_ID`);

--
-- 資料表的限制式 `病患體重`
--
ALTER TABLE `病患體重`
  ADD CONSTRAINT `病患體重_ibfk_1` FOREIGN KEY (`病患_ID`) REFERENCES `病患資料` (`病患_ID`);

--
-- 資料表的限制式 `腳圍資料`
--
ALTER TABLE `腳圍資料`
  ADD CONSTRAINT `腳圍資料_ibfk_1` FOREIGN KEY (`測量編號`) REFERENCES `水腫程度` (`測量編號`);

--
-- 資料表的限制式 `醫生_病患關聯`
--
ALTER TABLE `醫生_病患關聯`
  ADD CONSTRAINT `醫生_病患關聯_ibfk_1` FOREIGN KEY (`病患_ID`) REFERENCES `病患資料` (`病患_ID`),
  ADD CONSTRAINT `醫生_病患關聯_ibfk_2` FOREIGN KEY (`醫生_ID`) REFERENCES `醫生資料` (`醫生_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
