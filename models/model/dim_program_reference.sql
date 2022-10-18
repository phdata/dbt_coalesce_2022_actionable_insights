WITH program_reference AS (
    SELECT program_reference_key,
           desc
      FROM {{ ref('cln_program_reference') }}
)

SELECT *
  FROM program_reference