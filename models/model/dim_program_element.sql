WITH program_element AS (
    SELECT program_element_key,
           desc
      FROM {{ ref('cln_program_element') }}
)

SELECT *
  FROM program_element