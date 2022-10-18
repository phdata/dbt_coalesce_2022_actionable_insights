WITH institution AS (
    SELECT name,
           zipcode AS zip_code,
           {{ dbt_utils.surrogate_key(['name', 'zipcode']) }} AS institution_key,
           TRIM(address) AS address,
           city_name AS city,
           state_name AS state,
           state_code AS state_code,
           country_name AS country,
           REGEXP_REPLACE(contact, '([[:digit:]]{3})([[:digit:]]{3})([[:digit:]]{4})', '(\\1) \\2-\\3') phone_number
      FROM {{ source('raw_grants', 'institution') }}
)

SELECT name,
       zip_code,
       institution_key,
       address,
       city,
       state,
       state_code,
       country,
       DECODE(phone_number,'0',NULL,phone_number) AS phone_number
  FROM institution