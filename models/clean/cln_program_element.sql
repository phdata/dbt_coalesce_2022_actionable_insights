WITH program_element AS (
    SELECT code,
           {{ dbt_utils.surrogate_key(['code']) }} AS program_element_key,
           text AS desc
      FROM {{ source('raw_grants', 'program_element') }}
)

SELECT code,
       program_element_key,
       desc
  FROM program_element