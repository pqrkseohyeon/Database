-- 문자형 함수는 대소문자 함수와 문자 조작함수로 나뉜다.

-- 1. 대소문자 조작 함수(upper, lower, initcap)
SELECT 1+1
FROM DUAL; -- 듀얼테이블은 연습용 테이블

--LOWER(소문자), UPPER(대문자), INITCAP(첫 글자만 대문자)
SELECT LOWER('SQL COURSE'), UPPER('SQL COURSE'),
        INITCAP('SQL SOURSE')
FROM DUAL;

-- 문자함수를 where 절에 사용
SELECT employee_id, first_name
FROM employees
WHERE UPPER(first_name) = 'PATRICK'; --UPPER 대문자로 다 바꾼 다음에 비교하여 검색, UPPER을 안붙이면 검색이 안된다.

-- 2. 문자 조작 함수들
-- CONCAT
SELECT first_name , last_name, 
        CONCAT(first_name, last_name)풀네임
FROM employees;

--SUBSTR (열이름, m, n) m 은 시작문자, n 은 잘라낼 길이(n이 안적혔을 때는 끝까지)
SELECT employee_id, 
first_name,
SUBSTR(first_name, 1, 3), --첫번째 문자부터 부터 3개를 잘라낸다 , 앞이 시작위치, 뒤에가 잘라낼 갯수
SUBSTR(first_name, 2, 4), -- 두번째 문자부터 4개를 잘라낸다.
SUBSTR(first_name, 2), -- 시작부터 끝까지
SUBSTR(first_name, -3) -- 음수일 때  끝에서부터 카운트 끝에서부터 3글자만 잘라낸다.
FROM employees;

--length : 문자열의 길이
SELECT first_name, LENGTH(first_name) --first_name의 문자열의 길이를 알려준다.
FROM employees;

-- INSTR (문자열, 착을 문자, m, n)
-- m은 검사 시작 위치
-- n은 찾을 횟수
-- 디폴트 값은 m, n 각각 1
SELECT first_name, 
INSTR(first_name, 'e', 2), --'e'의 자릿수를 알려준다.
INSTR(first_name, 'e', 5), --5번째 부터 시작하면 제일 끝에 있는 'e'를 찾기 때문에 자릿수는 7이된다.
INSTR(first_name, 'e', 1, 2) --첫번째 'e' 말고  2번째 위치한 'e'를 찾아준다.
FROM employees
WHERE first_name = 'Nanette';

--lpad / rpad (문자열, 자릿수, 채울문자)
SELECT employee_id, first_name, salary,
    LPAD(salary, 10, '#'), RPAD(salary, 10, '*') --LAPD는 왼쪽, RPAD는 오른쪽
FROM employees;

-- 공백을 이용해 문자열을 분리
SELECT 
'홍 길동' 성명, 
SUBSTR('홍 길동',1,INSTR('홍 길동',' ')-1) 성, -- 공백으로 문자열을 나누기 때문에 공백을 기준으로 -1을 빼주면 성이 출력된다.
SUBSTR('홍홍 길동', INSTR('홍홍 길동',' ')+1) 이름 -- 공백으로 문자열을 나누기 때문에 공백을 기준으로 +1 해주면 이름이 출력된다
FROM DUAL; 

-- 문자형 함수 예제
SELECT last_name, CONCAT('직업명이 ',job_id) AS 직업명 
FROM employees
WHERE SUBSTR(job_id, 4,3) = 'REP';
--job_id의 4번째 문자부터 REP인 경우

SELECT employee_id,
    CONCAT(first_name, last_name) 전체이름,
    last_name,
    LENGTH(last_name) 길이,
    INSTR(last_name, 'a') "'a' 가 몇번째?"
FROM employees;

--문자 치환 : REPLACE
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') --앞에는 검색할 문자열(ACCOUNT)을, 뒤에는 바꿀 문자열(ACCNT)로 치환한다.
FROM employees
WHERE job_id LIKE '%ACCOUNT%';

--예제) 
SELECT last_name 이름, 
LOWER(last_name) LOWER적용, 
UPPER(last_name) UPPER적용,
email 이메일,
INITCAP(email) INITCAT적용
FROM employees;

--예제)
SELECT job_id 직업명,
SUBSTR(job_id, 1, 2) 앞의2개
FROM employees;







