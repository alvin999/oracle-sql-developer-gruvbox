/*
 * Gruvbox Dark Theme Preview for Oracle SQL Developer
 * Syntax Showcase: SQL & PL/SQL Features
 */
CREATE OR REPLACE PACKAGE BODY theme_preview_pkg AS

  -- Global constants & configuration
  c_theme_name CONSTANT VARCHAR2(30) := 'Gruvbox Dark';
  c_max_retry  CONSTANT NUMBER(4)    := 1000;

  /**
   * Calculates quarterly departmental analytics and summaries
   */
  PROCEDURE generate_summary (
    p_dept_id    IN  NUMBER,
    p_record_cnt OUT NUMBER
  ) IS
    v_total_sal   NUMBER(12, 2) := 0.00;
    v_is_active   BOOLEAN       := TRUE;
  BEGIN
    -- Query demonstrating CTE, joins, aggregations, and window functions
    WITH regional_sales AS (
      SELECT
        e.department_id,
        e.employee_id,
        e.first_name || ' ' || e.last_name AS full_name,
        NVL(e.salary, 0)                   AS base_salary,
        ROUND(e.salary * 0.15, 2)          AS bonus_estimate,
        ROW_NUMBER() OVER (
          PARTITION BY e.department_id 
          ORDER BY e.salary DESC NULLS LAST
        ) AS rank_in_dept
      FROM hr.employees e
      INNER JOIN hr.departments d 
        ON e.department_id = d.department_id
      WHERE e.hire_date >= DATE '2020-01-01'
        AND e.status IN ('ACTIVE', 'PENDING')
        AND (e.commission_pct IS NOT NULL OR e.salary > 45000)
    )
    SELECT 
      department_id,
      COUNT(employee_id)                AS active_count,
      SUM(base_salary + bonus_estimate) AS total_budget
    INTO p_record_cnt, v_total_sal
    FROM regional_sales
    WHERE rank_in_dept <= 10
    GROUP BY department_id
    HAVING COUNT(employee_id) > 0;

    -- Output formatted message
    DBMS_OUTPUT.PUT_LINE('Loaded [' || c_theme_name || '] with total: ' || v_total_sal);

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      p_record_cnt := 0;
      DBMS_OUTPUT.PUT_LINE('[WARN] No matching records found for Dept: ' || p_dept_id);
    WHEN OTHERS THEN
      -- Unexpected error handling
      p_record_cnt := -1;
      RAISE_APPLICATION_ERROR(-20001, 'Theme preview execution failed: ' || SQLERRM);
  END generate_summary;

END theme_preview_pkg;
/
