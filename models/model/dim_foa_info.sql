WITH foa_info AS (
    SELECT foa_info_key,
           name
      FROM {{ ref('cln_foa_info') }}
)

SELECT *
  FROM foa_info