-- ���������� �߰� �� ����
-- Ŭ���� ���̺� ����
CREATE TABLE class ( 
    cno VARCHAR2(2),
    cname VARCHAR2(50)
);
-- ���̺��� �� ���� �Է�
INSERT INTO class VALUES ( '01', '�����ͺ��̽�');
INSERT INTO class VALUES ( '02', '�ڹ�');
SELECT * FROM class;

-- �л� ���̺� ����
CREATE TABLE student (
    sno VARCHAR2(4),
    sname VARCHAR2(50),
    cno VARCHAR2(2)
);

-- �л� ���̺� �� ���� �Է�
DELETE FROM student; -- ��� �� ����
INSERT INTO student VALUES ('0414', 'ȫ�浿', '01');
INSERT INTO student VALUES ('0415', '�Ӳ���', '02');
INSERT INTO student VALUES ('0416', '�̼���', '03');
commit; --��������

SELECT * FROM student;

-- Ŭ���� ���̺� �⺻Ű �߰�
-- �ִ� ���̺� ������ ��, ALTER TABLE ADD ��������
ALTER TABLE class 
ADD CONSTRAINT class_cno_pk PRIMARY KEY(cno);
-- �⺻Ű�� �ΰ��̳� �ߺ��� �� ����
INSERT INTO class VALUES ( NULL, '�����ͺ��̽�');

-- Ŭ���� ���̺� ����ũ Ű�� �߰�
ALTER TABLE class 
ADD CONSTRAINT class_cname_uk UNIQUE (cname);
-- ����ũ�� �ߺ��ȵ�
INSERT INTO class VALUES ( '03', '�����ͺ��̽�');

-- ���������� ��ȸ�ϴ� ��ɹ�
SELECT * 
FROM ALL_CONSTRAINTS --��� ��������
WHERE table_name = 'DEPARTMENTS'; -- ���̺�� �Է½� �빮��

-- �л� ���̺� �⺻Ű�� �߰�
ALTER TABLE student
ADD CONSTRAINT student_sno_pk PRIMARY KEY(sno);
-- �л� ���̺��� sname�� NOT NULL �߰�
-- NOT NULL�� ���  ADD�� ����ϴ°� �ƴ϶� MODIFY�� ���
ALTER TABLE student
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;
-- �л� ���̺� �ܷ�Ű(FOREIGN KEY (���̺��) ) �߰�
ALTER TABLE student
ADD CONSTRAINT student_cno_fk FOREIGN KEY(cno) --�ܷ�Ű �߰�
    REFERENCES class(cno); -- Ŭ���� ���̺� cno ���� ����
SELECT * FROM class;
SELECT * FROM student;
-- ���������� �߰��� �� �̹� ������� ���̺� �� ���� �����Ͱ� �����ؾ� ���������� �߰��ȴ�.
UPDATE student SET cno = '01'
WHERE sno = '0416';



-- ���������� ����
-- ���������� �̸����� ����
-- CASCADE �ɼǽ� �����ϴ� �ܷ�Ű�� ����
ALTER TABLE class 
DROP CONSTRAINT class_cno_pk CASCADE;

-- ������������ ����
ALTER TABLE class
DROP UNIQUE (cname); -- Ŭ���� ���̺��� cname ���� ����ũ �������� ����
ALTER TABLE student
DROP PRIMARY KEY; -- �⺻Ű�� ����

-- ���̺��� ����
DROP TABLE class;
DROP TABLE student;

-- ���̺� �÷�(��)�� �߰��� ����

-- 90�� �μ��� �������� �����̺� E_EMP�� �Է�
CREATE TABLE E_EMP
AS
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id = 90;

-- ���� �̸��� �����ؼ� E_EMP2 ���̺� ����
CREATE TABLE E_EMP2(emp_id, name, sal, dept_id)
AS
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id = 90;

SELECT * FROM E_EMP2;

-- ���� �߰�
SELECT * FROM E_EMP;

ALTER TABLE E_EMP
ADD (GENDER VARCHAR2(1) );
-- ����Ʈ ���� 0���� �ϴ� �� �߰�
ALTER TABLE E_EMP
ADD (Ŀ�̼� NUMBER DEFAULT 0 NOT NULL);
-- �ΰ��� ���� �߰�
ALTER TABLE E_EMP
ADD (��¥ DATE DEFAULT SYSDATE, ������ VARCHAR2(100) DEFAULT USER);

-- ���� ���� 
SELECT * FROM E_EMP;

-- ������ ������ ����
ALTER TABLE E_EMP
MODIFY (������ VARCHAR2(200) );  -- ���� (100) => (200) �������
DESC e_emp;

ALTER TABLE E_EMP
MODIFY (������ VARCHAR2(50) ); -- ���� (200) => (50) ������� 

ALTER TABLE E_EMP
MODIFY (������ VARCHAR2(1) ); -- ���� (50) => (1) �������  �����߻�
ALTER TABLE E_EMP
MODIFY (������ NUMBER ); -- �̹� ������ �����Ͱ� �ֱ� ������, ���������� �ٲ� �� ����.

SELECT * FROM e_emp;
DESC e_emp;

-- NULL ���� ��쿡 �Էµ� ���� ���� ������ ������ ������ �ٲ� �� ����
ALTER TABLE E_EMP
MODIFY (GENDER NUMBER );
-- �������� ������ ������ �ٲٷ� �ϸ�
UPDATE E_EMP
SET ������ = NULL;

-- ���� ����
ALTER TABLE e_emp
DROP COLUMN ������; -- ������ �� ����
--�������� �� ����
ALTER TABLE e_emp
DROP (GENDER , Ŀ�̼�, ��¥);  -- ������ ���� ����

SELECT * FROM e_emp;

-- ���� �̸� ����(RENAME COLUME �÷��̸� TO �ٲ��̸�
ALTER TABLE e_emp
RENAME COLUMN department_id TO �μ���ȣ;
ALTER TABLE e_emp
RENAME COLUMN salary TO �޿�;
ALTER TABLE e_emp
RENAME COLUMN employee_id TO ������ȣ;
ALTER TABLE e_emp
RENAME COLUMN last_name TO �̸�;

-- ���̺��� �̸� ����
RENAME E_EMP TO �������̺�;

-- ����) employees ���̺��� job_id�� 'ST_MAN'�� �������� �� ���̺� stmans �� ����� �Է��϶�.
-- �� ���̺��� �÷� �̸��� id, job, sal ( ���� ���̺��� employees_id, job_id, salary)
CREATE TABLE stmans( id, job, sal)
AS
SELECT employee_id, job_id, salary
FROM employees
WHERE job_id = 'ST_MAN';

SELECT * FROM stmans;









