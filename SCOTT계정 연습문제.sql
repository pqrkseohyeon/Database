--1. �μ���ȣ�� 10���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�
SELECT empno, ename, sal 
FROM emp
WHERE deptno = 10;

--2. �����ȣ�� 7369�� ��� �� �̸�, �Ի���, �μ���ȣ�� ����϶�
SELECT ename, hiredate, deptno 
FROM emp
WHERE empno = 7369;

--3. �̸��� ALLEN�� ����� ��� ������ ����϶�.
SELECT * 
FROM emp
WHERE ename = 'ALLEN';

--4. �Ի����� 81/02/20�� ����� �̸�, �μ���ȣ, ������ ����϶�.
SELECT ename, deptno, sal 
FROM emp
WHERE hiredate = '81/02/20';

--5. ������ MANAGER�� �ƴ� ����� ��� ������ ����϶�
SELECT *
FROM emp
WHERE job <> 'MANAGER';

--6. �Ի����� 81/04/02 ���Ŀ� �Ի��� ����� ������ ����϶�
SELECT *
FROM emp 
WHERE hiredate >= '81/04/02';

--7. �޿��� $800 �̻��� ����� �̸�, �޿�, �μ���ȣ�� ����϶�
SELECT ename, sal, deptno 
FROM emp
WHERE sal >= 800;

--8. �μ���ȣ�� 20�� �̻��� ����� ��� ������ ����϶�.
SELECT *
FROM emp
WHERE deptno >= 20;

--9. �̸��� K�� �����ϴ� ������� ���� �̸��� ���� ����� ��� ������ ����϶�
--   ( ���ڿ� �񱳽� ���ĺ������� ö�� �� �� 'B' >'A')
SELECT * 
FROM emp
WHERE ename >='L';

--10. �Ի����� 81/12/09 ���� ���� �Ի��� ������� ��� ������ ����϶�.
SELECT *
FROM emp
WHERE hiredate <= '81/12/09';

--11. ������ȣ�� 7698 ���� �۰ų� ���� ������� ������ȣ�� �̸��� ����϶�
SELECT empno, ename 
FROM emp
WHERE empno <= 7698;

--12. �Ի����� 81/04/02 ���� ���ų� �ʰ� 82/12/09 ���� ���ų� ���� ����� �̸�, ����, �μ���ȣ�� ����϶�.
SELECT ename, sal, deptno 
FROM emp
WHERE hiredate >= '81/04/02' AND hiredate <= '82/12/19';

--13. �޿��� $1,600 ���� ũ�� $3,000 ���� ���� ������ �̸�,����, �޿��� ����϶�
SELECT ename, job, sal  
FROM emp
WHERE sal > 1600 AND sal < 3000;

--14. ������ȣ�� 7654�� 7782 ���� �̿��� �������� ��� ������ ����϶�
SELECT *
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;

--15. �̸��� B�� J������ ��� ������ ������ ����϶�.
SELECT * 
FROM emp
WHERE ename BETWEEN 'B' AND 'J';

--16. �Ի����� 81�� �̿ܿ� �Ի��� ������ ��� ������ ����϶�.
SELECT * 
FROM emp
WHERE  hiredate NOT BETWEEN  '81/01/01' AND '81/12/31';

--17. ������ MANAGER �̰ų� SALESMAN�� ������ ��� ������ ����϶�
SELECT * 
FROM emp
WHERE job = 'MANAGER' OR job = 'SALESMAN';

--18. �μ���ȣ�� 20, 30���� ������ ��� ������ �̸�, �����ȣ, �μ���ȣ�� ����϶�
SELECT ename, empno, deptno 
FROM emp
WHERE NOT(deptno =20 OR deptno =30);

--19. �̸��� S�� �����ϴ� ������ �����ȣ, �̸�, �Ի���, �μ���ȣ�� ����϶�
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

--20. �Ի����� 81�⵵�� ����� ��� ������ ����϶�
SELECT *
FROM emp
WHERE hiredate LIKE '%81%';

--21. �̸� �� S�ڰ� �� �ִ� ����� ��� ������ ����϶�
SELECT * 
FROM emp
WHERE ename LIKE '%S%';

--22. �̸��� M���� �����ϰ� ������ ���ڰ� N�� ����� ��� ������ ����϶�
--    (��, �̸��� ��ü 6�ڸ��̴�. �ڸ����� �̿��� ���ϵ�ī�� '_' �� �̿�) 
SELECT * 
FROM emp
WHERE  ename LIKE 'M_____' AND ename LIKE '_____N';

--23. �̸��� ù ��° ���ڴ� �������, �� ��° ���ڰ� A�� ����� ������ ����϶�.
SELECT * 
FROM emp
WHERE ename LIKE '_A%';

--24. Ŀ�̼��� NULL�� ����� ������ ����϶�. ( IS NULL �Ǵ� IS NOT NULL ���)
SELECT * 
FROM emp
WHERE comm IS NULL;

