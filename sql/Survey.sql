---Provider Survey Flow 2024 - All Percentiles

--MGMA
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma 24" RENAME COLUMN new_metric TO metric
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma 23" RENAME COLUMN new_metric TO metric
ALTER TABLE "survey_benchmark_data"."mgma_survey_data"."mgma 2020 survey 2019 data" DROP COLUMN _C89

-- Create the new table with all columns from the union of the specified tables
CREATE TABLE "survey_benchmark_data"."final outputs"."mgma" AS
SELECT 
    survey,
    region,
    "survey year",
    "data year",
    metric,
    "provider specialty",
    "ind count",
    *
FROM "survey_benchmark_data"."final outputs"."mgma 24"

UNION ALL

SELECT 
    survey,
    region,
    "survey year",
    "data year",
    metric,
    "provider specialty",
    "ind count",
    *
FROM "survey_benchmark_data"."final outputs"."mgma 23"

UNION ALL

SELECT 
    survey,
    region,
    "survey year",
    "data year",
    metric,
    "provider specialty",
    "ind count",
    *
FROM "survey_benchmark_data"."mgma_survey_data"."mgma 2022 survey 2021 data"

UNION ALL

SELECT 
    survey,
    region,
    "survey year",
    "data year",
    metric,
    "provider specialty",
    "ind count",
    *
FROM "survey_benchmark_data"."mgma_survey_data"."mgma 2021 survey 2020 data"

UNION ALL

SELECT 
    survey,
    region,
    "survey year",
    "data year",
    metric,
    "provider specialty",
    "ind count",
    *
FROM "survey_benchmark_data"."mgma_survey_data"."mgma 2020 survey 2019 data";



--AMGA
ALTER TABLE "survey_benchmark_data"."amga_survey_data"."amga 2020 survey 2019 data" RENAME COLUMN "provider count " TO "provider count"

CREATE TABLE IF NOT EXISTS "survey_benchmark_data"."final outputs"."amga" (
    "data year" INT,
    "survey year" INT,
    survey VARCHAR,
    metric VARCHAR,
    "specialty name" VARCHAR,
    "group count" INT,
    "provider count" INT,
    mean FLOAT,
    "standard deviation" FLOAT,
    "20" FLOAT,
    "25" FLOAT,
    "50" FLOAT,
    "75" FLOAT,
    "80" FLOAT,
    "90" FLOAT,
    region VARCHAR
);

INSERT INTO "survey_benchmark_data"."final outputs"."amga" (
    "data year", 
    "survey year", 
    survey, 
    metric, 
    "specialty name", 
    "group count", 
    "provider count", 
    mean, 
    "standard deviation", 
    "20", 
    "25", 
    "50", 
    "75", 
    "80", 
    "90", 
    region
)
SELECT 
    CAST(REPLACE("data year", ',', '') AS INT), 
    CAST(REPLACE("survey year", ',', '') AS INT), 
    survey, 
    metric, 
    "specialty name", 
    CAST(REPLACE("group count", ',', '') AS INT), 
    CAST(REPLACE("provider count", ',', '') AS INT), 
    CAST(REPLACE(mean, ',', '') AS FLOAT), 
    CAST(REPLACE("standard deviation", ',', '') AS FLOAT), 
    CAST(REPLACE("20", ',', '') AS FLOAT), 
    CAST(REPLACE("25", ',', '') AS FLOAT), 
    CAST(REPLACE("50", ',', '') AS FLOAT), 
    CAST(REPLACE("75", ',', '') AS FLOAT), 
    CAST(REPLACE("80", ',', '') AS FLOAT), 
    CAST(REPLACE("90", ',', '') AS FLOAT), 
    region
FROM survey_benchmark_data.amga_survey_data."amga 2024 survey 2023 data"

UNION ALL

SELECT 
    CAST(REPLACE("data year", ',', '') AS INT), 
    CAST(REPLACE("survey year", ',', '') AS INT), 
    survey, 
    metric, 
    "specialty name", 
    CAST(REPLACE("group count", ',', '') AS INT), 
    CAST(REPLACE("provider count", ',', '') AS INT), 
    CAST(REPLACE(mean, ',', '') AS FLOAT), 
    CAST(REPLACE("standard deviation", ',', '') AS FLOAT), 
    CAST(REPLACE("20", ',', '') AS FLOAT), 
    CAST(REPLACE("25", ',', '') AS FLOAT), 
    CAST(REPLACE("50", ',', '') AS FLOAT), 
    CAST(REPLACE("75", ',', '') AS FLOAT), 
    CAST(REPLACE("80", ',', '') AS FLOAT), 
    CAST(REPLACE("90", ',', '') AS FLOAT), 
    region
