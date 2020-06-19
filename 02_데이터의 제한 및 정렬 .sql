-- 1. ���̺��� ��� ������ ��������
SELECT * FROM employees;
-- 2. where ���� ������ ���ǿ� �´� ���� �����Ѵ�.
--    ��ġ�� from  �� ������ ��ġ
SELECT * 
FROM employees
WHERE department_id = 90; --90�� �μ���

SELECT * 
FROM employees
WHERE salary = 24000; -- ������ 24000�� ������
/*
where ���� ����� �� ������
����(string) �� ��¥(Data) ���� �׻� ����ǥ(')�� ǥ��
���ڰ��� ��ҹ��ڸ� �����Ѵ�.(Case-Sensitive)
��¥���� ��¥���˿� ����� �ʵ��� (Format- Sensitive)
����Ŭ�� ��¥������ RR/MM/DD(RR�� 2�ڸ� �⵵)
*/

--3 WHERE + ���ڿ�(''ǥ�� ������Ѵ�.)
--�̸��� ��Ƽ���� ����� ã�´�.
select employee_id, first_name, last_name, job_id
from employees
WHERE first_name = 'Steven';

--4 WHERE + ��¥
select SYSDATE  
FROM DUAL;
--DUAL�� �������̺�  SYSDATE �� ���� ��¥ �ð�

SELECT * 
from employees
WHERE hire_date >= '03/06/17'; --�⵵/��/��¥

--5 �� ������
SELECT * 
from employees
WHERE salary  >= 10000; --���ں�

SELECT * 
from employees
WHERE hire_date >= '03/06/17'; --��¥��

SELECT * 
from employees
WHERE first_name > 'King'; --���ں�(���ĺ���,ū �� ���� ���´�)

--����1  employees ���̺��� employee_id�� 100�� ���� ������ ����ϼ���
SELECT * 
FROM employees
WHERE employee_id = 100;

--����2 employees ���̺��� first_name �� David �� ���� ������ ����ϼ���
SELECT * 
FROM employees
WHERE first_name = 'David';

--����3 employees ���̺��� employees_id�� 105 ������ ���� ������ ����ϼ���.
SELECT * 
FROM employees
WHERE employee_id <= 105;

--����4 
SELECT * 
FROM job_history
WHERE start_date > '06/03/03';

--����5
SELECT * 
FROM departments
--WHERE location_id <> 1700; --!= 1700
WHERE location_id != 1700;

-- 6. AND OR
--�μ���ȣ�� 60���̰�, salary�� 10000�̻��� �����͸� �����ش�.
SELECT * 
FROM employees
WHERE department_id = 60 OR
    (department_id = 80 AND salary > 10000);

--()�� ��� ���̴����� ���� ��� ���� �޶�����.
SELECT * 
FROM employees
WHERE (department_id = 60 OR
    department_id = 80) AND salary > 10000;
    
--hire_date�� 08/04/04 �̰ų� salary�� 13000 �̻��� ����� ��µȴ�. ()�� ���� ���� and�� ���� ��µȴ�.    
SELECT * 
FROM employees
WHERE hire_date > '08/04/04' OR salary > 13000
    AND  job_id = 'AD_VP';

--not�� ���̸� ����� �ݴ�� �ٲ� ���´�.   
SELECT * 
FROM employees
WHERE NOT (hire_date > '04/01/01' OR salary > 5000);
--(hire_date <= '04/01/01' AND salary <= 5000)   

--����1)
SELECT * 
FROM employees
WHERE salary > 4000 and job_id = 'IT_PROG';

--����2)
SELECT * 
FROM employees
WHERE salary > 4000 AND (job_id = 'IT_PROG' or job_id = 'FI_ACCOUNT');

-- IN ������
--OR ��� ����� �� �ִ� ������
--salary�� 4000�̰ų� 3000�̰ų� 2700�� ����� ���
SELECT * 
FROM employees
WHERE salary = 4000 OR salary = 3000 OR salary = 2700;

--OR�� ��� ������ ������ ������� ������ IN �����ڸ� �̿��ؼ� �� �����ϰ� �� �� �ִ�.
SELECT * 
FROM employees
WHERE salary IN (4000, 3000, 2700);

--����1) employees ���̺��� salary�� 10000, 17000, 24000d�� ���� ������ ���
SELECT * 
FROM employees
WHERE salary IN(10000, 17000, 24000);

--����2) employees ���̺��� department_ID�� 30, 50, 80, 100,110�� �ƴ� �μ������鸸 ���(NOT IN ���)
SELECT * 
FROM employees
WHERE  department_id NOT IN (30, 50, 80, 100,110);

--Between ������
--AND�� ����Ǿ� �����鼭, ���� ���� �� ���̿� ���� �� AND ��� ����� �� �ִ� ������
SELECT * 
FROM employees
WHERE salary >= 9000 AND salary <=10000;

SELECT * 
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

--����1)
SELECT * 
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--����2)
SELECT * 
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';

--����3)
--BETWEEN �� ����ϸ� 7000~17000 ������ �����͸� ����ϴµ�,  NOT BETWEEN �� ����ϸ� 7000���� �̸��̰ų�, 17000 �̻��� ū ���� ����� �� �ִ�.
SELECT * 
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000; 

