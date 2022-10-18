WITH investigator AS (
    SELECT email_id,
           {{ dbt_utils.surrogate_key(['email_id']) }} AS investigator_id,
           first_name,
           last_name
      FROM {{ source('raw_grants', 'investigator') }}
)

SELECT email_id,
       first_name,
       last_name
  FROM investigator