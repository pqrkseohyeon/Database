-- 숫자형 함수

--ROUND
SELECT ROUND(15.193, 1) 소수첫째자리,
        ROUND(15.193, 2) 소수둘째자리,
        ROUND(15.193, 0) 정수,
        ROUND(15.193) 디폴트,
        ROUND(15.193, -1) "10의자리", -- 
        ROUND(115.193, -2) "100의자리"
FROM DUAL;

--TRUNC : 버림
SELECT TRUNC(15.79, 1) 소수첫째자리, --뒷자리 버림
        TRUNC(15.79, 0) 정수,
        TRUNC(15.79) 디폴트,
        TRUNC(15.79, -1) "10의자리"
FROM DUAL;

--mod : 나누기 후 나머지
SELECT employee_id 짝수번, last_name 
FROM employees
WHERE MOD(employee_id, 2) = 0
ORDER BY 1; --1번째 열로 정렬(오름차순 ASC 생략함)

--예제) 
SELECT salary, 
ROUND(MOD(salary, 30),0) 정수,
ROUND(MOD(salary, 30),1) 소수첫째자리,
ROUND(MOD(salary, 30),-1) "10의자리"
FROM employees;

