WITH institution AS (
    SELECT institution_key,
           name,
           address,
           city,
           zip_code,
           state,
           state_code,
           country,
           phone_number
      FROM {{ ref('cln_institution') }}
)

SELECT *
  FROM institution