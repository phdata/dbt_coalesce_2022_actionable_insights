WITH foa_info_awards AS (
    SELECT award_id,
           {{ dbt_utils.surrogate_key(['award_id']) }} AS award_key,
           code,
           {{ dbt_utils.surrogate_key(['code']) }} AS foa_info_key
      FROM {{ source('raw_grants', 'foa_info_awards') }}
     WHERE award_id IN (SELECT award_id
                          FROM {{ source('raw_grants', 'awards') }} ) AND
           code IN (SELECT code
                      FROM {{ source('raw_grants', 'foa_info') }})
)

SELECT award_id,
       award_key,
       code,
       foa_info_key
  FROM foa_info_awards