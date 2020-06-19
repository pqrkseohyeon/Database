-- 1. 테이블의 모든 데이터 가져오기
SELECT * FROM employees;
-- 2. where 절에 가져올 조건에 맞는 행을 선택한다.
--    위치는 from  절 다음에 위치
SELECT * 
FROM employees
WHERE department_id = 90; --90번 부서만

SELECT * 
FROM employees
WHERE salary = 24000; -- 월급이 24000인 직원만
/*
where 절을 사용할 때 주의점
문자(string) 와 날짜(Data) 값은 항상 따옴표(')로 표시
문자값은 대소문자를 구분한다.(Case-Sensitive)
날짜값은 날짜포맷에 벗어나지 않도록 (Format- Sensitive)
오라클의 날짜포맷은 RR/MM/DD(RR은 2자리 년도)
*/

--3 WHERE + 문자열(''표를 써줘야한다.)
--이름이 스티븐인 사람을 찾는다.
select employee_id, first_name, last_name, job_id
from employees
WHERE first_name = 'Steven';

--4 WHERE + 날짜
select SYSDATE  
FROM DUAL;
--DUAL은 샘플테이블  SYSDATE 는 현재 날짜 시간

SELECT * 
from employees
WHERE hire_date >= '03/06/17'; --년도/월/날짜

--5 비교 연산자
SELECT * 
from employees
WHERE salary  >= 10000; --숫자비교

SELECT * 
from employees
WHERE hire_date >= '03/06/17'; --날짜비교

SELECT * 
from employees
WHERE first_name > 'King'; --문자비교(알파벳순,큰 것 부터 나온다)

--예제1  employees 테이블에서 employee_id가 100인 직원 정보를 출력하세요
SELECT * 
FROM employees
WHERE employee_id = 100;

--예제2 employees 테이블에서 first_name 이 David 인 직원 정보를 출력하세요
SELECT * 
FROM employees
WHERE first_name = 'David';

--예제3 employees 테이블에서 employees_id가 105 이하인 직원 정보를 출력하세요.
SELECT * 
FROM employees
WHERE employee_id <= 105;

--예제4 
SELECT * 
FROM job_history
WHERE start_date > '06/03/03';

--예제5
SELECT * 
FROM departments
--WHERE location_id <> 1700; --!= 1700
WHERE location_id != 1700;

-- 6. AND OR
--부서번호가 60번이건, salary가 10000이상인 데이터만 보여준다.
SELECT * 
FROM employees
WHERE department_id = 60 OR
    (department_id = 80 AND salary > 10000);

--()를 어디에 붙이는지에 따라서 결과 값이 달라진다.
SELECT * 
FROM employees
WHERE (department_id = 60 OR
    department_id = 80) AND salary > 10000;
    
--hire_date가 08/04/04 이거나 salary가 13000 이상인 사람이 출력된다. ()가 없을 때는 and가 먼저 출력된다.    
SELECT * 
FROM employees
WHERE hire_date > '08/04/04' OR salary > 13000
    AND  job_id = 'AD_VP';

--not을 붙이면 결과가 반대로 바뀌어서 나온다.   
SELECT * 
FROM employees
WHERE NOT (hire_date > '04/01/01' OR salary > 5000);
--(hire_date <= '04/01/01' AND salary <= 5000)   

--예제1)
SELECT * 
FROM employees
WHERE salary > 4000 and job_id = 'IT_PROG';

--예제2)
SELECT * 
FROM employees
WHERE salary > 4000 AND (job_id = 'IT_PROG' or job_id = 'FI_ACCOUNT');

-- IN 연산자
--OR 대신 사용할 수 있는 연산자
--salary가 4000이거나 3000이거나 2700인 사람을 출력
SELECT * 
FROM employees
WHERE salary = 4000 OR salary = 3000 OR salary = 2700;

--OR을 계속 쓰면은 문장이 길어지기 때문에 IN 연산자를 이용해서 더 간편하게 쓸 수 있다.
SELECT * 
FROM employees
WHERE salary IN (4000, 3000, 2700);

--예제1) employees 테이블에서 salary가 10000, 17000, 24000d인 직원 정보를 출력
SELECT * 
FROM employees
WHERE salary IN(10000, 17000, 24000);

--예제2) employees 테이블에서 department_ID가 30, 50, 80, 100,110이 아닌 부서직원들만 출력(NOT IN 사용)
SELECT * 
FROM employees
WHERE  department_id NOT IN (30, 50, 80, 100,110);

--Between 연산자
--AND로 연결되어 있으면서, 값이 뭐와 뭐 사이에 있을 때 AND 대신 사용할 수 있는 연산자
SELECT * 
FROM employees
WHERE salary >= 9000 AND salary <=10000;

SELECT * 
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

--예제1)
SELECT * 
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--예제2)
SELECT * 
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';

--예제3)
--BETWEEN 을 사용하면 7000~17000 사이의 데이터만 출력하는데,  NOT BETWEEN 을 사용하면 7000보다 미만이거나, 17000 이상인 큰 값을 출력할 수 있다.
SELECT * 
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000; 

