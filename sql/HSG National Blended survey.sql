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

SELECT * FROM CTE2