FROM survey_benchmark_data.amga_survey_data."amga 2023 survey 2022 data"

UNION ALL

SELECT 
    CAST(REPLACE("data year", ',', '') AS INT), 
    CAST(REPLACE("survey year", ',', '') AS INT), 
    survey, 
    metric, 
    "specialty name", 
    CAST(REPLACE("group count", ',', '') AS INT), 
    CAST(REPLACE("provider count", ',', '') AS INT), 
    CAST(REPLACE(mean, ',', '') AS FLOAT), 
    CAST(REPLACE("standard deviation", ',', '') AS FLOAT), 
    CAST(REPLACE("20", ',', '') AS FLOAT), 
    CAST(REPLACE("25", ',', '') AS FLOAT), 
    CAST(REPLACE("50", ',', '') AS FLOAT), 
    CAST(REPLACE("75", ',', '') AS FLOAT), 
    CAST(REPLACE("80", ',', '') AS FLOAT), 
    CAST(REPLACE("90", ',', '') AS FLOAT), 
    region
FROM survey_benchmark_data.amga_survey_data."amga 2022 survey 2021 data"

UNION ALL

SELECT 
    CAST(REPLACE("data year", ',', '') AS INT), 
    CAST(REPLACE("survey year", ',', '') AS INT), 
    survey, 
    metric, 
    "specialty name", 
    CAST(REPLACE("group count", ',', '') AS INT), 
    CAST(REPLACE("provider count", ',', '') AS INT), 
    CAST(REPLACE(mean, ',', '') AS FLOAT), 
    CAST(REPLACE("standard deviation", ',', '') AS FLOAT), 
    CAST(REPLACE("20", ',', '') AS FLOAT), 
    CAST(REPLACE("25", ',', '') AS FLOAT), 
    CAST(REPLACE("50", ',', '') AS FLOAT), 
    CAST(REPLACE("75", ',', '') AS FLOAT), 
    CAST(REPLACE("80", ',', '') AS FLOAT), 
    CAST(REPLACE("90", ',', '') AS FLOAT), 
    region
FROM survey_benchmark_data.amga_survey_data."amga 2021 survey 2020 data"

UNION ALL

SELECT 
    CAST(REPLACE("data year", ',', '') AS INT), 
    CAST(REPLACE("survey year", ',', '') AS INT), 
    survey, 
    metric, 
    "specialty name", 
    CAST(REPLACE("group count", ',', '') AS INT), 
    CAST(REPLACE("provider count", ',', '') AS INT), 
    CAST(REPLACE(mean, ',', '') AS FLOAT), 
    CAST(REPLACE("standard deviation", ',', '') AS FLOAT), 
    CAST(REPLACE("20", ',', '') AS FLOAT), 
    CAST(REPLACE("25", ',', '') AS FLOAT), 
    CAST(REPLACE("50", ',', '') AS FLOAT), 
    CAST(REPLACE("75", ',', '') AS FLOAT), 
    CAST(REPLACE("80", ',', '') AS FLOAT), 
    CAST(REPLACE("90", ',', '') AS FLOAT), 
    region
FROM survey_benchmark_data.amga_survey_data."amga 2020 survey 2019 data";

--SC
ALTER TABLE "survey_benchmark_data"."sc_survey_data"."sc 2020 survey 2019 data" DROP COLUMN _C15

select *
into "survey_benchmark_data"."final outputs"."sc"
from (SELECT * FROM "survey_benchmark_data"."sc_survey_data"."sc 2020 survey 2019 data"
    union all 
SELECT * FROM "survey_benchmark_data"."sc_survey_data"."sc 2022 survey 2021 data" 
union all
SELECT * FROM "survey_benchmark_data"."sc_survey_data"."sc 2023 survey 2022 data"
union all
SELECT * FROM "survey_benchmark_data"."sc_survey_data"."sc 2024 survey 2023 data"
    )



-- Clean 1: 
alter table "survey_benchmark_data"."final outputs"."amga" RENAME column "specialty name" to "specialty"
alter table "survey_benchmark_data"."final outputs"."amga" RENAME column "provider count" to "count"
alter table "survey_benchmark_data"."final outputs"."amga" DROP column MEAN
alter table "survey_benchmark_data"."final outputs"."amga" DROP column "standard deviation"
alter table "survey_benchmark_data"."final outputs"."amga" DROP column "group count"

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "Metric" = 'Comp per wRVU'
WHERE "Metric" IN ('Comp per wRVU', 'Compensation per wRVU')

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "Metric" = 'Total Compensation'
WHERE "Metric" IN ('Total Compensation', 'Compensation')

ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "21" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "22" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "23" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "24" NUMERIC(10,2);
-- Add columns 26 to 49
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "26" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "27" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "28" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "29" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "30" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "31" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "32" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "33" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "34" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "35" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "36" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "37" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "38" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "39" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "40" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "41" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "42" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "43" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "44" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "45" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "46" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "47" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "48" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "49" NUMERIC(10,2);
-- Add columns 51 to 74
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "51" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "52" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "53" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "54" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "55" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "56" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "57" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "58" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "59" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "60" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "61" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "62" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "63" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "64" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "65" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "66" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "67" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "68" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "69" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "70" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "71" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "72" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "73" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "74" NUMERIC(10,2);
-- Add columns 76 to 89
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "76" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "77" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "78" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "79" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "80" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "81" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "82" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "83" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "84" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "85" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "86" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "87" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "88" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."amga" ADD COLUMN "89" NUMERIC(10,2);


UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "21" = ROUND((COALESCE("25", 0) - COALESCE("20", 0)) / (25 - 20) + COALESCE("20", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "22" = ROUND((COALESCE("25", 0) - COALESCE("20", 0)) / (25 - 20) + COALESCE("21", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "23" = ROUND((COALESCE("25", 0) - COALESCE("20", 0)) / (25 - 20) + COALESCE("22", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "24" = ROUND((COALESCE("25", 0) - COALESCE("20", 0)) / (25 - 20) + COALESCE("23", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "26" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("25", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "27" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("26", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "28" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("27", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "29" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("28", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "30" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("29", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "31" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("30", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "32" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("31", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "33" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("32", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "34" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("33", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "35" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("34", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "36" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("35", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "37" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("36", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "38" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("37", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "39" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("38", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "40" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("39", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "41" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("40", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "42" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("41", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "43" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("42", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "44" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("43", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "45" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("44", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "46" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("45", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "47" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("46", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "48" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("47", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "49" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("48", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "51" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("50", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "52" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("51", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "53" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("52", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "54" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("53", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "55" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("54", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "56" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("55", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "57" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("56", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "58" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("57", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "59" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("58", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "60" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("59", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "61" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("60", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "62" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("61", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "63" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("62", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "64" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("63", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "65" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("64", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "66" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("65", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "67" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("66", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "68" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("67", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "69" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("68", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "70" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("69", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "71" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("70", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "72" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("71", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "73" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("72", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "74" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("73", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "76" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("75", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "77" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("76", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "78" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("77", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "79" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("78", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "80" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("79", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "81" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("80", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "82" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("81", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "83" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("82", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "84" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("83", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "85" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("84", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "86" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("85", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "87" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("86", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "88" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("87", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET "89" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("88", 0), 2);

UPDATE "survey_benchmark_data"."final outputs"."amga"
SET specialty = 'Cardiology - Advanced Heart Failure and Transplant'
WHERE specialty = 'Advanced Heart Failure and Transplant Cardiology';

--pivot 4
SELECT * INTO "survey_benchmark_data"."final outputs"."amga_pivot"
FROM (
    SELECT survey, "survey year", "data year", specialty, region, metric, count,
        COALESCE("20", 0) AS "20",
        COALESCE("21", 0) AS "21",
        COALESCE("22", 0) AS "22",
        COALESCE("23", 0) AS "23",
        COALESCE("24", 0) AS "24",
        COALESCE("25", 0) AS "25",
        COALESCE("26", 0) AS "26",
        COALESCE("27", 0) AS "27",
        COALESCE("28", 0) AS "28",
        COALESCE("29", 0) AS "29",
        COALESCE("30", 0) AS "30",
        COALESCE("31", 0) AS "31",
        COALESCE("32", 0) AS "32",
        COALESCE("33", 0) AS "33",
        COALESCE("34", 0) AS "34",
        COALESCE("35", 0) AS "35",
        COALESCE("36", 0) AS "36",
        COALESCE("37", 0) AS "37",
        COALESCE("38", 0) AS "38",
        COALESCE("39", 0) AS "39",
        COALESCE("40", 0) AS "40",
        COALESCE("41", 0) AS "41",
        COALESCE("42", 0) AS "42",
        COALESCE("43", 0) AS "43",
        COALESCE("44", 0) AS "44",
        COALESCE("45", 0) AS "45",
        COALESCE("46", 0) AS "46",
        COALESCE("47", 0) AS "47",
        COALESCE("48", 0) AS "48",
        COALESCE("49", 0) AS "49",
        COALESCE("50", 0) AS "50",
        COALESCE("51", 0) AS "51",
        COALESCE("52", 0) AS "52",
        COALESCE("53", 0) AS "53",
        COALESCE("54", 0) AS "54",
        COALESCE("55", 0) AS "55",
        COALESCE("56", 0) AS "56",
        COALESCE("57", 0) AS "57",
        COALESCE("58", 0) AS "58",
        COALESCE("59", 0) AS "59",
        COALESCE("60", 0) AS "60",
        COALESCE("61", 0) AS "61",
        COALESCE("62", 0) AS "62",
        COALESCE("63", 0) AS "63",
        COALESCE("64", 0) AS "64",
        COALESCE("65", 0) AS "65",
        COALESCE("66", 0) AS "66",
        COALESCE("67", 0) AS "67",
        COALESCE("68", 0) AS "68",
        COALESCE("69", 0) AS "69",
        COALESCE("70", 0) AS "70",
        COALESCE("71", 0) AS "71",
        COALESCE("72", 0) AS "72",
        COALESCE("73", 0) AS "73",
        COALESCE("74", 0) AS "74",
        COALESCE("75", 0) AS "75",
        COALESCE("76", 0) AS "76",
        COALESCE("77", 0) AS "77",
        COALESCE("78", 0) AS "78",
        COALESCE("79", 0) AS "79",
        COALESCE("80", 0) AS "80",
        COALESCE("81", 0) AS "81",
        COALESCE("82", 0) AS "82",
        COALESCE("83", 0) AS "83",
        COALESCE("84", 0) AS "84",
        COALESCE("85", 0) AS "85",
        COALESCE("86", 0) AS "86",
        COALESCE("87", 0) AS "87",
        COALESCE("88", 0) AS "88",
        COALESCE("89", 0) AS "89",
        COALESCE("90", 0) AS "90"
    FROM "survey_benchmark_data"."final outputs"."amga"
) t
UNPIVOT (
    value FOR percentile IN (
        "20", "21", "22", "23", "24", "25", "26", "27", "28", "29",
        "30", "31", "32", "33", "34", "35", "36", "37", "38", "39",
        "40", "41", "42", "43", "44", "45", "46", "47", "48", "49",
        "50", "51", "52", "53", "54", "55", "56", "57", "58", "59",
        "60", "61", "62", "63", "64", "65", "66", "67", "68", "69",
        "70", "71", "72", "73", "74", "75", "76", "77", "78", "79",
        "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90"
    )
);


-- Clean 2: 
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" RENAME COLUMN "JOB OR SPECIALTY" TO SPECIALTY;
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" RENAME COLUMN "VARIABLE" TO Metric;

UPDATE "survey_benchmark_data"."final outputs"."sc"
SET "Level" = CASE 
              WHEN "Level" NOT IN ('APP', 'n/a', 'Staff APP', 'Staff Physician') THEN NULL
              ELSE "Level"
             END;

DELETE FROM "survey_benchmark_data"."final outputs"."sc"
WHERE "Level" IS NULL;

ALTER TABLE "survey_benchmark_data"."final outputs"."sc" DROP COLUMN "n orgs";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" RENAME COLUMN "n incumbents" TO "count";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" DROP COLUMN MEAN;
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" DROP COLUMN LEVEL;
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" RENAME COLUMN "cut" TO region;

DELETE FROM "survey_benchmark_data"."final outputs"."sc" 
WHERE (Region = 'Great Lakes Subregion' OR Region = 'Hospital or Medical Center' OR Region = 'Medical Group');

-- Clean 3: 
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma" RENAME COLUMN "provider specialty" to specialty;
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma" DROP COLUMN mean;
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma" RENAME COLUMN "ind count" to count;
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma" DROP COLUMN metric1;
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma" DROP COLUMN survey1;
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma" DROP COLUMN "survey year1";
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma" DROP COLUMN "data year1";
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma" DROP COLUMN "provider specialty1";
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma" DROP COLUMN "region1";
ALTER TABLE "survey_benchmark_data"."final outputs"."mgma" DROP COLUMN "ind count1";

--Union 1
SELECT 
    survey,
    CAST("survey year" AS VARCHAR) AS "survey year",
    CAST("data year" AS VARCHAR) AS "data year",
    specialty,
    region,
    metric,
    CAST(REPLACE("count", ',', '') AS NUMERIC) AS "count",
    "percentile",
    CAST(REPLACE("value", ',', '') AS DECIMAL(10,2)) AS "value"
INTO "survey_benchmark_data"."final outputs".survey_union
FROM "survey_benchmark_data"."final outputs"."amga_pivot"

UNION ALL

SELECT 
    survey,
    "survey year",
    "data year",
    specialty,
    region,
    metric,
    CAST(REPLACE("count", ',', '') AS NUMERIC) AS "count",
    "percentile",
    CAST(REPLACE("value", ',', '') AS DECIMAL(10,2)) AS "value"
FROM "survey_benchmark_data"."final outputs"."mgma_pivot"

UNION ALL

SELECT 
    survey,
    "survey year",
    "data year",
    specialty,
    region,
    metric,
    CAST(REPLACE("count", ',', '') AS NUMERIC) AS "count",
    "percentile",
    CAST(REPLACE("value", ',', '') AS DECIMAL(10,2)) AS "value"
FROM "survey_benchmark_data"."final outputs"."sc_pivot"

UNION ALL

SELECT 
    survey,
    "survey year",
    "data year",
    specialty,
    region,
    metric,
    CAST(REPLACE("count", ',', '') AS NUMERIC) AS "count",
    "percentile",
    CAST(REPLACE("value", ',', '') AS DECIMAL(10,2)) AS "value"
FROM "survey_benchmark_data"."others"."archived provider survey data- national only";


-- Clean 4: 
UPDATE  "survey_benchmark_data"."final outputs"."survey_union"
SET "Metric" = 'Comp per wRVU'
WHERE "Metric" IN ('Comp per wRVU', 'Compensation per wRVU', 'Compensation to wRVU ratio', 'TCC per Work RVU', 'TCC per Work RVU(2021 PFS)');

UPDATE  "survey_benchmark_data"."final outputs"."survey_union"
SET "Metric" = 'Total Compensation'
WHERE "Metric" IN ('Total Compensation', 'Compensation', 'TCC');

UPDATE  "survey_benchmark_data"."final outputs"."survey_union"
SET "Survey" = 'wRVUs'
WHERE "Survey" IN ('Work RVUs', 'wRVUs', 'Work RVUs(2021 PFS)');

-- Step 1: Add the new column to the existing table
ALTER TABLE "survey_benchmark_data"."final outputs".survey_union ADD COLUMN "Survey For Common Name" VARCHAR(255);

-- Step 2: Update the new column with the calculated values
UPDATE "survey_benchmark_data"."final outputs".survey_union
SET "Survey For Common Name" = 
    CASE 
        WHEN survey = 'Sullivan Cotter (Covid Adjusted)' THEN 'Sullivan Cotter'
        ELSE survey
    END;

--Clean 6



-- JOIN 1: 
SELECT su.*, cs."common specialty", cs."survey specialty" 
INTO "survey_benchmark_data"."final outputs".survey_join
FROM "survey_benchmark_data"."final outputs".survey_union su
LEFT JOIN "survey_benchmark_data"."others"."common specialty - 2024" cs ON su.specialty = cs."survey specialty" 
AND su."Survey For Common Name" = cs."survey";

-- Clean 5: 
select *
into "survey_benchmark_data"."final outputs".combined
from "survey_benchmark_data"."final outputs".survey_join;

ALTER table "survey_benchmark_data"."final outputs".combined drop column specialty;

--Clean 7
SELECT *
INTO "survey_benchmark_data"."final outputs".MGMA_narrow
FROM "survey_benchmark_data"."final outputs".survey_join
WHERE "Survey Year" = '2024' AND Survey = 'MGMA';

DELETE FROM "survey_benchmark_data"."final outputs".MGMA_narrow
WHERE specialty IS NULL;
DELETE FROM "survey_benchmark_data"."final outputs".MGMA_narrow
WHERE region != 'National';

ALTER table "survey_benchmark_data"."final outputs".MGMA_narrow drop column specialty;
ALTER table "survey_benchmark_data"."final outputs".MGMA_narrow drop column "Survey Year";
ALTER table "survey_benchmark_data"."final outputs".MGMA_narrow drop column Survey;
ALTER table "survey_benchmark_data"."final outputs".MGMA_narrow drop column "data year";
ALTER table "survey_benchmark_data"."final outputs".MGMA_narrow drop column "common specialty";
ALTER table "survey_benchmark_data"."final outputs".MGMA_narrow rename column "survey specialty" to specialty;
ALTER table "survey_benchmark_data"."final outputs".MGMA_narrow rename column value to "Value Lower";
ALTER table "survey_benchmark_data"."final outputs".MGMA_narrow drop column region;
ALTER table "survey_benchmark_data"."final outputs".MGMA_narrow drop column "count";

DELETE FROM "survey_benchmark_data"."final outputs".MGMA_narrow
WHERE "Value Lower" IS NULL;

-- Clean 8: 
UPDATE "survey_benchmark_data"."others"."archived provider survey data- national only"
SET "Survey" = 'Sullivan Cotter'
WHERE "Survey" IN ('Sulivan Cotter', 'Sullivan Cotter');

-- Clean 9: 
SELECT *
INTO "survey_benchmark_data"."final outputs".Output
FROM "survey_benchmark_data"."final outputs".survey_join
WHERE "Survey For Common Name" = 'AMGA' AND "Survey Year" = '2024' AND REGION = 'National' AND SPECIALTY IS NOT NULL AND VALUE IS NOT NULL;

ALTER table "survey_benchmark_data"."final outputs".Output drop column specialty;
ALTER table "survey_benchmark_data"."final outputs".Output drop column "Survey Year";
ALTER table "survey_benchmark_data"."final outputs".Output drop column Survey;
ALTER table "survey_benchmark_data"."final outputs".Output drop column "data year";
ALTER table "survey_benchmark_data"."final outputs".Output drop column "common specialty";
ALTER table "survey_benchmark_data"."final outputs".Output rename column "survey specialty" to specialty;
ALTER table "survey_benchmark_data"."final outputs".Output rename column value to "Value Lower";
ALTER table "survey_benchmark_data"."final outputs".Output drop column region;
ALTER table "survey_benchmark_data"."final outputs".Output drop column "count";

--No Common specialty
SELECT "Survey For Common Name", "Survey Year", specialty, "common specialty"
INTO "survey_benchmark_data"."final outputs".mismatch_Output
FROM "survey_benchmark_data"."final outputs".survey_join
WHERE "common specialty" IS NULL;


-- Clean 10: 
ALTER TABLE "survey_benchmark_data"."sc_survey_data"."sc 2022 survey 2021 data" RENAME COLUMN "10th percentile" TO "10th";
ALTER TABLE "survey_benchmark_data"."sc_survey_data"."sc 2022 survey 2021 data" RENAME COLUMN "25th percentile" TO "25th";
ALTER TABLE "survey_benchmark_data"."sc_survey_data"."sc 2022 survey 2021 data" RENAME COLUMN "75th percentile" TO "75th";
ALTER TABLE "survey_benchmark_data"."sc_survey_data"."sc 2022 survey 2021 data" RENAME COLUMN "90th percentile" TO "90th";
ALTER TABLE "survey_benchmark_data"."sc_survey_data"."sc 2022 survey 2021 data" RENAME COLUMN "Median" TO "50th";
UPDATE "survey_benchmark_data"."sc_survey_data"."sc 2022 survey 2021 data"
SET "Survey" = 'Sullivan Cotter'
WHERE "Survey" IN ('Sulivan Cotter', 'Sullivan Cotter');

-- Clean 11: 
ALTER TABLE "survey_benchmark_data"."amga_survey_data"."amga 2022 survey 2021 data" RENAME COLUMN stddev TO "standard deviation";

-- Clean 12: 

-- Clean 13: 
ALTER TABLE  "survey_benchmark_data"."amga_survey_data"."amga 2023 survey 2022 data" RENAME COLUMN stddev TO "standard deviation";

-- Clean 14: 

-- Clean 15: 

-- Clean 16: 
ALTER TABLE "survey_benchmark_data"."sc_survey_data"."sc 2023 survey 2022 data" RENAME COLUMN "10th percentile" TO "10th";
ALTER TABLE "survey_benchmark_data"."sc_survey_data"."sc 2023 survey 2022 data" RENAME COLUMN "25th percentile" TO "25th";
ALTER TABLE "survey_benchmark_data"."sc_survey_data"."sc 2023 survey 2022 data" RENAME COLUMN "75th percentile" TO "75th";
ALTER TABLE "survey_benchmark_data"."sc_survey_data"."sc 2023 survey 2022 data" RENAME COLUMN "90th percentile" TO "90th";
ALTER TABLE "survey_benchmark_data"."sc_survey_data"."sc 2023 survey 2022 data" RENAME COLUMN "Median" TO "50th";



-- Clean 17: 

ALTER TABLE "survey_benchmark_data"."final outputs"."sc" RENAME COLUMN "10th" TO "10";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" RENAME COLUMN "25th" TO "25";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" RENAME COLUMN "50th" TO "50";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" RENAME COLUMN "75th" TO "75";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" RENAME COLUMN "90th" TO "90";

UPDATE "survey_benchmark_data"."final outputs"."sc"
SET "10" = CASE
    WHEN "10" ~ '^[0-9]+(\.[0-9]+)?$' THEN "10"::NUMERIC
    ELSE NULL
END;

UPDATE "survey_benchmark_data"."final outputs"."sc"
SET "25" = CASE
    WHEN "25" ~ '^[0-9]+(\.[0-9]+)?$' THEN "25"::NUMERIC
    ELSE NULL
END,
"50" = CASE
    WHEN "50" ~ '^[0-9]+(\.[0-9]+)?$' THEN "50"::NUMERIC
    ELSE NULL
END,
"75" = CASE
    WHEN "75" ~ '^[0-9]+(\.[0-9]+)?$' THEN "75"::NUMERIC
    ELSE NULL
END,
"90" = CASE
    WHEN "90" ~ '^[0-9]+(\.[0-9]+)?$' THEN "90"::NUMERIC
    ELSE NULL
END;

UPDATE "survey_benchmark_data"."final outputs"."sc"
SET "10" = CAST("10" AS NUMERIC(10,2));
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
ADD COLUMN "10_new" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
DROP COLUMN "10";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
RENAME COLUMN "10_new" TO "10";

ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
ADD COLUMN "25_new" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
ADD COLUMN "50_new" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
ADD COLUMN "75_new" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
ADD COLUMN "90_new" NUMERIC(10,2);

UPDATE "survey_benchmark_data"."final outputs"."sc"
SET "25_new" = CAST("25" AS NUMERIC(10,2)),
    "50_new" = CAST("50" AS NUMERIC(10,2)),
    "75_new" = CAST("75" AS NUMERIC(10,2)),
    "90_new" = CAST("90" AS NUMERIC(10,2));

ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
DROP COLUMN "25";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
DROP COLUMN "50";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
DROP COLUMN "75";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
DROP COLUMN "90";

ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
RENAME COLUMN "25_new" TO "25";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
RENAME COLUMN "50_new" TO "50";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
RENAME COLUMN "75_new" TO "75";
ALTER TABLE "survey_benchmark_data"."final outputs"."sc"
RENAME COLUMN "90_new" TO "90";


-- Add columns 21 to 89 (excluding 25, 50, and 75)
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "11" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "12" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "13" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "14" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "15" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "16" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "17" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "18" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "19" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "20" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "21" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "22" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "23" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "24" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "26" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "27" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "28" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "29" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "30" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "31" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "32" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "33" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "34" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "35" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "36" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "37" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "38" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "39" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "40" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "41" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "42" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "43" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "44" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "45" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "46" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "47" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "48" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "49" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "51" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "52" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "53" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "54" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "55" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "56" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "57" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "58" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "59" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "60" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "61" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "62" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "63" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "64" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "65" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "66" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "67" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "68" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "69" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "70" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "71" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "72" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "73" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "74" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "76" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "77" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "78" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "79" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "80" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "81" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "82" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "83" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "84" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "85" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "86" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "87" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "88" NUMERIC(10,2);
ALTER TABLE "survey_benchmark_data"."final outputs"."sc" ADD COLUMN "89" NUMERIC(10,2);

-- Update columns 21 to 89 (excluding 25, 50, and 75)
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "11" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("10", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "12" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("11", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "13" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("12", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "14" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("13", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "15" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("14", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "16" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("15", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "17" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("16", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "18" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("17", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "19" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("18", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "20" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("19", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "21" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("20", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "22" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("21", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "23" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("22", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "24" = ROUND((COALESCE("25", 0) - COALESCE("10", 0)) / (25 - 10) + COALESCE("23", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "26" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("25", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "27" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("26", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "28" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("27", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "29" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("28", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "30" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("29", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "31" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("30", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "32" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("31", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "33" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("32", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "34" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("33", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "35" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("34", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "36" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("35", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "37" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("36", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "38" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("37", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "39" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("38", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "40" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("39", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "41" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("40", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "42" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("41", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "43" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("42", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "44" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("43", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "45" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("44", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "46" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("45", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "47" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("46", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "48" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("47", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "49" = ROUND((COALESCE("50", 0) - COALESCE("25", 0)) / (50 - 25) + COALESCE("48", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "51" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("50", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "52" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("51", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "53" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("52", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "54" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("53", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "55" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("54", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "56" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("55", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "57" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("56", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "58" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("57", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "59" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("58", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "60" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("59", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "61" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("60", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "62" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("61", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "63" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("62", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "64" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("63", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "65" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("64", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "66" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("65", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "67" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("66", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "68" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("67", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "69" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("68", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "70" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("69", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "71" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("70", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "72" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("71", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "73" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("72", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "74" = ROUND((COALESCE("75", 0) - COALESCE("50", 0)) / (75 - 50) + COALESCE("73", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "76" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("75", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "77" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("76", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "78" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("77", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "79" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("78", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "80" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("79", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "81" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("80", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "82" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("81", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "83" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("82", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "84" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("83", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "85" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("84", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "86" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("85", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "87" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("86", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "88" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("87", 0), 2);
UPDATE "survey_benchmark_data"."final outputs"."sc" SET "89" = ROUND((COALESCE("90", 0) - COALESCE("75", 0)) / (90 - 75) + COALESCE("88", 0), 2);


--pivot 2
SELECT *
INTO "survey_benchmark_data"."final outputs"."sc_pivot"
FROM "survey_benchmark_data"."final outputs"."sc"
UNPIVOT (value FOR percentile IN ("10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", 
"34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", 
"64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90"));

SELECT * INTO "survey_benchmark_data"."final outputs"."sc_pivot"
FROM (
    SELECT survey, "survey year", "data year", specialty, region, metric, count,
        COALESCE("10", 0) AS "10",
        COALESCE("11", 0) AS "11",
        COALESCE("12", 0) AS "12",
        COALESCE("13", 0) AS "13",
        COALESCE("14", 0) AS "14",
        COALESCE("15", 0) AS "15",
        COALESCE("16", 0) AS "16",
        COALESCE("17", 0) AS "17",
        COALESCE("18", 0) AS "18",
        COALESCE("19", 0) AS "19",
        COALESCE("20", 0) AS "20",
        COALESCE("21", 0) AS "21",
        COALESCE("22", 0) AS "22",
        COALESCE("23", 0) AS "23",
        COALESCE("24", 0) AS "24",
        COALESCE("25", 0) AS "25",
        COALESCE("26", 0) AS "26",
        COALESCE("27", 0) AS "27",
        COALESCE("28", 0) AS "28",
        COALESCE("29", 0) AS "29",
        COALESCE("30", 0) AS "30",
        COALESCE("31", 0) AS "31",
        COALESCE("32", 0) AS "32",
        COALESCE("33", 0) AS "33",
        COALESCE("34", 0) AS "34",
        COALESCE("35", 0) AS "35",
        COALESCE("36", 0) AS "36",
        COALESCE("37", 0) AS "37",
        COALESCE("38", 0) AS "38",
        COALESCE("39", 0) AS "39",
        COALESCE("40", 0) AS "40",
        COALESCE("41", 0) AS "41",
        COALESCE("42", 0) AS "42",
        COALESCE("43", 0) AS "43",
        COALESCE("44", 0) AS "44",
        COALESCE("45", 0) AS "45",
        COALESCE("46", 0) AS "46",
        COALESCE("47", 0) AS "47",
        COALESCE("48", 0) AS "48",
        COALESCE("49", 0) AS "49",
        COALESCE("50", 0) AS "50",
        COALESCE("51", 0) AS "51",
        COALESCE("52", 0) AS "52",
        COALESCE("53", 0) AS "53",
        COALESCE("54", 0) AS "54",
        COALESCE("55", 0) AS "55",
        COALESCE("56", 0) AS "56",
        COALESCE("57", 0) AS "57",
        COALESCE("58", 0) AS "58",
        COALESCE("59", 0) AS "59",
        COALESCE("60", 0) AS "60",
        COALESCE("61", 0) AS "61",
        COALESCE("62", 0) AS "62",
        COALESCE("63", 0) AS "63",
        COALESCE("64", 0) AS "64",
        COALESCE("65", 0) AS "65",
        COALESCE("66", 0) AS "66",
        COALESCE("67", 0) AS "67",
        COALESCE("68", 0) AS "68",
        COALESCE("69", 0) AS "69",
        COALESCE("70", 0) AS "70",
        COALESCE("71", 0) AS "71",
        COALESCE("72", 0) AS "72",
        COALESCE("73", 0) AS "73",
        COALESCE("74", 0) AS "74",
        COALESCE("75", 0) AS "75",
        COALESCE("76", 0) AS "76",
        COALESCE("77", 0) AS "77",
        COALESCE("78", 0) AS "78",
        COALESCE("79", 0) AS "79",
        COALESCE("80", 0) AS "80",
        COALESCE("81", 0) AS "81",
        COALESCE("82", 0) AS "82",
        COALESCE("83", 0) AS "83",
        COALESCE("84", 0) AS "84",
        COALESCE("85", 0) AS "85",
        COALESCE("86", 0) AS "86",
        COALESCE("87", 0) AS "87",
        COALESCE("88", 0) AS "88",
        COALESCE("89", 0) AS "89",
        COALESCE("90", 0) AS "90"
    FROM "survey_benchmark_data"."final outputs"."sc"
) t
UNPIVOT (
    value FOR percentile IN (
        "10", "11", "12", "13", "14", "15", "16", "17", "18", "19",
        "20", "21", "22", "23", "24", "25", "26", "27", "28", "29",
        "30", "31", "32", "33", "34", "35", "36", "37", "38", "39",
        "40", "41", "42", "43", "44", "45", "46", "47", "48", "49",
        "50", "51", "52", "53", "54", "55", "56", "57", "58", "59",
        "60", "61", "62", "63", "64", "65", "66", "67", "68", "69",
        "70", "71", "72", "73", "74", "75", "76", "77", "78", "79",
        "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90"
    )
);