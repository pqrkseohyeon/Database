-- ������ �ּ��Դϴ�. ����Ű�� CTRL+/
/*
������ �ּ�
�� �ٴ� ���
*/
--1.���̺��� ��� ��� ���� �о����*
SELECT * 
FROM departments;
--2.Ư�� ���� �о����
select department_id, department_name
from departments;
--3.��� ������ ���(+,-,*,/)
SELECT employee_id, first_name, salary, salary+100,salary + (salary * 0.1) 
FROM employees;

--4.��(null) �̶�?
-- ���� �Էµ��� ����, ��밡������ ����, �� �� ���� ��
-- �ΰ��� ����(0) �Ǵ� ����("")���� �ٸ���.
SELECT last_name, job_id, salary, commission_pct 
FROM employees;

SELECT last_name, job_id, salary, 
commission_pct, commission_pct + 10
FROM employees;

-- 5. �ߺ��� �� ���� : distinct
SELECT DISTINCT job_id 
FROM employees;

--����1,2,3
select employee_id �����ȣ, first_name �̸�, last_name ��, salary, salary *1.1  ��������
from employees;

-- ���� ������(||)
SELECT last_name||' is a ' || job_id as "���� ����" 
FROM employees;

--�̸��� ���� ���Ῥ���ڸ� ����ؼ� ������ �߰��ؼ� ��ĭ ����ش�.
select employee_id, first_name||' '||last_name 
from employees;

--����4
select employee_id, first_name||last_name,email||'@company.com'
from employees;
