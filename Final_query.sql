-- =====================================================================
-- SQL Stock Market Analysis | Single submission file | MySQL 8
-- Part A: database + table setup + CSV load   Part B: Tasks 1-13
-- NOTE: change the LOAD DATA file paths (E:/...) to your own CSV folder.
-- =====================================================================
CREATE DATABASE IF NOT EXISTS stock_analysis;

-- ===================== PART A: SETUP =====================
USE stock_analysis;
SET GLOBAL local_infile = 1;

DROP TABLE IF EXISTS bajaj_auto;
CREATE TABLE bajaj_auto (
  `date` DATE PRIMARY KEY,
  open_price DECIMAL(12,2), high_price DECIMAL(12,2), low_price DECIMAL(12,2),
  close_price DECIMAL(12,2), wap DECIMAL(16,4),
  no_of_shares BIGINT, no_of_trades BIGINT, total_turnover DECIMAL(20,2),
  deliverable_qty BIGINT, pct_deli_qty DECIMAL(6,2),
  spread_high_low DECIMAL(12,2), spread_close_open DECIMAL(12,2)
);

LOAD DATA LOCAL INFILE 'E:/Intership-DA-BA/SQL-Stock Market Analysis/Requirement/Bajaj Auto.csv'
INTO TABLE bajaj_auto
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES
(@d,@o,@h,@l,@c,@w,@s,@tr,@to,@dq,@pd,@shl,@sco)
SET `date` = STR_TO_DATE(@d, '%d-%M-%Y'),
    open_price = NULLIF(@o,''), high_price = NULLIF(@h,''), low_price = NULLIF(@l,''),
    close_price = NULLIF(@c,''), wap = NULLIF(@w,''), no_of_shares = NULLIF(@s,''),
    no_of_trades = NULLIF(@tr,''), total_turnover = NULLIF(@to,''),
    deliverable_qty = NULLIF(@dq,''), pct_deli_qty = NULLIF(@pd,''),
    spread_high_low = NULLIF(@shl,''), spread_close_open = NULLIF(TRIM(@sco),'');

USE stock_analysis;

-- ===== eicher_motors =====
DROP TABLE IF EXISTS eicher_motors;
CREATE TABLE eicher_motors (
  `date` DATE PRIMARY KEY,
  open_price DECIMAL(12,2), high_price DECIMAL(12,2), low_price DECIMAL(12,2),
  close_price DECIMAL(12,2), wap DECIMAL(16,4),
  no_of_shares BIGINT, no_of_trades BIGINT, total_turnover DECIMAL(20,2),
  deliverable_qty BIGINT, pct_deli_qty DECIMAL(6,2),
  spread_high_low DECIMAL(12,2), spread_close_open DECIMAL(12,2)
);
LOAD DATA LOCAL INFILE 'E:/Intership-DA-BA/SQL-Stock Market Analysis/Requirement/Eicher Motors.csv'
INTO TABLE eicher_motors
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES
(@d,@o,@h,@l,@c,@w,@s,@tr,@to,@dq,@pd,@shl,@sco)
SET `date` = STR_TO_DATE(@d, '%d-%M-%Y'),
    open_price = NULLIF(@o,''), high_price = NULLIF(@h,''), low_price = NULLIF(@l,''),
    close_price = NULLIF(@c,''), wap = NULLIF(@w,''), no_of_shares = NULLIF(@s,''),
    no_of_trades = NULLIF(@tr,''), total_turnover = NULLIF(@to,''),
    deliverable_qty = NULLIF(@dq,''), pct_deli_qty = NULLIF(@pd,''),
    spread_high_low = NULLIF(@shl,''), spread_close_open = NULLIF(TRIM(@sco),'');

