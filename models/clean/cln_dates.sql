WITH dates AS (
{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('1900-01-01' as date)",
    end_date="cast('2026-09-30' as date)"
   )
}}
)

SELECT date_day,
       YEAR(date_day) AS year,
       'Q' || QUARTER(date_day) AS quarter,
       MONTH(date_day) AS month,
       MONTHNAME(date_day) AS month_name,
       WEEK(date_day) AS week,
       DAY(date_day) AS day,
       DAYNAME(date_day) AS day_name
  FROM dates