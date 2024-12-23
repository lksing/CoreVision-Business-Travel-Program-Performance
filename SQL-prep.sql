-- searches view: for each cvi search, the number of results with a cvi result, and whether or not a cvi was returned/booked
DECLARE from_dt DATE DEFAULT "2022-01-01";
DECLARE to_dt DATE DEFAULT "2023-12-31";

CREATE OR REPLACE VIEW `corevision-datalake-businesstravel.cvi_searches_view` AS

-- Selecting only the correlation IDs associated with CVI rate plans
WITH searches_cvi AS (
  SELECT
    DISTINCT(search_id)
  FROM `corevision-datalake-businesstravel.searches` as s
  WHERE
    EXTRACT(DATE FROM eda_ingest_ts) BETWEEN from_dt AND to_dt
    AND (REGEXP_MATCH(program_code,r'^CVI$')))
),
results_cvi AS (
  SELECT
    result_id, 
    CASE WHEN REGEXP_MATCH(program_code,r'^CVI$')) THEN 1 ELSE 0
    END AS program_flag,
    ratekey
  FROM `corevision-datalake-businesstravel.results` as r
  WHERE
    EXTRACT(DATE FROM eda_ingest_ts) BETWEEN from_dt AND  to_dt
),
result_cvi_ct AS (
  select
    search_id, 
    result_id,
    sum(program_flag) as program_result_ct, 
  from results_cvi
  group by result_id, ratekey
),
bookings AS (
  SELECT
  booking_id,
  result_id,
  program_code,
  ratekey,
  FROM `corevision-datalake-businesstravel.bookings`
  WHERE EXTRACT(DATE FROM eda_ingest_ts) BETWEEN from_dt AND to_dt
)
SELECT
results_cvi_ct.result_id,
program_result_ct,
CASE 
  WHEN program_result_ct >= 1 THEN TRUE 
  WHEN program_result_ct = 0 THEN FALSE
  ELSE FALSE
END AS ProgramReturned,
CASE 
  WHEN bookings.REGEXP_MATCH(program_code,r'^CVI$')) THEN TRUE ELSE FALSE
END AS CVIRate
FROM result_cvi_ct
inner JOIN searches_cvi ON searches_cvi.search_id = result_cvi_ct.search_id
inner JOIN bookings ON results_cvi_ct.result_id = bookings.result_id

--1c. cases view (A, B, C)
CREATE OR REPLACE VIEW `corevision-datalake-businesstravel.cvi_cases` AS

SELECT
*,
CASE 
  WHEN ProgramReturned = TRUE AND CVIRate = TRUE THEN "A"
  WHEN ProgramReturned = TRUE AND CVIRate = FALSE THEN "B"
  WHEN ProgramReturned = FALSE THEN "C"
  ELSE "other"
END AS cases
FROM `corevision-datalake-businesstravel.cvi_searches_view`

-- case B view
CREATE OR REPLACE VIEW `corevision-datalake-businesstravel.cvi_caseB` AS
-- Selecting only the searches with leakage (program code is returned but not booked)
WITH caseB AS (
    SELECT *
FROM `corevision-datalake-businesstravel.cvi_cases`
WHERE cases = "B"
),
calc AS (
SELECT
    result_id,
    search_id,
    AVG(CASE 
        WHEN REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END) AS avg_APP,
    AVG(CASE 
        WHEN NOT REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END) AS avg_other,
    (AVG(CASE 
        WHEN REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END) - AVG(CASE 
        WHEN NOT REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END)) AS avg_diff_from_other,
    ((AVG(CASE 
        WHEN REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END) - AVG(CASE 
        WHEN NOT REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END)) / AVG(CASE 
        WHEN NOT REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END)) * 100 AS avg_percent_diff,
    MIN(CASE 
        WHEN REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END) AS min_APP,
    MIN(CASE 
        WHEN NOT REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END) AS min_other,
    (MIN(CASE 
        WHEN REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END) - MIN(CASE 
        WHEN NOT REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END)) AS min_diff_from_other,
    ((MIN(CASE 
        WHEN REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END) - MIN(CASE 
        WHEN NOT REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END)) / MIN(CASE 
        WHEN NOT REGEXP_MATCH(program_code,r'^CVI$')) THEN amount_after_tax 
        ELSE NULL 
    END)) * 100 AS min_percent_diff
FROM `corevision-datalake-businesstravel.results` rs 
GROUP BY search_id
)

SELECT
DISTINCT
caseB.result_id,
avg_APP,
avg_other,
avg_diff_from_other,
avg_percent_diff,
min_APP,
min_other,
min_diff_from_other,
min_percent_diff
FROM caseB
LEFT JOIN calc ON caseB.result_id = calc.result_id
