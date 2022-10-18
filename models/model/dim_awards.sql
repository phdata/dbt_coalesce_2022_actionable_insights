WITH awards AS (
    SELECT award_key,
           award_title,
           award_instrument,
           program_officer,
           abstract_narration
      FROM {{ ref('cln_awards') }}
)

SELECT *
  FROM awards