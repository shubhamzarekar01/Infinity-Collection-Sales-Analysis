-- ============================================================
-- INFINITY COLLECTION — PostgreSQL Database Schema & Queries
-- Author  : Shubham Zarekar (Data Analyst)
-- Business: Infinity Collection, Shirdi, Maharashtra
-- UDYAM   : UDYAM-MH-01-0056563
-- Version : 1.0  |  Date: 2025
-- ============================================================

-- ============================================================
-- 1. DATABASE SETUP
-- ============================================================
CREATE DATABASE infinity_collection;
\c infinity_collection;

-- ============================================================
-- 2. TABLE: monthly_sales
-- ============================================================
CREATE TABLE monthly_sales (
    id          SERIAL PRIMARY KEY,
    year        INTEGER NOT NULL,
    month_num   INTEGER NOT NULL CHECK (month_num BETWEEN 1 AND 12),
    month_name  VARCHAR(20) NOT NULL,
    collection  NUMERIC(12,2) NOT NULL DEFAULT 0,  -- Amount collected from market
    sell        NUMERIC(12,2) NOT NULL DEFAULT 0,  -- Amount sold to market
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(year, month_num)
);

-- ============================================================
-- 3. TABLE: parties (customers + suppliers)
-- ============================================================
CREATE TABLE parties (
    id              SERIAL PRIMARY KEY,
    party_name      VARCHAR(200) NOT NULL,
    party_name_mr   VARCHAR(200),           -- Marathi name
    party_type      VARCHAR(20) CHECK (party_type IN ('CUSTOMER','SUPPLIER')),
    mobile          VARCHAR(20),
    area            VARCHAR(100),
    city            VARCHAR(50) DEFAULT 'Shirdi',
    state           VARCHAR(50) DEFAULT 'Maharashtra',
    pincode         VARCHAR(10) DEFAULT '423109',
    receivable      NUMERIC(12,2) DEFAULT 0,
    payable         NUMERIC(12,2) DEFAULT 0,
    is_active       BOOLEAN DEFAULT TRUE,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- 4. TABLE: business_events (for context/annotations)
-- ============================================================
CREATE TABLE business_events (
    id          SERIAL PRIMARY KEY,
    event_date  DATE NOT NULL,
    event_type  VARCHAR(50),   -- 'milestone','setback','recovery'
    title       VARCHAR(200),
    description TEXT,
    impact      VARCHAR(10)    -- 'positive','negative','neutral'
);

-- ============================================================
-- 5. INSERT: 2024 Monthly Sales Data
-- ============================================================
INSERT INTO monthly_sales (year, month_num, month_name, collection, sell) VALUES
(2024,  1, 'January',   1606474, 1606703),
(2024,  2, 'February',  1084329,  981981),
(2024,  3, 'March',     1034395, 1140340),
(2024,  4, 'April',     1055722,  940390),
(2024,  5, 'May',       1308870, 1461639),
(2024,  6, 'June',      1339195, 1461639),
(2024,  7, 'July',      1238144, 1236975),
(2024,  8, 'August',     914813, 1023095),
(2024,  9, 'September',  774970,  958870),
(2024, 10, 'October',    929965,  986390),
(2024, 11, 'November',  1472745, 1313050),
(2024, 12, 'December',  1481232, 1393645);

-- ============================================================
-- 6. INSERT: 2025 Monthly Sales Data
-- ============================================================
INSERT INTO monthly_sales (year, month_num, month_name, collection, sell) VALUES
(2025,  1, 'January',   1437385, 1493496),
(2025,  2, 'February',   852705,  826287),
(2025,  3, 'March',      721015,  740890),
(2025,  4, 'April',      703980,  704877),
(2025,  5, 'May',        571390,  586120),
(2025,  6, 'June',       614800,  519845),
(2025,  7, 'July',       749455,  785481),
(2025,  8, 'August',     583985,  596710),
(2025,  9, 'September',  393329,  351784),
(2025, 10, 'October',    604960,  623785),
(2025, 11, 'November',   625830,  700800),
(2025, 12, 'December',   766830,  800800);

-- ============================================================
-- 7. INSERT: Business Events
-- ============================================================
INSERT INTO business_events (event_date, event_type, title, description, impact) VALUES
('2021-08-02', 'milestone', 'Business Founded',
 'Infinity Collection registered under UDYAM-MH-01-0056563. Started B2B supply to 3 shops in Shirdi.', 'positive'),
('2022-01-01', 'milestone', 'Network Expansion',
 'Expanded distribution network to 50+ retail shops across Shirdi region.', 'positive'),
('2023-06-01', 'milestone', 'Peak Revenue',
 'Achieved ₹1.5 Crore annual turnover milestone. 150+ active retail partners.', 'positive'),
('2024-12-01', 'setback', 'Owner Road Accident',
 'Shubham Zarekar met with a serious road accident in December 2024. Business temporarily managed by father Vilas Zarekar.', 'negative'),
('2025-01-01', 'setback', 'Business Slowdown',
 'Revenue declined ~40% YoY as operations reduced post-accident. Father managing with limited capacity.', 'negative'),
('2025-07-01', 'recovery', 'Owner Recovery & Career Pivot',
 'Shubham returning to active role. Planning career transition to Data Analytics / Engineering field.', 'positive');

-- ============================================================
-- 8. INSERT: Party Data (Customers)
-- ============================================================
INSERT INTO parties (party_name, party_type, mobile, area, receivable) VALUES
('Ajaypalande', 'CUSTOMER', '9022916395', 'KOTE COMPLEX', 24340),
('Amol Gangurde', 'CUSTOMER', '8975619882', 'SHIRDI HIGHWAY', 17100),
('Amolkhillari', 'CUSTOMER', '9325199418', 'KOTE COMPLEX', 9375),
('Arshad Bhai bhoj', 'CUSTOMER', '7666366585', 'BHOJANALAY', 36185),
('Arshadbhai', 'CUSTOMER', '7666366585', 'KOTE COMPLEX', 69920),
('Ashifbhai', 'CUSTOMER', '9156351375', 'KOTE COMPLEX', 18070),
('Bablu Kamble', 'CUSTOMER', '9850123106', 'SHIRDI HIGHWAY', 17060),
('Balaji wankhede', 'CUSTOMER', NULL, 'DWARKAMAI', 17650),
('Balasaheb Chavhan', 'CUSTOMER', '8788841433', 'SHIRDI HIGHWAY', 16555),
('Guddu Sharma', 'CUSTOMER', '7387357076', 'SHIRDI', 15160),
('Husenbhai', 'CUSTOMER', '9822537183', 'SHIRDI', 43420),
('Nisarbhai Pathan', 'CUSTOMER', '9834088802', 'SHIRDI', 28420),
('Pravinbhau gate no-01', 'CUSTOMER', '9075156339', 'SHIRDI MAIN', 66800),
('Ravi Arane', 'CUSTOMER', '9822773118', 'SHIRDI', 23889),
('Sachin harde', 'CUSTOMER', NULL, 'SHIRDI', 56230),
('Sahebrav gangurde', 'CUSTOMER', NULL, 'SHIRDI', 31570),
('Sagar Mali', 'CUSTOMER', '9545398535', 'SHIRDI', 24910),
('Sandeep Chavhan', 'CUSTOMER', '7620770544', 'SHIRDI', 24380),
('Shivaji Pawar', 'CUSTOMER', '7774873878', 'SHIRDI', 35026),
('Tribhuvan bhau', 'CUSTOMER', '8888808980', 'SHIRDI', 18600),
('Vilas tupe', 'CUSTOMER', '9763598394', 'SHIRDI', 19760),
('Vishalnagpure', 'CUSTOMER', '8411811501', 'SHIRDI', 23405),
('Yogesh kamble', 'CUSTOMER', NULL, 'SHIRDI', 21010);

INSERT INTO parties (party_name, party_type, mobile, area, payable) VALUES
('Kartik kamble', 'SUPPLIER', NULL, 'SHIRDI', 200555),
('Akash Regar', 'SUPPLIER', NULL, 'SHIRDI', 135528),
('Jutt bag kolkatta', 'SUPPLIER', NULL, 'KOLKATA', 122377),
('Shokatbhai', 'SUPPLIER', '9149263947', 'SHIRDI', 74100),
('Prakash bhai', 'SUPPLIER', NULL, 'SHIRDI', 60600),
('Ramesh bhai', 'SUPPLIER', NULL, 'SHIRDI', 44475),
('Sanubhai mumbai', 'SUPPLIER', NULL, 'MUMBAI', 34460),
('Shahin footware', 'SUPPLIER', NULL, 'SHIRDI', 23500),
('Woodland Kapoor', 'SUPPLIER', NULL, 'SHIRDI', 21080),
('L D DELHI', 'SUPPLIER', NULL, 'DELHI', 12400),
('Raju bhai kanpoor', 'SUPPLIER', NULL, 'KANPUR', 10000);

-- ============================================================
-- 9. ANALYTICAL QUERIES
-- ============================================================

-- Q1: Annual Revenue Summary
SELECT
    year,
    SUM(collection)                         AS total_collection,
    SUM(sell)                               AS total_sell,
    SUM(sell) - SUM(collection)             AS net_difference,
    ROUND(AVG(collection), 0)               AS avg_monthly_collection,
    ROUND(AVG(sell), 0)                     AS avg_monthly_sell
FROM monthly_sales
GROUP BY year
ORDER BY year;

-- Q2: Month-over-Month Growth (within each year)
SELECT
    year,
    month_name,
    collection,
    sell,
    sell - collection                        AS difference,
    LAG(collection) OVER (PARTITION BY year ORDER BY month_num) AS prev_month_collection,
    ROUND(
        (collection - LAG(collection) OVER (PARTITION BY year ORDER BY month_num))
        / NULLIF(LAG(collection) OVER (PARTITION BY year ORDER BY month_num), 0) * 100,
    1) AS mom_growth_pct
FROM monthly_sales
ORDER BY year, month_num;

-- Q3: Year-on-Year Comparison by Month
SELECT
    a.month_name,
    a.month_num,
    a.collection    AS collection_2024,
    a.sell          AS sell_2024,
    b.collection    AS collection_2025,
    b.sell          AS sell_2025,
    ROUND((b.collection - a.collection) / a.collection * 100, 1) AS coll_yoy_pct,
    ROUND((b.sell - a.sell) / a.sell * 100, 1)                   AS sell_yoy_pct
FROM monthly_sales a
JOIN monthly_sales b ON a.month_num = b.month_num AND a.year = 2024 AND b.year = 2025
ORDER BY a.month_num;

-- Q4: Best and Worst Performing Months
SELECT year, month_name, sell, collection,
    RANK() OVER (PARTITION BY year ORDER BY sell DESC) AS sell_rank,
    RANK() OVER (PARTITION BY year ORDER BY collection DESC) AS coll_rank
FROM monthly_sales
ORDER BY year, sell_rank;

-- Q5: Seasonal Analysis (Q1/Q2/Q3/Q4)
SELECT
    year,
    CASE
        WHEN month_num BETWEEN 1 AND 3 THEN 'Q1 (Jan-Mar)'
        WHEN month_num BETWEEN 4 AND 6 THEN 'Q2 (Apr-Jun)'
        WHEN month_num BETWEEN 7 AND 9 THEN 'Q3 (Jul-Sep)'
        ELSE 'Q4 (Oct-Dec)'
    END                                      AS quarter,
    SUM(collection)                          AS quarterly_collection,
    SUM(sell)                                AS quarterly_sell,
    ROUND(AVG(sell - collection), 0)         AS avg_monthly_diff
FROM monthly_sales
GROUP BY year, quarter
ORDER BY year, quarter;

-- Q6: Business Impact Analysis (Post-Accident)
SELECT
    CASE WHEN year = 2024 THEN 'Pre-Accident (2024)'
         WHEN year = 2025 AND month_num <= 11 THEN 'Post-Accident (2025)'
    END                                      AS period,
    COUNT(*)                                 AS months,
    ROUND(AVG(collection), 0)               AS avg_collection,
    ROUND(AVG(sell), 0)                     AS avg_sell,
    SUM(sell) - SUM(collection)             AS total_net
FROM monthly_sales
GROUP BY period
HAVING period IS NOT NULL
ORDER BY period;

-- Q7: Customer Outstanding Analysis
SELECT
    party_type,
    COUNT(*)                                AS total_parties,
    SUM(receivable)                         AS total_receivable,
    SUM(payable)                            AS total_payable,
    ROUND(AVG(receivable), 0)              AS avg_receivable,
    MAX(receivable)                         AS max_outstanding
FROM parties
GROUP BY party_type;

-- Q8: Top 10 Customers by Outstanding Balance
SELECT
    RANK() OVER (ORDER BY receivable DESC)  AS rank,
    party_name,
    mobile,
    area,
    receivable,
    CASE
        WHEN receivable > 50000 THEN 'HIGH PRIORITY - Urgent Collection'
        WHEN receivable > 20000 THEN 'MEDIUM - Follow Up'
        WHEN receivable > 5000  THEN 'LOW - Monitor'
        ELSE 'MINIMAL'
    END                                      AS collection_priority
FROM parties
WHERE party_type = 'CUSTOMER' AND receivable > 0
ORDER BY receivable DESC
LIMIT 10;

-- Q9: Running Total (Cumulative Revenue)
SELECT
    year, month_name, month_num,
    collection,
    SUM(collection) OVER (PARTITION BY year ORDER BY month_num)  AS cumulative_collection,
    SUM(sell) OVER (PARTITION BY year ORDER BY month_num)        AS cumulative_sell
FROM monthly_sales
ORDER BY year, month_num;

-- Q10: Business Health Score (Custom KPI)
WITH annual AS (
    SELECT year,
        SUM(sell)       AS total_sell,
        SUM(collection) AS total_coll,
        AVG(sell)       AS avg_sell
    FROM monthly_sales GROUP BY year
)
SELECT
    year,
    total_sell,
    total_coll,
    total_sell - total_coll                             AS net_margin,
    ROUND(total_sell / NULLIF(total_coll, 0) * 100, 1) AS sell_to_coll_ratio,
    CASE
        WHEN total_sell > 14000000 THEN '🏆 Excellent (>1.4 Cr)'
        WHEN total_sell > 10000000 THEN '✅ Good (>1 Cr)'
        WHEN total_sell > 7000000  THEN '⚠️ Average (>70 L)'
        ELSE '❌ Below Target'
    END                                                  AS business_health
FROM annual
ORDER BY year;

-- ============================================================
-- 10. VIEWS FOR POWER BI / REPORTING
-- ============================================================

CREATE OR REPLACE VIEW v_monthly_dashboard AS
SELECT
    ms.year, ms.month_num, ms.month_name,
    ms.collection, ms.sell,
    ms.sell - ms.collection                              AS net_difference,
    ROUND(ms.collection / SUM(ms.collection) OVER (PARTITION BY ms.year) * 100, 1) AS coll_pct,
    ROUND(ms.sell / SUM(ms.sell) OVER (PARTITION BY ms.year) * 100, 1)             AS sell_pct,
    LAG(ms.sell) OVER (PARTITION BY ms.month_num ORDER BY ms.year)                 AS prev_year_sell,
    ROUND((ms.sell - LAG(ms.sell) OVER (PARTITION BY ms.month_num ORDER BY ms.year))
        / NULLIF(LAG(ms.sell) OVER (PARTITION BY ms.month_num ORDER BY ms.year), 0) * 100, 1) AS yoy_pct
FROM monthly_sales ms
ORDER BY ms.year, ms.month_num;

CREATE OR REPLACE VIEW v_customer_segments AS
SELECT
    party_name, mobile, area,
    receivable,
    CASE
        WHEN receivable > 50000 THEN 'A - Premium Customer'
        WHEN receivable > 20000 THEN 'B - Regular Customer'
        WHEN receivable > 5000  THEN 'C - Small Customer'
        ELSE 'D - Minimal Balance'
    END AS customer_segment,
    CASE
        WHEN receivable > 50000 THEN 5
        WHEN receivable > 20000 THEN 4
        WHEN receivable > 10000 THEN 3
        WHEN receivable > 5000  THEN 2
        ELSE 1
    END AS priority_score
FROM parties
WHERE party_type = 'CUSTOMER';

-- ============================================================
-- End of Script
-- ============================================================
