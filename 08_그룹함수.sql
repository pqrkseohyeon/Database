-- �׷��Լ�
SELECT COUNT(*)
FROM employees;
-- employees ���̺��� ��ü �� ������ �����ش�.

SELECT salary
FROM employees
ORDER BY salary DESC;

-- MAX MIN
SELECT MAX(salary), MIN(salary)
FROM employees;
-- �����Լ��� �̿��ؼ� �ִ� salary, �ּ� salary �� �����ش�.

-- ���ڿ��� ����
SELECT MAX(first_name), MIN(first_name)
FROM employees;
--max�� ���ĺ� �߿� ���ϵڿ� �ִ°� ���, min�� ���� �տ� �ִ°� ���

-- ��¥�� ����
SELECT MAX(hire_date), MIN(hire_date)
FROM employees;
--max�� ���� ������ ���, min�� ���� �ֱ�

-- sum, AVG : �հ�� ��� (����)
SELECT SUM(salary), AVG(salary)
FROM employees;

-- COUNT
SELECT COUNT(*) -- �������̺��� ������� ����
FROM employees;

SELECT COUNT(NVL(commission_pct, 0)) --NULL ���� �ƴ� ���� ����, NVL�� ����ϸ� ���� ������ �� �� �ִ�. 
FROM employees;

-- department_id�� ���� ������ 1���� �ֱ� ������ 106�� ���´�
SELECT COUNT(DISTINCT department_id) -- �ߺ��� ������ �μ��� ���� 
FROM employees;

-- 90�� �μ��� ������ ����
SELECT COUNT(employee_id)
FROM employees
WHERE department_id = 90;

SELECT AVG(commission_pct) -- �ΰ��� ������ ���
FROM employees;

--GROUP BY�� ������ �����Լ� ���
SELECT department_id, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id;
-- SELECT ���� ����ִ� �÷��� GROUP BY ������ �ʼ��� ���� �Ѵ�. 

SELECT department_id �μ���ȣ, 
ROUND(AVG(salary)) ��ձ޿�,
SUM(salary) �ѱ޿��հ�,
COUNT(*) �μ��ο���
FROM employees
GROUP BY department_id;

SELECT department_id �μ���ȣ, job_id ����,
ROUND(AVG(salary)) ��ձ޿�,
SUM(salary) �ѱ޿��հ�,
COUNT(*) �μ����������ο���
FROM employees
GROUP BY department_id, job_id;

--����1)
SELECT  department_id �μ���ȣ,
COUNT(*) �����,
MAX(salary) �ִ�޿�, 
MIN(salary) �ּұ޿�,
SUM(salary) �޿��հ�,
ROUND(AVG(salary)) �޿����
FROM employees
GROUP BY department_id
ORDER BY �޿��հ� DESC;

--����2)
SELECT department_id �μ���ȣ, job_id ����, manager_id ����ȣ,
SUM(salary) �޿��հ�,
COUNT(*) ������
FROM employees
GROUP BY department_id, job_id, manager_id
ORDER BY �μ���ȣ;

--����3) 
SELECT ROUND(AVG(MAX(salary))), AVG(MIN(salary))
FROM employees
GROUP BY department_id;

--Having �� �׷��Լ��� �̿��� ������
SELECT department_id �μ���ȣ, SUM(salary) �޿��հ� 
FROM employees
WHERE SUM(salary) > 100000 --�׷��Լ� ��� ����
GROUP BY department_id
ORDER BY department_id;

SELECT department_id �μ���ȣ, SUM(salary) �޿��հ� 
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000 --�׷��Լ� ��� ����
ORDER BY department_id;

--����)
SELECT job_id ����, SUM(salary) �޿��հ�
FROM employees
WHERE job_id != 'AC_MGR'  -- �Ϲ�����
GROUP BY job_id
HAVING AVG(salary) > 10000 -- �׷��Լ� ����
ORDER BY �޿��հ� DESC; 

--����2)
SELECT department_id �μ���ȣ, ROUND(AVG(salary)) ��ձ޿�
FROM  employees
WHERE department_id != 40
GROUP BY department_id
HAVING AVG(salary) <= 7000;

--����3)
SELECT job_id ����, sum(salary) �޿��հ�
FROM employees
WHERE job_id NOT LIKE '%REP%'  --'REP' ����ִ� ��������
GROUP BY job_id
HAVING SUM(salary)  >= 13000
ORDER BY �޿��հ� DESC;


















