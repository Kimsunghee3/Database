SELECT job_id, SUBSTR(job_id, 1, 2)
FROM employees;

SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT')
FROM employees;

SELECT first_name, RPAD(first_name, 12, '*') RPAD적용결과
FROM employees;

SELECT job_id, 
            LTRIM(job_id, 'F') LTRIM적용결과,
            RTRIM(job_id, 'T') RTRIM적용결과
FROM employees;

