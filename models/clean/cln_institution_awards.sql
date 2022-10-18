WITH institution_awards AS (
    SELECT award_id,
           {{ dbt_utils.surrogate_key(['award_id']) }} AS award_key,
           name,
           zipcode AS zip_code,
           {{ dbt_utils.surrogate_key(['name', 'zipcode']) }} AS institution_key
      FROM {{ source('raw_grants', 'institution_awards') }}
     WHERE award_id IN (SELECT award_id
                          FROM {{ source('raw_grants', 'awards') }} ) AND
           (name, zipcode) IN (SELECT name,
                                      zipcode
                                 FROM {{ source('raw_grants', 'institution') }} )
)

SELECT *
  FROM institution_awards