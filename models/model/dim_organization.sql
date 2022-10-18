WITH organization AS (
    SELECT organization_key,
           division,
           directorate
      FROM {{ ref('cln_organization') }}
)

SELECT *
  FROM organization