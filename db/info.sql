-- --------------------------------------------------------
-- 主机:                           119.8.103.176
-- 服务器版本:                        10.5.5-MariaDB-1:10.5.5+maria~focal - mariadb.org binary distribution
-- 服务器操作系统:                      debian-linux-gnu
-- HeidiSQL 版本:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 stock 的数据库结构
CREATE DATABASE IF NOT EXISTS `stock` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `stock`;

-- 导出  表 stock.info 结构
CREATE TABLE IF NOT EXISTS `info` (
  `symbol` char(6) NOT NULL,
  `short_name` varchar(30) DEFAULT NULL,
  `pb` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `pe` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `pe_ttm` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `eps` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `eps_ttm` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `bps` decimal(10,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