-- ===== hero_motocorp =====
DROP TABLE IF EXISTS hero_motocorp;
CREATE TABLE hero_motocorp (
  `date` DATE PRIMARY KEY,
  open_price DECIMAL(12,2), high_price DECIMAL(12,2), low_price DECIMAL(12,2),
  close_price DECIMAL(12,2), wap DECIMAL(16,4),
  no_of_shares BIGINT, no_of_trades BIGINT, total_turnover DECIMAL(20,2),
  deliverable_qty BIGINT, pct_deli_qty DECIMAL(6,2),
  spread_high_low DECIMAL(12,2), spread_close_open DECIMAL(12,2)
);
LOAD DATA LOCAL INFILE 'E:/Intership-DA-BA/SQL-Stock Market Analysis/Requirement/Hero Motocorp.csv'
INTO TABLE hero_motocorp
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES
(@d,@o,@h,@l,@c,@w,@s,@tr,@to,@dq,@pd,@shl,@sco)
SET `date` = STR_TO_DATE(@d, '%d-%M-%Y'),
    open_price = NULLIF(@o,''), high_price = NULLIF(@h,''), low_price = NULLIF(@l,''),
    close_price = NULLIF(@c,''), wap = NULLIF(@w,''), no_of_shares = NULLIF(@s,''),
    no_of_trades = NULLIF(@tr,''), total_turnover = NULLIF(@to,''),
    deliverable_qty = NULLIF(@dq,''), pct_deli_qty = NULLIF(@pd,''),
    spread_high_low = NULLIF(@shl,''), spread_close_open = NULLIF(TRIM(@sco),'');

-- ===== infosys =====
DROP TABLE IF EXISTS infosys;
CREATE TABLE infosys (
  `date` DATE PRIMARY KEY,
  open_price DECIMAL(12,2), high_price DECIMAL(12,2), low_price DECIMAL(12,2),
  close_price DECIMAL(12,2), wap DECIMAL(16,4),
  no_of_shares BIGINT, no_of_trades BIGINT, total_turnover DECIMAL(20,2),
  deliverable_qty BIGINT, pct_deli_qty DECIMAL(6,2),
  spread_high_low DECIMAL(12,2), spread_close_open DECIMAL(12,2)
);
LOAD DATA LOCAL INFILE 'E:/Intership-DA-BA/SQL-Stock Market Analysis/Requirement/Infosys.csv'
INTO TABLE infosys
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES
(@d,@o,@h,@l,@c,@w,@s,@tr,@to,@dq,@pd,@shl,@sco)
SET `date` = STR_TO_DATE(@d, '%d-%M-%Y'),
    open_price = NULLIF(@o,''), high_price = NULLIF(@h,''), low_price = NULLIF(@l,''),
    close_price = NULLIF(@c,''), wap = NULLIF(@w,''), no_of_shares = NULLIF(@s,''),
    no_of_trades = NULLIF(@tr,''), total_turnover = NULLIF(@to,''),
    deliverable_qty = NULLIF(@dq,''), pct_deli_qty = NULLIF(@pd,''),
    spread_high_low = NULLIF(@shl,''), spread_close_open = NULLIF(TRIM(@sco),'');

-- ===== tcs =====
DROP TABLE IF EXISTS tcs;
CREATE TABLE tcs (
  `date` DATE PRIMARY KEY,
  open_price DECIMAL(12,2), high_price DECIMAL(12,2), low_price DECIMAL(12,2),
  close_price DECIMAL(12,2), wap DECIMAL(16,4),
  no_of_shares BIGINT, no_of_trades BIGINT, total_turnover DECIMAL(20,2),
  deliverable_qty BIGINT, pct_deli_qty DECIMAL(6,2),
  spread_high_low DECIMAL(12,2), spread_close_open DECIMAL(12,2)
);
LOAD DATA LOCAL INFILE 'E:/Intership-DA-BA/SQL-Stock Market Analysis/Requirement/TCS.csv'
INTO TABLE tcs
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES
(@d,@o,@h,@l,@c,@w,@s,@tr,@to,@dq,@pd,@shl,@sco)
SET `date` = STR_TO_DATE(@d, '%d-%M-%Y'),
    open_price = NULLIF(@o,''), high_price = NULLIF(@h,''), low_price = NULLIF(@l,''),
    close_price = NULLIF(@c,''), wap = NULLIF(@w,''), no_of_shares = NULLIF(@s,''),
    no_of_trades = NULLIF(@tr,''), total_turnover = NULLIF(@to,''),
    deliverable_qty = NULLIF(@dq,''), pct_deli_qty = NULLIF(@pd,''),
    spread_high_low = NULLIF(@shl,''), spread_close_open = NULLIF(TRIM(@sco),'');

