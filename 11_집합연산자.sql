-- ���տ�����(UNION ��)

-- UNION, ������ �ߺ����� : 115��
SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

-- UNION ALL, �ߺ� ���� : 117��
SELECT employee_id, job_id
FROM employees
UNION ALL

SELECT employee_id, job_id
FROM job_history;

-- INTERSECT , ������ : 2�� 
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

-- MINUS ������ : 105��
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

--����)employees ���̺��� department_id ���հ� departments ���̺���
--    department_id ������ UNION �����ڸ� �̿��� ���� ������.
SELECT department_id
FROM employees
union
SELECT department_id
FROM departments;

-- ����)employees ���̺��� department_id ���հ� departments ���̺���
--     department_id ������ UNION ALL �����ڸ� �̿��� ���� ������.
SELECT department_id
from employees
union all
select department_id
FROM departments;

-- ����) employees ���̺��� department_id ���հ� departments ���̺���
--      department_id ������ �������� INTERSECT �����ڸ� �̿��� ����� ������.
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

-- ����) departments ���̺��� department_id ���տ��� employees ���̺��� 
--      department_id ������ MINUS �����ڸ� �̿��� �� ������. 
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;
















