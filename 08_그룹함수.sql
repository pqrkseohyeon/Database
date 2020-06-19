-- 그룹함수
SELECT COUNT(*)
FROM employees;
-- employees 테이블의 전체 행 갯수를 구해준다.

SELECT salary
FROM employees
ORDER BY salary DESC;

-- MAX MIN
SELECT MAX(salary), MIN(salary)
FROM employees;
-- 집계함수를 이용해서 최대 salary, 최소 salary 를 구해준다.

-- 문자열에 적용
SELECT MAX(first_name), MIN(first_name)
FROM employees;
--max는 알파벳 중에 제일뒤에 있는거 출력, min은 제일 앞에 있는거 출력

-- 날짜에 적용
SELECT MAX(hire_date), MIN(hire_date)
FROM employees;
--max는 가장 오래된 사람, min은 가장 최근

-- sum, AVG : 합계와 평균 (숫자)
SELECT SUM(salary), AVG(salary)
FROM employees;

-- COUNT
SELECT COUNT(*) -- 직원테이블의 모든행의 개수
FROM employees;

SELECT COUNT(NVL(commission_pct, 0)) --NULL 값이 아닌 행의 개수, NVL을 사용하면 행의 개수를 셀 수 있다. 
FROM employees;

-- department_id가 없는 직원이 1명이 있기 때문에 106이 나온다
SELECT COUNT(DISTINCT department_id) -- 중복을 제외한 부서의 개수 
FROM employees;

-- 90번 부서의 직원의 숫자
SELECT COUNT(employee_id)
FROM employees
WHERE department_id = 90;

SELECT AVG(commission_pct) -- 널값은 제외한 평균
FROM employees;

--GROUP BY로 나눠서 집계함수 사용
SELECT department_id, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id;
-- SELECT 절에 들어있는 컬럼은 GROUP BY 절에도 필수로 들어가야 한다. 

SELECT department_id 부서번호, 
ROUND(AVG(salary)) 평균급여,
SUM(salary) 총급여합계,
COUNT(*) 부서인원수
FROM employees
GROUP BY department_id;

SELECT department_id 부서번호, job_id 직업,
ROUND(AVG(salary)) 평균급여,
SUM(salary) 총급여합계,
COUNT(*) 부서별직업별인원수
FROM employees
GROUP BY department_id, job_id;

--예제1)
SELECT  department_id 부서번호,
COUNT(*) 사원수,
MAX(salary) 최대급여, 
MIN(salary) 최소급여,
SUM(salary) 급여합계,
ROUND(AVG(salary)) 급여평균
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;

--예제2)
SELECT department_id 부서번호, job_id 직업, manager_id 상사번호,
SUM(salary) 급여합계,
COUNT(*) 직원수
FROM employees
GROUP BY department_id, job_id, manager_id
ORDER BY 부서번호;

--예제3) 
SELECT ROUND(AVG(MAX(salary))), AVG(MIN(salary))
FROM employees
GROUP BY department_id;

--Having 절 그룹함수를 이용한 조건절
SELECT department_id 부서번호, SUM(salary) 급여합계 
FROM employees
WHERE SUM(salary) > 100000 --그룹함수 사용 에러
GROUP BY department_id
ORDER BY department_id;

SELECT department_id 부서번호, SUM(salary) 급여합계 
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000 --그룹함수 사용 에러
ORDER BY department_id;

--예제)
SELECT job_id 직종, SUM(salary) 급여합계
FROM employees
WHERE job_id != 'AC_MGR'  -- 일반조건
GROUP BY job_id
HAVING AVG(salary) > 10000 -- 그룹함수 조건
ORDER BY 급여합계 DESC; 

--예제2)
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM  employees
WHERE department_id != 40
GROUP BY department_id
HAVING AVG(salary) <= 7000;

--예제3)
SELECT job_id 직종, sum(salary) 급여합계
FROM employees
WHERE job_id NOT LIKE '%REP%'  --'REP' 들어있는 직종제외
GROUP BY job_id
HAVING SUM(salary)  >= 13000
ORDER BY 급여합계 DESC;


















