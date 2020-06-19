-- DELETE 데이터의 삭제

--71번 ~ 75번 부서번호 삭제
DELETE FROM departments
WHERE department_id BETWEEN 71 AND 75;
COMMIT;

-- 직원테이블 id 1, 2 삭제
DELETE FROM employees
WHERE employee_id IN (1,2);
COMMIT;

-- 테이블 전체를 삭제 : rollback 가능
DELETE FROM copy_departments; -- 데이터만 삭제, 테이블은 그대로 있다.
rollback;

-- TRUNCATE TABLE : 전체 삭제인데 ROLLBACK이 안됨
TRUNCATE TABLE copy_departments;
rollback;

-- DROP 테이블  : 테이블 삭제
DROP TABLE copy_departments;
DROP TABLE copy_dept;
DROP TABLE XX_EMP;

-- 세이브 포인트
SELECT * FROM copy_emp
WHERE employee_id = 108; -- salary 12008

UPDATE copy_emp
SET salary = salary + 10
WHERE employee_id = 108;
-- salary 값이 12018
-- 세이브 포인트 A만들기
SAVEPOINT A;

UPDATE copy_emp
SET salary = salary + 20
WHERE employee_id = 108;
--salary 값이 12038

-- 세이브 포인트 A로 롤백
ROLLBACK TO SAVEPOINT A;
-- salary 값이 12018
-- 롤백(여기서 롤백하면 최초 상태로 돌아간다)
ROLLBACK;

-- 원래있던 상태로 저장
COMMIT;


