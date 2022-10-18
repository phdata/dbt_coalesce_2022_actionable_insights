WITH program_reference_awards AS (
    SELECT award_id,
           {{ dbt_utils.surrogate_key(['award_id']) }} AS award_key,
           code,
           {{ dbt_utils.surrogate_key(['code']) }} AS program_reference_key
      FROM {{ source('raw_grants', 'program_reference_awards') }}
     WHERE award_id IN (SELECT award_id
                          FROM {{ source('raw_grants', 'awards') }} ) AND
           code IN (SELECT code
                      FROM {{ source('raw_grants', 'program_reference') }} )
)

SELECT award_id,
       award_key,
       code,
       program_reference_key
  FROM program_reference_awards