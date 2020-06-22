-- �ܼ��� View ����� EMP_V1
-- �ϳ��� �������̺� ���, �Լ��� �׷� ��� ����, DML ��밡��

DROP VIEW EMP_V1; -- �̸� �� ���� ���

-- employees ���̺��� �ʿ��� ������ ��� ��� ����
CREATE VIEW EMP_V1
AS
SELECT employee_id, last_name, email, hire_date,  job_id
FROM employees;

-- ���̺�ó�� select �� ���
select * from emp_v1;

DESC emp_v1;

-- ���̺�ó�� DML ��밡��(��� ������ ���̺� => ���� ���̺� �Էµ�)
INSERT INTO EMP_V1 (employee_id, last_name, email, hire_date,  job_id)
VALUES  (1333, 'David' , 'DAVIDx' , SYSDATE, 'IT_PROG');
-- �信 �Էµ� ������ Ȯ��
SELECT * FROM emp_v1;
SELECT * FROM employees;
DESC employees;

-- �����ϱ�
DELETE FROM emp_v1
WHERE employee_id = 1333;
COMMIT;

-- �ι�° �� �����
CREATE VIEW EMP_V2
AS
SELECT employee_id ������ȣ, last_name �̸�, email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v2;

-- ����° �� �����
CREATE VIEW EMP_V3 ( ������ȣ, �̸�, �̸���, �������, ����)
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v1;
SELECT * FROM emp_v2;
SELECT * FROM emp_v3;
SELECT * FROM employees;

-- DML ��� 3��° �信��
INSERT INTO emp_v3 ( ������ȣ, �̸�, �̸���, �������, ����)
VALUES (334, 'LaLa', 'LALA' , SYSDATE , 'IT_PROG');


-- ������ �� �����
-- �׷��Լ��� ����� ��� DML ��� �Ұ�
-- CREATE OR REPLACE�� �並 ����ų� �̹� ������� ������ ������ �ϰų�, �� �� �ϳ��� ���ش�.
-- OR REPLACE �� ����Ͽ� ������ ������
CREATE or REPLACE VIEW �μ���_����_����
AS
SELECT department_id �μ���ȣ, COUNT(employee_id) ������,
    MAX(salary) �ְ�޿�, MIN(salary) �����޿�,
   ROUND( AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY �μ���ȣ;

SELECT * FROM �μ���_����_����;

-- �б� ���� �� ( �ɼ� with READ ONLY)
CREATE or REPLACE VIEW EMP_V_read
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees
WHERE department_id =  90
WITH READ ONLY; -- �б� ����

SELECT * FROM emp_v_read;

-- �б� ���� �信���� DML ��� �Ұ�
DELETE FROM EMP_V_READ; -- ��� �� ����

-- üũ �ɼ� ��
CREATE or replace VIEW emp_v_check
AS
SELECT employee_id, last_name, email, hire_date, job_id, department_id
FROM employees
WHERE department_id =  90
WITH check option; -- where���� ���ǿ����� ���� �� �Է� ����

SELECT * FROM emp_v_check;

-- 90�� �μ��϶��� DML ����
INSERT INTO emp_v_check ( employee_id, last_name, email, hire_date, job_id, department_id)
VALUES (444, '�˸�', 'ALI', SYSDATE, 'IT_PROG', 90);

















