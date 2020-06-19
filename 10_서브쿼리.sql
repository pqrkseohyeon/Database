--서브쿼리

--Abel 직원보다 급여를 더 많이 받는 직원들은?
--Abel의 급여 확인
SELECT salary
FROM employees
WHERE last_name = 'Abel';

--서브쿼리를 사용(Abel의 급여보다 많이 받는 직원출력)
-- 단일행 연산자( = , > , < , <= , => , <> , !=)
SELECT employee_id, last_name, salary 
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Abel');
                
--에러가 나는 경우
SELECT employee_id, last_name, salary 
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE department_id = 30);

-- 그룹함수를 서브쿼리로 이용
-- 그룹함수 예로 MAX는 가장높은 급여를 받는 사람을 알 수 없음
SELECT * 
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

--예제1)
SELECT last_name, salary 
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Abel');
                
--예제2)
SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 급여
FROM employees
WHERE salary> (SELECT salary FROM employees WHERE last_name = 'Bull') AND 
    department_id = (SELECT department_id FROM employees WHERE last_name = 'Bull');

--예제3)
SELECT last_name 이름, salary 급여, manager_id 
FROM employees
WHERE manager_id = ( SELECT employee_id FROM employees WHERE last_name = 'Russell');

--예제4)
SELECT * 
FROM employees
WHERE job_id = (SELECT job_id FROM jobs WHERE job_title = 'Stock Manager');

-- 다중행 서브쿼리
-- 연산자 (in,any,all)
SELECT salary FROM employees WHERE department_id = 90;

--IN
SELECT employee_id, first_name, last_name, salary 
FROM employees
WHERE salary IN (SELECT salary FROM employees WHERE department_id = 90 );

--ANY : 하나의 조건만 만족해도 됨(ANY,ALL은 비교연산자를 사용해야한다.)
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary >= ANY (SELECT salary FROM employees WHERE department_id = 90 );

--ALL : 모든 조건을 만족해야 함 (ANY, ALL은 비교연산자 사용)
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary >= ALL (SELECT salary FROM employees WHERE department_id = 90 );

--예제1) 부서번호(department_id)가 20번인 직원들의 매니저 아이디(manager_id)와
--      같은 매니저를 가지는 직원들을 출력하라. (단 20번 부서의 직원은 제외!)
SELECT employee_id, first_name, job_id 직종, salary 급여 
FROM employees
WHERE manager_id IN (SELECT manager_id FROM employees WHERE department_id = 20)
AND department_id <> 20;

--예제2) job_id가 'ST_MAN' 인 직원들중 어느 한직원 보다도 급여가 작은 직원들을 출력하라. (ANY)
SELECT employee_id, last_name, job_id, salary 
FROM employees
WHERE salary < ANY ( SELECT salary FROM employees WHERE job_id = 'ST_MAN');



--예제3) 직책이 'IT_PROG' 인 직원들 보다 급여가 작은 직원들을 출력하시오.(ALL)
SELECT employee_id, last_name, job_id, salary 
FROM employees
WHERE salary < ALL ( SELECT salary FROM employees where job_id = 'IT_PROG');
--IT_PROG 직종중에 가장 낮은 급여보다도 낮은 급여를 받는 직원 조회

-- 다중열 서브쿼리
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN (SELECT manager_id, job_id
                                FROM employees
                                WHERE first_name = 'Bruce')
    AND first_name != 'Bruce';

-- 부서별 최소 급여를 받는 사원의 부서번호, 사원번호, 이름 , 급여 정보 검색
SELECT department_id 부서번호, employee_id 사원번호,
       first_name 이름, salary 급여
FROM employees
WHERE (department_id, salary) IN ( SELECT department_id, MIN(salary)
                                   FROM employees
                                   GROUP BY department_id)
ORDER BY department_id;

--예제) employees 테이블에서 job_id 별로 가장 낮은 salary가 얼마인지 찾아보고, 
--     찾아낸 job_id별로 salary에 해당하는 직원의 first_name, job_id, salary,
--     department_id 를 출력하시오(salary 내림차순 정렬)
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN (SELECT job_id, MIN(salary)
                           FROM employees
                           GROUP BY job_id)
ORDER BY salary DESC;



























