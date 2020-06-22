-- 단순한 View 만들기 EMP_V1
-- 하나의 원본테이블 사용, 함수나 그룹 사용 안함, DML 사용가능

DROP VIEW EMP_V1; -- 미리 뷰 삭제 명령

-- employees 테이블에서 필요한 열들을 골라서 뷰로 생성
CREATE VIEW EMP_V1
AS
SELECT employee_id, last_name, email, hire_date,  job_id
FROM employees;

-- 테이블처럼 select 문 사용
select * from emp_v1;

DESC emp_v1;

-- 테이블처럼 DML 사용가능(뷰는 가상의 테이블 => 원본 테이블에 입력됨)
INSERT INTO EMP_V1 (employee_id, last_name, email, hire_date,  job_id)
VALUES  (1333, 'David' , 'DAVIDx' , SYSDATE, 'IT_PROG');
-- 뷰에 입력된 데이터 확인
SELECT * FROM emp_v1;
SELECT * FROM employees;
DESC employees;

-- 삭제하기
DELETE FROM emp_v1
WHERE employee_id = 1333;
COMMIT;

-- 두번째 뷰 만들기
CREATE VIEW EMP_V2
AS
SELECT employee_id 직원번호, last_name 이름, email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v2;

-- 세번째 뷰 만들기
CREATE VIEW EMP_V3 ( 직원번호, 이름, 이메일, 고용일자, 직종)
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v1;
SELECT * FROM emp_v2;
SELECT * FROM emp_v3;
SELECT * FROM employees;

-- DML 사용 3번째 뷰에서
INSERT INTO emp_v3 ( 직원번호, 이름, 이메일, 고용일자, 직종)
VALUES (334, 'LaLa', 'LALA' , SYSDATE , 'IT_PROG');


-- 복잡한 뷰 만들기
-- 그룹함수를 사용한 뷰는 DML 사용 불가
-- CREATE OR REPLACE는 뷰를 만들거나 이미 만들어져 있으면 수정을 하거나, 둘 중 하나를 해준다.
-- OR REPLACE 를 사용하여 수정이 쉽도록
CREATE or REPLACE VIEW 부서별_직원_보고서
AS
SELECT department_id 부서번호, COUNT(employee_id) 직원수,
    MAX(salary) 최고급여, MIN(salary) 최저급여,
   ROUND( AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 부서번호;

SELECT * FROM 부서별_직원_보고서;

-- 읽기 전용 뷰 ( 옵션 with READ ONLY)
CREATE or REPLACE VIEW EMP_V_read
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees
WHERE department_id =  90
WITH READ ONLY; -- 읽기 전용

SELECT * FROM emp_v_read;

-- 읽기 전용 뷰에서는 DML 사용 불가
DELETE FROM EMP_V_READ; -- 모든 행 삭제

-- 체크 옵션 뷰
CREATE or replace VIEW emp_v_check
AS
SELECT employee_id, last_name, email, hire_date, job_id, department_id
FROM employees
WHERE department_id =  90
WITH check option; -- where절의 조건에서만 수정 및 입력 가능

SELECT * FROM emp_v_check;

-- 90번 부서일때만 DML 가능
INSERT INTO emp_v_check ( employee_id, last_name, email, hire_date, job_id, department_id)
VALUES (444, '알리', 'ALI', SYSDATE, 'IT_PROG', 90);

















