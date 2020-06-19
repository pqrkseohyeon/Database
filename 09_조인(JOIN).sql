-- 조인
SELECT e.employee_id , e.department_id , d.department_name 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
--합칠 테이블을 JOIN으로 연결하고 ON절을 쓰고, 외래키와 기본키가 같다고 적어주면 된다. 
--employees 테이블의 department_id가 외래키, 
--departments 테이블의 department_id가 기본키

--네추럴 조인 : ON 절 생략
SELECT employee_id, first_name , job_id , job_title 
FROM employees 
NATURAL JOIN jobs;

--기본 동등조인
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e
JOIN jobs J
    ON e.job_id = j.job_id;

--where 절 추가(JOIN ON 끝난다음에 추가)
SELECT e.employee_id , e.department_id , d.department_name 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id = 50;
--departments 테이블에 department_id가 50인 테이블만 출력

--3개 테이블 조인
SELECT e.employee_id, d.department_id , lo.city 
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations lo  ON d.location_id = lo.location_id;

--예제) 
SELECT d.department_name 부서명 , l.city 도시명, c.country_name 국가명
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c  ON l.country_id = c.country_id
WHERE (l.city = 'Seattle' OR  l.city = 'London')
        AND c.country_name LIKE 'United%'
ORDER BY 2;

-- 자체조인
SELECT e.last_name 직원,e.employee_id 직원번호, m.last_name 매니저, m.employee_id 직원번호2 
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;

SELECT employee_id, last_name, manager_id 
FROM employees
WHERE last_name = 'Smith';

-- 외부조인 (OUTER JOIN)

-- LEFT OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호,
    d.department_name 부서명
FROM employees e
LEFT OUTER JOIN departments  d
    ON e.department_id = d.department_id;

-- RIGHT OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호,
    d.department_name 부서명
FROM employees e
RIGHT OUTER JOIN departments  d
    ON e.department_id = d.department_id;

-- FULL OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호,
    d.department_name 부서명
FROM employees e
FULL OUTER JOIN departments  d
    ON e.department_id = d.department_id;

--예제) countries. locations 테이블을 조인하여 아래와 같이 출력하시오.(지역번호로 DESC 정렬)
SELECT c.country_name 국가, c.country_id 국가번호,
l.location_id 지역번호, l.city 도시 
FROM countries c
LEFT OUTER JOIN locations l
    ON c.country_id = l.country_id
order by location_id DESC;


-- CROSS JOIN
-- 예제)
SELECT c.country_name 국가, r.region_name 지역이름 
FROM countries c
CROSS JOIN regions r;

--리뷰 예제
--1 
SELECT d.department_name 부서명, 
       d.manager_id 매니저번호,
       e.last_name||' '||e.first_name 풀이름,
       e.phone_number 
FROM departments d
JOIN employees e
    ON d.manager_id = e.employee_id;

--2
SELECT e.employee_id 사원번호,
       e.hire_date 고용일자,
       j.job_id 직종,
       j.job_title 직책
FROM employees e
JOIN jobs j
    ON e.job_id = j.job_id;
    
--3
SELECT 
TO_CHAR(e.hire_date, 'YYYY') 입사년도,
ROUND(AVG(e.salary)) 평균급여
FROM employees e
JOIN jobs j
    ON e.job_id = j.job_id
WHERE j.job_title = 'Sales Manager'
GROUP BY TO_CHAR(e.hire_date, 'YYYY')
ORDER BY 1;

--4
SELECT l.city, ROUND(AVG(e.salary)), COUNT(*)
FROM locations l
JOIN departments d 
    ON l.location_id = d.location_id
join employees e ON d.department_id = e.department_id
group by l.city
HAVING COUNT (*) < 10
ORDER BY 2;


--5
SELECT e.employee_id 직원번호, e.last_name 직원이름, 
       e.salary 직원급여,m.last_name 매니저이름,
       m.salary 매니저급여 
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
where e.salary > m.salary;

















