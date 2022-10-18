SELECT source_execution_id,
       command_invocation_id,
       last_load_time,
       file_name,
       row_count,
       error_count,
       status
  FROM snowflake.account_usage.load_history
  LEFT JOIN {{ ref('dim_dbt__sources') }}
    ON UPPER(database) = catalog_name AND
       UPPER(schema) = schema_name AND
       UPPER(name) = table_name AND
       run_started_at >= last_load_time