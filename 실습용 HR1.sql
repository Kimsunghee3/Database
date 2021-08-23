SELECT *
FROM employees;

SELECT employee_id, first_name, last_name
FROM employees;

SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

SELECT job_id
FROM employees;

SELECT DISTINCT job_id
FROM employees;

SELECT employee_id AS 사원번호, first_name AS 이름, last_name AS 성
FROM employees;

SELECT employee_id, first_name || last_name
FROM employees;

SELECT employee_id,
            first_name || ' ' || last_name,
            email || '@' || ' company.com'
FROM    employees;

SELECT employee_id, salary, salary + 500, salary -100, (salary * 1.1)/2
FROM    employees;

SELECT employee_id AS 사원번호,
            salary AS 급여,
            salary+500 AS 추가급여,
            salary-100 AS 인하급여,
            (salary*1.1)/2 AS 조정급여
FROM employees;

SELECT * 
FROM   employees
WHERE employee_id = 100;

SELECT * 
FROM employees
WHERE first_name = 'David';

SELECT * 
FROM employees
WHERE employee_id > =105;

SELECT * 
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

SELECT *
FROM employees
WHERE salary IN (10000, 17000, 24000);

SELECT *
FROM employees
WHERE job_id LIKE 'AD%';

SELECT * 
FROM employees
WHERE job_id LIKE 'AD___';

SELECT *
FROM employees
WHERE manager_id IS NULL;

SELECT *
FROM employees
WHERE salary > 4000
AND job_id = 'IT_PROG';

SELECT *
FROM employees
WHERE salary > 4000
AND job_id = 'IT_PROG'
OR   job_id = 'FI_ACCOUNT';

SELECT *
FROM employees
WHERE employee_id <> 105;

SELECT *
FROM employees
WHERE manager_id IS NOT NULL;

SELECT last_name,
            LOWER(last_name)    LOWER적용,
            UPPER(last_name)    UPPER적용,
            email,
            INITCAP(email) INITCAP적용
FROM    employees;

SELECT job_id, SUBSTR(job_id, 1, 2) 적용결과
FROM employees;

SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees;

SELECT first_name, LPAD(first_name, 12, '*') LPAD적용결과
FROM employees;

SELECT job_id,
            LTRIM(job_id, 'F') LTRIM적용결과,
            RTRIM(job_id, 'T') RTRIM적용결과
FROM employees;

SELECT 'start'||TRIM('  - space -   ') || 'end' 제거된_공백
FROM dual;

SELECT salary,
            salary / 30 일급,
            ROUND(salary / 30, 0) 적용결과0,
            ROUND(salary /30, 1) 적용결과1,
            ROUND(salary / 30, -1) 적용결과MINUS1
FROM    employees;

SELECT salary,
            salary/30 일급,
            TRUNC(salary/30, 0) 적용결과0,
            TRUNC(salary/30, 1) 적용결과1,
            TRUNC(salary/30, -1) 적용결과MINUS1
FROM    employees;

SELECT TO_CHAR(SYSDATE, 'YY/MM/DD/HH24:MI') 오늘날짜,
            SYSDATE + 1 더하기1,
            SYSDATE -1 빼기1,
            TO_DATE('20171202')-TO_DATE('20171201') 날짜빼기,
            SYSDATE + 13/24 시간더하기
FROM    DUAL;

SELECT SYSDATE, hire_date, MONTHS_BETWEEN(SYSDATE, hire_date) 적용결과
FROM employees
WHERE department_id = 100;

SELECT *
FROM employees
ORDER BY commission_pct;

SELECT salary * NVL(commission_pct, 1)
FROM employees
ORDER BY commission_pct;

SELECT first_name,
            last_name,
            department_id,
            salary 원래급여,
            DECODE(department_id, 60, salary*1.1, salary) 조정된급여,
            DECODE(department_id, 60, '10%인상', '미인상') 인상여부
FROM    employees;

SELECT employee_id, first_name, last_name, salary,
            CASE
                    WHEN salary >= 9000 THEN '상위급여'
                    WHEN salary BETWEEN 6000 AND 8999 THEN '중위급여'
                    ELSE '하위급여'
            END AS 급여등급
FROM    employees
WHERE   job_id = 'IT_PROG';

SELECT  employee_id,
             salary,
             RANK()         OVER(ORDER BY salary DESC) RANK_급여,
             DENSE_RANK() OVER(ORDER BY salary DESC) DENSE_RANK_급여,
             ROW_NUMBER() OVER(ORDER BY salary DESC) ROW_NUMBER_급여
FROM    employees;

SELECT A.employee_id,
            A.department_id,
            B.department_name,
            salary,
            RANK()          OVER(PARTITION BY A.department_id ORDER BY salary DESC) RANK_급여,
            DENSE_RANK() OVER(PARTITION BY A.department_id ORDER BY salary DESC) DENSE_RANK_급여,
            ROW_NUMBER() OVER(PARTITION BY A.department_id ORDER BY salary DESC) ROW_NUMBER_급여
FROM    employees A, departments B
WHERE A.department_id = B.department_id
ORDER BY B.department_id, A.salary DESC;

SELECT COUNT(salary) salary행수
FROM employees;

SELECT SUM(salary) 합계, AVG(salary) 평균, SUM(salary)/COUNT(salary) 계산된평균
FROM employees;

SELECT MAX(salary) 최댓값, MIN(salary) 최솟값, MAX(first_name) 최대문자값, MIN(first_name) 최소문자값
FROM employees;

SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM    employees
WHERE  employee_id >= 10
GROUP BY job_id
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;

SELECT job_id  job_id_대그룹,
            manager_id manger_id_중그룹,
            SUM(salary) 그룹핑_총급여, 
            AVG(salary) 그룹핑_평균급여
FROM employees
WHERE employee_id >= 10
GROUP BY job_id, manager_id
ORDER BY 그룹핑_총급여 DESC, 그룹핑_평균급여;

SELECT *
FROM employees A

WHERE A.salary = (
                            SELECT salary
                            FROM employees
                            WHERE last_name = 'De Haan'
                            );
                            
SELECT *
FROM employees A
WHERE A.salary IN (
                            SELECT MIN(salary)
                            FROM employees
                            GROUP BY department_id
                            )
ORDER BY A.salary DESC;

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES
(271, 'Sample_Dept', 200, 1700);

UPDATE departments
SET manager_id = 201,
      location_id = 1800
WHERE department_name = 'Sample_Dept';

DELETE  FROM departments
WHERE   department_name = 'Sample_Dept';

CREATE TABLE sample_product
            ( product_id number,
              product_name varchar2(30),
              manu_date      date
              );