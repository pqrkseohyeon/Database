--1. 부서번호가 10번인 부서의 사람 중 사원번호, 이름, 월급을 출력하라
SELECT empno, ename, sal 
FROM emp
WHERE deptno = 10;

--2. 사원번호가 7369인 사람 중 이름, 입사일, 부서번호를 출력하라
SELECT ename, hiredate, deptno 
FROM emp
WHERE empno = 7369;

--3. 이름이 ALLEN인 사람의 모든 정보를 출력하라.
SELECT * 
FROM emp
WHERE ename = 'ALLEN';

--4. 입사일이 81/02/20인 사원의 이름, 부서번호, 월급을 출력하라.
SELECT ename, deptno, sal 
FROM emp
WHERE hiredate = '81/02/20';

--5. 직업이 MANAGER가 아닌 사람의 모든 정보를 출력하라
SELECT *
FROM emp
WHERE job <> 'MANAGER';

--6. 입사일이 81/04/02 이후에 입사한 사원의 정보를 출력하라
SELECT *
FROM emp 
WHERE hiredate >= '81/04/02';

--7. 급여가 $800 이상인 사람의 이름, 급여, 부서번호를 출력하라
SELECT ename, sal, deptno 
FROM emp
WHERE sal >= 800;

--8. 부서번호가 20번 이상인 사원의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE deptno >= 20;

--9. 이름이 K로 시작하는 사람보다 뫃은 이름을 가진 사람의 모든 정보를 출력하라
--   ( 문자열 비교시 알파벳순으로 철자 비교 예 'B' >'A')
SELECT * 
FROM emp
WHERE ename >='L';

--10. 입사일이 81/12/09 보다 먼저 입사한 사람들의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE hiredate <= '81/12/09';

--11. 직원번호가 7698 보다 작거나 같은 사람들의 직원번호와 이름을 출력하라
SELECT empno, ename 
FROM emp
WHERE empno <= 7698;

--12. 입사일이 81/04/02 보다 같거나 늦고 82/12/09 보다 같거나 빠른 사원의 이름, 월급, 부서번호를 출력하라.
SELECT ename, sal, deptno 
FROM emp
WHERE hiredate >= '81/04/02' AND hiredate <= '82/12/19';

--13. 급여가 $1,600 보다 크고 $3,000 보다 작은 직원의 이름,직업, 급여를 출력하라
SELECT ename, job, sal  
FROM emp
WHERE sal > 1600 AND sal < 3000;

--14. 직원번호가 7654와 7782 사이 이외으 ㅣ직원의 모든 정보를 출력하라
SELECT *
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;

--15. 이름이 B와 J사이의 모든 직원의 정보를 출력하라.
SELECT * 
FROM emp
WHERE ename BETWEEN 'B' AND 'J';

--16. 입사일이 81년 이외에 입사한 직원의 모든 정보를 출력하라.
SELECT * 
FROM emp
WHERE  hiredate NOT BETWEEN  '81/01/01' AND '81/12/31';

--17. 직업이 MANAGER 이거나 SALESMAN인 직원의 모든 정보를 출력하라
SELECT * 
FROM emp
WHERE job = 'MANAGER' OR job = 'SALESMAN';

--18. 부서번호가 20, 30번을 제외한 모든 직원의 이름, 사원번호, 부서번호를 출력하라
SELECT ename, empno, deptno 
FROM emp
WHERE NOT(deptno =20 OR deptno =30);

--19. 이름이 S로 시작하는 직원의 사원번호, 이름, 입사일, 부서번호를 출력하라
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

--20. 입사일이 81년도인 사람의 모든 정보를 출력하라
SELECT *
FROM emp
WHERE hiredate LIKE '%81%';

--21. 이름 중 S자가 들어가 있는 사람만 모든 정보를 출력하라
SELECT * 
FROM emp
WHERE ename LIKE '%S%';

--22. 이름이 M으로 시작하고 마지막 글자가 N인 사람의 모든 정보를 출력하라
--    (단, 이름은 전체 6자리이다. 자리수를 이용한 와일드카드 '_' 을 이용) 
SELECT * 
FROM emp
WHERE  ename LIKE 'M_____' AND ename LIKE '_____N';

--23. 이름이 첫 번째 문자는 관계없고, 두 번째 문자가 A인 사람의 정보를 출력하라.
SELECT * 
FROM emp
WHERE ename LIKE '_A%';

--24. 커미션이 NULL인 사람의 정보를 출력하라. ( IS NULL 또는 IS NOT NULL 사용)
SELECT * 
FROM emp
WHERE comm IS NULL;

