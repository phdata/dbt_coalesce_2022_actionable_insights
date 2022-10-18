WITH awards AS (
    SELECT *
      FROM {{ ref('cln_awards') }}
),

institution_awards AS (
    SELECT *
      FROM {{ ref('cln_institution_awards') }}
),

program_element AS (
    SELECT *
      FROM {{ ref('cln_program_element_awards') }}
),

foa_info AS (
    SELECT *
      FROM {{ ref('cln_foa_info_awards') }}
),

program_reference AS (
    SELECT *
      FROM {{ ref('cln_program_reference_awards') }}
)

SELECT {{ dbt_utils.surrogate_key(['awards.award_key', 'institution_awards.institution_key', 'program_element_key', 'organization_key', 'foa_info_key', 'program_reference_key']) }} AS fct_award_key,
       awards.award_key,
       institution_awards.institution_key,
       organization_key,
       program_element_key,
       foa_info_key,
       program_reference_key,
       arra_amount,
       award_amount,
       award_effective_date,
       award_expiration_date,
       min_amd_letter_date,
       max_amd_letter_date
  FROM awards
  LEFT JOIN institution_awards
    ON awards.award_key = institution_awards.award_key
  LEFT JOIN program_element
    ON awards.award_key = program_element.award_key
  LEFT JOIN foa_info
    ON awards.award_key = foa_info.award_key
  LEFT JOIN program_reference
    ON awards.award_key = program_reference.award_key