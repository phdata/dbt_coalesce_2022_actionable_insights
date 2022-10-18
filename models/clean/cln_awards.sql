WITH awards AS (
    SELECT award_title,
           DECODE(award_effective_date, '', NULL, TO_DATE(award_effective_date, 'MM/DD/YYYY')) AS award_effective_date,
           DECODE(award_expiration_date, '', NULL, TO_DATE(award_expiration_date, 'MM/DD/YYYY')) AS award_expiration_date,
           award_amount,
           award_instrument,
           organisation_code,
           program_officer,
           abstract_narration,
           DECODE(min_amd_letter_date, '', NULL, TO_DATE(min_amd_letter_date, 'MM/DD/YYYY')) AS min_amd_letter_date,
           DECODE(max_amd_letter_date, '', NULL, TO_DATE(max_amd_letter_date, 'MM/DD/YYYY')) AS max_amd_letter_date,
           arra_amount,
           award_id,
           {{ dbt_utils.surrogate_key(['award_id']) }} AS award_key,
           {{ dbt_utils.surrogate_key(['organisation_code']) }} AS organization_key
      FROM {{ source('raw_grants', 'awards')}}
)

SELECT *
  FROM awards