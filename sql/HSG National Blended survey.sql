-- ===============================================
-- 🏥 Unified Provider Compensation Benchmarking
-- 📄 File: HSG National Blended survey.sql
-- 📌 Purpose: Compute weighted average compensation across MGMA, AMGA, SC
-- 📅 Year: 2024 only
-- 👤 Author: Nisaharan Genhatharan
-- ===============================================

-- ============================================================
-- 🧩 Step 1: Weighted Averages Within Each Survey Group
-- ------------------------------------------------------------
-- For each survey (e.g., MGMA, AMGA), compute weighted averages
-- grouped by specialty and percentile using individual counts
-- ============================================================

WITH CTE AS (
    SELECT 
        CAST('weighted average - all' AS TEXT) AS "survey",
        "survey year",
        "data year",
        "region",
        "metric",
        SUM("count") AS "count",
        "percentile",
        CAST('weighted average - all' AS TEXT) AS "survey for common name",
        "common specialty",
        "survey specialty",
        SUM("count" * "value") / NULLIF(SUM("count"), 0) AS "weighted_average"
    FROM 
        "survey_benchmark_data"."final outputs"."combined provider survey data - 2024 all percentiles"
    WHERE 
        "survey year" = 2024
        AND "survey" IN ('MGMA', 'AMGA', 'Sullivan Cotter', 'Sullivan Cotter (Covid Adjusted)')
        AND "region" = 'National'
    GROUP BY 
        "survey year",
        "data year",
        "region",
        "metric",
        "percentile", 
        "survey for common name",
        "common specialty",
        "survey specialty",
        survey
),

-- ============================================================
-- 🧩 Step 2: Final Blend Across All Survey Types
-- ------------------------------------------------------------
-- Combines weighted averages across surveys into a single view
-- For each specialty and percentile, performs second-level
-- weighted averaging by total count across sources
-- ============================================================

CTE2 AS (
    SELECT 
        "survey",
        "survey year",
        "data year",
        "region",
        "metric",
        SUM("count") AS "count",
        "percentile",
        "survey for common name",
        "common specialty",
        "survey specialty",
        SUM("count" * "weighted_average") / NULLIF(SUM("count"), 0) AS "weighted_average"
    FROM 
        CTE
    GROUP BY 
        "survey year",
        "data year",
        "region",
        "metric",
        "percentile", 
        "survey for common name",
        "common specialty",
        "survey specialty",
        survey
)

-- ============================================================
-- 🧩 Step 3: Output Union of Raw Weighted and Blended Results
-- ------------------------------------------------------------
-- Final export includes:
-- - Raw weighted averages from original data
-- - Final blended weighted output from CTE2
-- ============================================================

SELECT 
    "survey",
    "survey year",
    "data year",
    "region",
    "metric",
    "count",
    "percentile",  
    "survey for common name",
    "common specialty",
    "survey specialty",
    SUM("count" * "value") / NULLIF(SUM("count"), 0) AS "weighted_average"
FROM 
    "survey_benchmark_data"."final outputs"."combined provider survey data - 2024 all percentiles"
WHERE 
    "survey year" = 2024
    AND "survey" IN ('MGMA', 'AMGA', 'Sullivan Cotter', 'Sullivan Cotter (Covid Adjusted)')
    AND "region" = 'National'
GROUP BY 
    "survey",
    "survey year",
    "data year",
    "region",
    "metric",
    "count",
    "percentile", 
    "survey for common name",
    "common specialty",
    "survey specialty"

UNION ALL

SELECT * FROM CTE2;

-- ============================================================
-- ✅ End of File
-- ============================================================
