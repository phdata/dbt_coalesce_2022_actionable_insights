WITH dates AS (
    SELECT *
      FROM {{ ref('cln_dates') }}
)

SELECT *
  FROM dates