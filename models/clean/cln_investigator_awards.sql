WITH investigator_awards AS (
    SELECT award_id,
           {{ dbt_utils.surrogate_key(['award_id']) }} AS award_key,
           email_id,
           {{ dbt_utils.surrogate_key(['email_id']) }} AS investigator_key,
           DECODE(start_date, '', NULL, TO_DATE(start_date, 'MM/DD/YYYY')) AS start_date,
           DECODE(end_date, '', NULL, TO_DATE(end_date, 'MM/DD/YYYY')) AS end_date,
           role_code
      FROM {{ source('raw_grants', 'investigator_awards') }}
     WHERE award_id IN (SELECT award_id
                          FROM {{ source('raw_grants', 'awards') }} ) AND
           email_id IN (SELECT email_id
                          FROM {{ source('raw_grants', 'investigator') }} )
)

SELECT *
  FROM investigator_awards