-- ===== tvs_motors =====
DROP TABLE IF EXISTS tvs_motors;
CREATE TABLE tvs_motors (
  `date` DATE PRIMARY KEY,
  open_price DECIMAL(12,2), high_price DECIMAL(12,2), low_price DECIMAL(12,2),
  close_price DECIMAL(12,2), wap DECIMAL(16,4),
  no_of_shares BIGINT, no_of_trades BIGINT, total_turnover DECIMAL(20,2),
  deliverable_qty BIGINT, pct_deli_qty DECIMAL(6,2),
  spread_high_low DECIMAL(12,2), spread_close_open DECIMAL(12,2)
);
LOAD DATA LOCAL INFILE 'E:/Intership-DA-BA/SQL-Stock Market Analysis/Requirement/TVS Motors.csv'
INTO TABLE tvs_motors
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES
(@d,@o,@h,@l,@c,@w,@s,@tr,@to,@dq,@pd,@shl,@sco)
SET `date` = STR_TO_DATE(@d, '%d-%M-%Y'),
    open_price = NULLIF(@o,''), high_price = NULLIF(@h,''), low_price = NULLIF(@l,''),
    close_price = NULLIF(@c,''), wap = NULLIF(@w,''), no_of_shares = NULLIF(@s,''),
    no_of_trades = NULLIF(@tr,''), total_turnover = NULLIF(@to,''),
    deliverable_qty = NULLIF(@dq,''), pct_deli_qty = NULLIF(@pd,''),
    spread_high_low = NULLIF(@shl,''), spread_close_open = NULLIF(TRIM(@sco),'');
    

-- Check: each table should have 889 rows
SELECT COUNT(*) AS bajaj_rows FROM bajaj_auto;

-- ===================== PART B: TASKS 1-13 =====================

-- ---------------------------------------------------------------------
-- Task 1: Trading days, first date, last date (bajaj_auto)
-- ---------------------------------------------------------------------
SELECT COUNT(*)  AS trading_days,
       MIN(date) AS first_day,
       MAX(date) AS last_day
FROM bajaj_auto;

-- ---------------------------------------------------------------------
-- Task 2: Eicher Motors' five highest closing prices
-- ---------------------------------------------------------------------
SELECT date, close_price
FROM eicher_motors
ORDER BY close_price DESC
LIMIT 5;

-- ---------------------------------------------------------------------
-- Task 3: TCS average close per year
-- ---------------------------------------------------------------------
SELECT YEAR(date) AS year,
       ROUND(AVG(close_price), 2) AS avg_close
FROM tcs
GROUP BY YEAR(date)
ORDER BY year ASC;

-- ---------------------------------------------------------------------
-- Task 4: Rows where deliverable_qty is NULL (all six tables)
-- ---------------------------------------------------------------------
SELECT 'bajaj_auto' AS stock, date FROM bajaj_auto WHERE deliverable_qty IS NULL
UNION ALL
SELECT 'eicher_motors', date FROM eicher_motors WHERE deliverable_qty IS NULL
UNION ALL
SELECT 'hero_motocorp', date FROM hero_motocorp WHERE deliverable_qty IS NULL
UNION ALL
SELECT 'infosys', date FROM infosys WHERE deliverable_qty IS NULL
UNION ALL
SELECT 'tcs', date FROM tcs WHERE deliverable_qty IS NULL
UNION ALL
SELECT 'tvs_motors', date FROM tvs_motors WHERE deliverable_qty IS NULL;

-- ---------------------------------------------------------------------
-- Task 5: bajaj1 (date, close_price, ma20, ma50)
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS bajaj1;
CREATE TABLE bajaj1 AS
SELECT date,
       close_price,
       CASE WHEN ROW_NUMBER() OVER (ORDER BY date) >= 20
            THEN ROUND(AVG(close_price) OVER (
                       ORDER BY date
                       ROWS BETWEEN 19 PRECEDING AND CURRENT ROW), 2)
       END AS ma20,
       CASE WHEN ROW_NUMBER() OVER (ORDER BY date) >= 50
            THEN ROUND(AVG(close_price) OVER (
                       ORDER BY date
                       ROWS BETWEEN 49 PRECEDING AND CURRENT ROW), 2)
       END AS ma50
FROM bajaj_auto;

SELECT * FROM bajaj1;

-- ---------------------------------------------------------------------
-- Task 6: master_table (date, bajaj, tcs, tvs, infosys, eicher, hero)
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS master_table;
CREATE TABLE master_table AS
SELECT b.date,
       b.close_price   AS bajaj,
       t.close_price   AS tcs,
       tv.close_price  AS tvs,
       inf.close_price AS infosys,
       em.close_price  AS eicher,
       hm.close_price  AS hero
FROM bajaj_auto b
JOIN tcs t            ON t.date   = b.date
JOIN tvs_motors tv    ON tv.date  = b.date
JOIN infosys inf      ON inf.date = b.date
JOIN eicher_motors em ON em.date  = b.date
JOIN hero_motocorp hm ON hm.date  = b.date;

