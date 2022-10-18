WITH program_element_awards AS (
    SELECT award_id,
           {{ dbt_utils.surrogate_key(['award_id']) }} AS award_key,
           code,
           {{ dbt_utils.surrogate_key(['code']) }} AS program_element_key
      FROM {{ source('raw_grants', 'program_element_awards') }}
     WHERE award_id IN (SELECT award_id
                          FROM {{ source('raw_grants', 'awards') }} ) AND
           code IN (SELECT code
                      FROM {{ source('raw_grants', 'program_element') }} )
)

SELECT award_id,
       award_key,
       code,
       program_element_key
  FROM program_element_awards