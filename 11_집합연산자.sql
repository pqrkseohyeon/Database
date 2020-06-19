-- 집합연산자(UNION 외)

-- UNION, 합집합 중복제거 : 115행
SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

-- UNION ALL, 중복 포함 : 117행
SELECT employee_id, job_id
FROM employees
UNION ALL

SELECT employee_id, job_id
FROM job_history;

-- INTERSECT , 교집합 : 2행 
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

-- MINUS 차집합 : 105행
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

--예제)employees 테이블의 department_id 집합과 departments 테이블의
--    department_id 집합을 UNION 연산자를 이용해 합쳐 보세요.
SELECT department_id
FROM employees
union
SELECT department_id
FROM departments;

-- 예제)employees 테이블의 department_id 집합과 departments 테이블의
--     department_id 집합을 UNION ALL 연산자를 이용해 합쳐 보세요.
SELECT department_id
from employees
union all
select department_id
FROM departments;

-- 예제) employees 테이블의 department_id 집합과 departments 테이블의
--      department_id 집합의 교집합을 INTERSECT 연산자를 이용해 출력해 보세요.
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

-- 예제) departments 테이블의 department_id 집합에서 employees 테이블의 
--      department_id 집합을 MINUS 연산자를 이용해 배 보세요. 
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;
