SELECT * FROM master_table;

-- ---------------------------------------------------------------------
-- Task 7: bajaj2 (date, close_price, signal) - golden cross Buy/Sell/Hold
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS bajaj2;
CREATE TABLE bajaj2 AS
WITH t AS (
    SELECT date, close_price, ma20, ma50,
           LAG(ma20) OVER (ORDER BY date) AS prev_ma20,
           LAG(ma50) OVER (ORDER BY date) AS prev_ma50
    FROM bajaj1
)
SELECT date,
       close_price,
       CASE
           WHEN ma50 IS NULL OR prev_ma50 IS NULL THEN 'Hold'
           WHEN ma20 > ma50 AND prev_ma20 <= prev_ma50 THEN 'Buy'
           WHEN ma20 < ma50 AND prev_ma20 >= prev_ma50 THEN 'Sell'
           ELSE 'Hold'
       END AS `signal`
FROM t;

SELECT * FROM bajaj2;

-- ---------------------------------------------------------------------
-- Task 8: Count of each signal
-- ---------------------------------------------------------------------
SELECT `signal`, COUNT(*) AS days
FROM bajaj2
GROUP BY `signal`
ORDER BY `signal`;

-- ---------------------------------------------------------------------
-- Task 9: Signal on a given day (query + MySQL function)
-- ---------------------------------------------------------------------
SELECT `signal`
FROM bajaj2
WHERE date = '2018-06-21';

DROP FUNCTION IF EXISTS get_signal;
DELIMITER $$
CREATE FUNCTION get_signal(p_date DATE)
RETURNS VARCHAR(10)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_signal VARCHAR(10) DEFAULT NULL;
    SELECT `signal` INTO v_signal
    FROM bajaj2
    WHERE date = p_date;
    RETURN v_signal;
END$$
DELIMITER ;

SELECT get_signal('2018-06-21') AS signal_on_date;
SELECT get_signal('2015-05-18') AS expect_buy;
SELECT get_signal('2016-01-04') AS expect_hold;
SELECT get_signal('2015-05-17') AS expect_null;   -- Sunday

-- ---------------------------------------------------------------------
-- Task 10: All six stocks in one query (buys, sells, last signal)
-- ---------------------------------------------------------------------
WITH prices AS (
    SELECT 'Bajaj Auto' AS stock, date, close_price FROM bajaj_auto
    UNION ALL
    SELECT 'Eicher Motors', date, close_price FROM eicher_motors
    UNION ALL
    SELECT 'Hero Motocorp', date, close_price FROM hero_motocorp
    UNION ALL
    SELECT 'Infosys', date, close_price FROM infosys
    UNION ALL
    SELECT 'TCS', date, close_price FROM tcs
    UNION ALL
    SELECT 'TVS Motors', date, close_price FROM tvs_motors
),
ma AS (
    SELECT stock, date, close_price,
           CASE WHEN ROW_NUMBER() OVER (PARTITION BY stock ORDER BY date) >= 20
                THEN AVG(close_price) OVER (PARTITION BY stock ORDER BY date
                         ROWS BETWEEN 19 PRECEDING AND CURRENT ROW) END AS ma20,
           CASE WHEN ROW_NUMBER() OVER (PARTITION BY stock ORDER BY date) >= 50
                THEN AVG(close_price) OVER (PARTITION BY stock ORDER BY date
                         ROWS BETWEEN 49 PRECEDING AND CURRENT ROW) END AS ma50
    FROM prices
),
lagged AS (
    SELECT stock, date, close_price, ma20, ma50,
           LAG(ma20) OVER (PARTITION BY stock ORDER BY date) AS prev_ma20,
           LAG(ma50) OVER (PARTITION BY stock ORDER BY date) AS prev_ma50
    FROM ma
),
sig AS (
    SELECT stock, date, close_price,
           CASE
               WHEN ma50 IS NULL OR prev_ma50 IS NULL THEN 'Hold'
               WHEN ma20 > ma50 AND prev_ma20 <= prev_ma50 THEN 'Buy'
               WHEN ma20 < ma50 AND prev_ma20 >= prev_ma50 THEN 'Sell'
               ELSE 'Hold'
           END AS `signal`
    FROM lagged
),
latest AS (
    SELECT stock, date, `signal`,
           ROW_NUMBER() OVER (PARTITION BY stock ORDER BY date DESC) AS rn
    FROM sig
    WHERE `signal` <> 'Hold'
)
SELECT s.stock,
       SUM(s.`signal` = 'Buy')  AS buys,
       SUM(s.`signal` = 'Sell') AS sells,
       l.date                   AS last_signal_date,
       l.`signal`               AS last_signal
