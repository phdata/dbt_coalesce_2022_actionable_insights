WITH organization AS (
    SELECT code,
           {{ dbt_utils.surrogate_key(['code']) }} AS organization_key,
           division,
           directorate
      FROM {{ source('raw_grants', 'organization') }}
)

SELECT code,
       organization_key,
       division,
       directorate
  FROM organization