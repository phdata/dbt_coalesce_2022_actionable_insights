WITH foa_info AS (
    SELECT code,
           {{ dbt_utils.surrogate_key(['code']) }} AS foa_info_key,
           name
      FROM {{ source('raw_grants', 'foa_info') }}
)

SELECT code,
       foa_info_key,
       name
  FROM foa_info