--25. 커미션이 NULL이 아닌 사람의 모든 정보를 출력하라.(IS NULL 또는 IS NOT NULL 사용)
SELECT * 
FROM emp
WHERE comm IS NOT NULL;

--26. 부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이른, 부서, 월급을 출력하라.
SELECT ename, deptno, sal 
FROM emp
WHERE deptno = 30 AND sal >= 1500;

--27. 이름의 첫 글자가 K로 시작하거나 부서번호가 30인 사람의 사원번호, 이름, 부서번호를 출력하라.
SELECT empno, ename, deptno 
FROM emp
WHERE ename LIKE 'K%' OR deptno = 30;

--28. 급여가 $1,500 이상이고 부서번호가 30번인 사원 중 직업이MANAGER인 사람의 정보를 출력하라.
SELECT * 
FROM emp
WHERE sal >= 1500 AND deptno = 30 AND job = 'MANAGER';

--29. 부서번호가 30인 사람의 모든 정보를 출력하고 직원번호로 SORT(정렬)하라.
SELECT * 
FROM emp
WHERE deptno = 30
ORDER BY EMPNO;

--30. 직원들의 급여가 많은 순으로 SORT(정렬) 하라.
SELECT * 
FROM emp
ORDER BY sal DESC;

--31. 부서번호로  ASCENDING SORT 한 후 급여가 많은 사람 순으로 출력하라.
--   ( 한개 이상의 열로 정렬시 콤마(,)를 사용합니다.
SELECT * 
FROM emp
ORDER BY deptno , sal DESC;

--32. 부서번호가 DESC SORT하고, 이름 순으로 ASC SORT 급여순으로 DESC SORT 하시오
SELECT deptno, ename, sal 
FROM emp
ORDER BY deptno DESC, ename, sal DESC;

--33. 10번 부서의 모든 직원에게 급여의 13%를 보너스로 지급하기로 하였다. 이름, 급여, 보너스금액, 부서번호를 출력하라.
--    (소수점은 반올림함.)
SELECT ename, sal, 
ROUND(sal*0.13) BONUS,
deptno
FROM emp
WHERE deptno = 10;

--34. 직원의 이름, 급여, 커미션, 총액(급여 + 커미션)을 구하여 총액이 많은 순서로 출력하라.
--   (단, 커미션이 null인 사원도 0으로 해서 포함.
SELECT ename, sal, NVL(comm, 0), NVL(comm, 0) + sal total
FROM emp
order by total desc;

--35. 급여가 $1,500부터 $3,000 사이의 사원에 대해서만 급여의 15%를 회비로 지불하기로 하였다.
--    모든 사원의 이름, 급여, 회비(소수이하 2자리에서 반올림)를 출력하여라.
--    (단, 회비는 달러표시 $로 시작하고 소수점 1자리까지 출력)
SELECT ename, sal,
TO_CHAR(ROUND(sal*0.15,1),'$999.0') 회비
FROM EMP
WHERE sal BETWEEN 1500 AND 3000;

--36. 사원수가 5명이 넘는 부서의 부서명과 사원수 조회
SELECT d.dname, count(e.empno)
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(e.empno) > 5;

--37. 직업별 급여합계가 5000을 초과하는 각 직무에 대해서 직무와 월 급여 합계를 조회, 
--    단 판매원('SALESMAN')은 제외하고, 월 급여 합계로 내림차순 정렬
SELECT job, SUM(sal) 급여합계 
FROM emp
WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal)>5000;
--ORDER BY 급여합계 DESC; 하나밖에 없어서 안해도 된다.

--38. 사원들의 사원번호(empno), 사원명(ename), 급여(sal), 급여긍급(grade)을 출력하시오.
--    (테이블 salgrade 조인)
SELECT e.empno, e.ename, e.sal, s.grade 
FROM emp e
JOIN salgrade s ON e.sal between s.losal and s.hisal;



--39. 부서별(deptno)로 사원의 수와 커미션(comm) 을 받은 사원의 수를 출력하시오.
SELECT deptno, count(*) as "사원수", count(comm) as "커미션 받은 사원수"
FROM emp
GROUP by deptno;

--40. 부서번호(deptno)가 10은 '총무부', 20은 '개발부', 30은 '영업부'라고 하여
--    부서번호, 부서명, 순으로 출력하시오( decode 나 case 함수 사용)
SELECT ename, deptno,
        decode(deptno, 10, '총무부',
                       20, '개발부',
                       30, '영업부'
            ) 부서명       
FROM emp;