--25. Ŀ�̼��� NULL�� �ƴ� ����� ��� ������ ����϶�.(IS NULL �Ǵ� IS NOT NULL ���)
SELECT * 
FROM emp
WHERE comm IS NOT NULL;

--26. �μ��� 30�� �μ��̰� �޿��� $1,500 �̻��� ����� �̸�, �μ�, ������ ����϶�.
SELECT ename, deptno, sal 
FROM emp
WHERE deptno = 30 AND sal >= 1500;

--27. �̸��� ù ���ڰ� K�� �����ϰų� �μ���ȣ�� 30�� ����� �����ȣ, �̸�, �μ���ȣ�� ����϶�.
SELECT empno, ename, deptno 
FROM emp
WHERE ename LIKE 'K%' OR deptno = 30;

--28. �޿��� $1,500 �̻��̰� �μ���ȣ�� 30���� ��� �� ������MANAGER�� ����� ������ ����϶�.
SELECT * 
FROM emp
WHERE sal >= 1500 AND deptno = 30 AND job = 'MANAGER';

--29. �μ���ȣ�� 30�� ����� ��� ������ ����ϰ� ������ȣ�� SORT(����)�϶�.
SELECT * 
FROM emp
WHERE deptno = 30
ORDER BY EMPNO;

--30. �������� �޿��� ���� ������ SORT(����) �϶�.
SELECT * 
FROM emp
ORDER BY sal DESC;

--31. �μ���ȣ��  ASCENDING SORT �� �� �޿��� ���� ��� ������ ����϶�.
--   ( �Ѱ� �̻��� ���� ���Ľ� �޸�(,)�� ����մϴ�.
SELECT * 
FROM emp
ORDER BY deptno , sal DESC;

--32. �μ���ȣ�� DESC SORT�ϰ�, �̸� ������ ASC SORT �޿������� DESC SORT �Ͻÿ�
SELECT deptno, ename, sal 
FROM emp
ORDER BY deptno DESC, ename, sal DESC;

--33. 10�� �μ��� ��� �������� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. �̸�, �޿�, ���ʽ��ݾ�, �μ���ȣ�� ����϶�.
--    (�Ҽ����� �ݿø���.)
SELECT ename, sal, 
ROUND(sal*0.13) BONUS,
deptno
FROM emp
WHERE deptno = 10;

--34. ������ �̸�, �޿�, Ŀ�̼�, �Ѿ�(�޿� + Ŀ�̼�)�� ���Ͽ� �Ѿ��� ���� ������ ����϶�.
--   (��, Ŀ�̼��� null�� ����� 0���� �ؼ� ����.
SELECT ename, sal, NVL(comm, 0), NVL(comm, 0) + sal total
FROM emp
order by total desc;

--35. �޿��� $1,500���� $3,000 ������ ����� ���ؼ��� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���.
--    ��� ����� �̸�, �޿�, ȸ��(�Ҽ����� 2�ڸ����� �ݿø�)�� ����Ͽ���.
--    (��, ȸ��� �޷�ǥ�� $�� �����ϰ� �Ҽ��� 1�ڸ����� ���)
SELECT ename, sal,
TO_CHAR(ROUND(sal*0.15,1),'$999.0') ȸ��
FROM EMP
WHERE sal BETWEEN 1500 AND 3000;

--36. ������� 5���� �Ѵ� �μ��� �μ���� ����� ��ȸ
SELECT d.dname, count(e.empno)
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(e.empno) > 5;

--37. ������ �޿��հ谡 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �� �޿� �հ踦 ��ȸ, 
--    �� �Ǹſ�('SALESMAN')�� �����ϰ�, �� �޿� �հ�� �������� ����
SELECT job, SUM(sal) �޿��հ� 
FROM emp
WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal)>5000;
--ORDER BY �޿��հ� DESC; �ϳ��ۿ� ��� ���ص� �ȴ�.

--38. ������� �����ȣ(empno), �����(ename), �޿�(sal), �޿����(grade)�� ����Ͻÿ�.
--    (���̺� salgrade ����)
SELECT e.empno, e.ename, e.sal, s.grade 
FROM emp e
JOIN salgrade s ON e.sal between s.losal and s.hisal;



--39. �μ���(deptno)�� ����� ���� Ŀ�̼�(comm) �� ���� ����� ���� ����Ͻÿ�.
SELECT deptno, count(*) as "�����", count(comm) as "Ŀ�̼� ���� �����"
FROM emp
GROUP by deptno;

--40. �μ���ȣ(deptno)�� 10�� '�ѹ���', 20�� '���ߺ�', 30�� '������'��� �Ͽ�
--    �μ���ȣ, �μ���, ������ ����Ͻÿ�( decode �� case �Լ� ���)
SELECT ename, deptno,
        decode(deptno, 10, '�ѹ���',
                       20, '���ߺ�',
                       30, '������'
            ) �μ���       
FROM emp;

