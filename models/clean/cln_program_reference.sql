WITH program_reference AS (
    SELECT code,
           {{ dbt_utils.surrogate_key(['code']) }} AS program_reference_key,
           text AS desc
      FROM {{ source('raw_grants', 'program_reference') }}
)

SELECT code,
       program_reference_key,
       desc
  FROM program_reference