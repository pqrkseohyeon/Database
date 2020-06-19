-- UPDATE : 데이터 수정하기

-- 업데이트 사용시 where 절에 항상 기본키를 활용한다.
CREATE TABLE copy_emp
AS 
SELECT * FROM employees;

UPDATE copy_emp
SET salary = 24100
WHERE employee_id = 100;
COMMIT;

-- 의도치 않게 이름이 같은사람들이 업데이트됨 (기본키로 업데이트 해주면 중복이 없다.)
UPDATE copy_emp
SET salary = 24100
WHERE first_name = 'Steven';
COMMIT;

-- where 절을 안썼을때 ( 모든 phone_number 가 123-456-789 로 업데이트 된다. )
UPDATE copy_emp
SET phone_number = '123-456-789';
ROLLBACK;

--예제)  개발부4, 5 번의 manager_id, location_id 가 널값인데 manager_id를 100, location_id를 1800으로 바꿔라.
UPDATE copy_departments
SET manager_id = 100 , location_id = 1800
WHERE department_name = '개발부 4' OR department_name = '개발부 5';


--예제) copy_departments 테이블에서 department_id 150부터 200까지 부서번호의 manager_id를 100으로 수정하라.
UPDATE copy_departments
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;


