FROM sig s
JOIN latest l ON l.stock = s.stock AND l.rn = 1
GROUP BY s.stock, l.date, l.`signal`
ORDER BY s.stock;

-- ---------------------------------------------------------------------
-- Task 11: Who went up? (first close, last close, % change)
-- ---------------------------------------------------------------------
WITH prices AS (
    SELECT 'Bajaj Auto' AS stock, date, close_price FROM bajaj_auto
    UNION ALL
    SELECT 'Eicher Motors', date, close_price FROM eicher_motors
    UNION ALL
    SELECT 'Hero Motocorp', date, close_price FROM hero_motocorp
    UNION ALL
    SELECT 'Infosys', date, close_price FROM infosys
    UNION ALL
    SELECT 'TCS', date, close_price FROM tcs
    UNION ALL
    SELECT 'TVS Motors', date, close_price FROM tvs_motors
),
ends AS (
    SELECT stock, MIN(date) AS first_date, MAX(date) AS last_date
    FROM prices
    GROUP BY stock
)
SELECT e.stock,
       f.close_price AS first_close,
       l.close_price AS last_close,
       ROUND(100.0 * (l.close_price - f.close_price) / f.close_price, 1) AS pct_change
FROM ends e
JOIN prices f ON f.stock = e.stock AND f.date = e.first_date
JOIN prices l ON l.stock = e.stock AND l.date = e.last_date
ORDER BY pct_change DESC;

-- ---------------------------------------------------------------------
-- Task 12: The data trap - each stock's single worst day
-- ---------------------------------------------------------------------
WITH prices AS (
    SELECT 'Bajaj Auto' AS stock, date, close_price FROM bajaj_auto
    UNION ALL
    SELECT 'Eicher Motors', date, close_price FROM eicher_motors
    UNION ALL
    SELECT 'Hero Motocorp', date, close_price FROM hero_motocorp
    UNION ALL
    SELECT 'Infosys', date, close_price FROM infosys
    UNION ALL
    SELECT 'TCS', date, close_price FROM tcs
    UNION ALL
    SELECT 'TVS Motors', date, close_price FROM tvs_motors
),
moves AS (
    SELECT stock, date, close_price,
           100.0 * (close_price /
                    LAG(close_price) OVER (PARTITION BY stock ORDER BY date) - 1) AS pct_move
    FROM prices
),
ranked AS (
    SELECT stock, date, close_price, pct_move,
           ROW_NUMBER() OVER (PARTITION BY stock ORDER BY pct_move ASC) AS rn
    FROM moves
    WHERE pct_move IS NOT NULL
)
SELECT stock, date, close_price, ROUND(pct_move, 1) AS pct_move
FROM ranked
WHERE rn = 1
ORDER BY pct_move ASC;

-- ---------------------------------------------------------------------
-- Task 13: Fix it - adjust TCS and Infosys for the 1:1 bonus issues
-- Event date = the day each stock's price drops to the new level
-- (the TCS and Infosys rows found in Task 12). Prices BEFORE that date
-- are divided by 2.
-- ---------------------------------------------------------------------
WITH prices AS (
    SELECT 'Infosys' AS stock, date, close_price FROM infosys
    UNION ALL
    SELECT 'TCS', date, close_price FROM tcs
),
moves AS (
    SELECT stock, date,
           close_price / LAG(close_price) OVER (PARTITION BY stock ORDER BY date) - 1 AS pct_move
    FROM prices
),
events AS (
    SELECT stock, date AS event_date
    FROM (
        SELECT stock, date,
               ROW_NUMBER() OVER (PARTITION BY stock ORDER BY pct_move ASC) AS rn
        FROM moves
        WHERE pct_move IS NOT NULL
    ) x
    WHERE rn = 1
),
adjusted AS (
    SELECT p.stock, p.date,
           CASE WHEN p.date < e.event_date
                THEN p.close_price / 2
                ELSE p.close_price END AS adj_close
    FROM prices p
    JOIN events e ON e.stock = p.stock
)
SELECT stock,
       ROUND(100.0 * (
           MAX(CASE WHEN date = '2018-07-31' THEN adj_close END) /
           MAX(CASE WHEN date = '2015-01-01' THEN adj_close END) - 1
       ), 1) AS adjusted_pct_change
FROM adjusted
GROUP BY stock
ORDER BY stock;