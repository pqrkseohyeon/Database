-- ���̺� �����
CREATE TABLE ex_date( -- ���̺� �̸�
    ex_id       NUMBER(2),   -- ���� �̸�, ������ Ÿ��
    start_date  DATE  DEFAULT sysdate  
    -- ����Ʈ�� �Է¾ȵɽ� ����Ʈ ���� ������
);
INSERT INTO ex_date(ex_id)
VALUES (1);
INSERT INTO ex_date(ex_id)
VALUES (2);
INSERT INTO ex_date(ex_id)
VALUES (3);
COMMIT;
SELECT * FROM ex_date;
DESC ex_date;

-- ���̺� �����ϱ� DROP TABLE
DROP TABLE comp;
DROP TABLE copy_emp;

--����) product_id(number Ÿ��), product_name(varchar2 Ÿ��, 20�ڸ�),
--     menu_date(date Ÿ��) ���� �ִ� sample_product �̸��� ���̺��� ������ ������.
CREATE TABLE sample_product (
    product_id      NUMBER,
    product_name    VARCHAR2(20),
    menu_date       DATE 
);

--����) ������ ���� ���̺��� ������ ������. DESCRIBE ���� ���̺��� �� �����Ǿ����� Ȯ���ϼ���.
DESC sample_product;

DROP TABLE sample_product;



-- ���̺��� ��������
CREATE TABLE emp (
    eno     NUMBER(3) CONSTRAINT emp_eno_pk PRIMARY KEY,
    emp_name VARCHAR2 ( 20)
);
DESC emp;
INSERT INTO emp
VALUES ( 2, '��');
-- �ߺ� �Ұ���
SELECT * FROM emp;
DROP TABLE emp;

-- ���������� ���̺� �Ʒ��ʿ� ���� ���, primary key(eno) ��ȣ�ȿ� � ���̺����� �˷���� �Ѵ�.
CREATE TABLE emp (
    eno     NUMBER(3),
    emp_name VARCHAR2 ( 20),
     CONSTRAINT emp_eno_pk PRIMARY KEY(eno)
);

-- ���������� �̸�����
CREATE TABLE emp1 (
    eno     NUMBER(3) PRIMARY KEY,
    emp_name VARCHAR2 ( 20)
);
INSERT INTO emp1
VALUES ( 1, '��');

DROP TABLE emp1;

-- NOT NULL / UK ����ũ
CREATE TABLE emp1 ( 
    eno     NUMBER(3),
    emp_name VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL,
    email    VARCHAR2(30) CONSTRAINT emp1_email_uk UNIQUE
);
-- NOT NULL �� null ���� �Է��� �� ����.
INSERT INTO emp1
VALUES ( 1, NULL, 'hong@naver.com');
DESC emp1;

-- UK ����ũ�� ������ ���� �Էµ� �� ����.
INSERT INTO emp1
VALUES ( 1, 'ȫ�浿', 'hong@naver.com');
INSERT INTO emp1
VALUES ( 2, 'ȫ�浿', 'hong@naver.com');

-- CHECK ��������
CREATE TABLE emp2 (
    eno NUMBER(3),
    emp_name VARCHAR2(20) CONSTRAINT emp2_ename_nn NOT NULL,
    sal NUMBER(10),
    CONSTRAINT emp2_sal_check CHECK(sal > 1000)
);
INSERT INTO emp2
VALUES ( 1, 'ȫ�浿', 1999); -- sal�� 1000���� Ŀ���Ѵ�.

DROP TABLE emp;
CREATE TABLE emp (
    eno NUMBER(4) PRIMARY KEY, -- �������� �̸� ����
    ename VARCHAR2(20) NOT NULL,
    gno VARCHAR2(13) UNIQUE   CHECK (LENGTH(gno) >= 8),
    gender VARCHAR2(5) CHECK(gender IN ('woman', 'man'))
);
INSERT INTO emp VALUES (1, '��','12345678', 'man');
INSERT INTO emp VALUES (2, '��','123456789', 'woman');
INSERT INTO emp VALUES (3, '��','123456789', 'human');

--����) members ��� �� ���̺��� ����ϴ�.(�������� �̸��� ��������)
CREATE TABLE members (
    member_id   NUMBER(2) PRIMARY KEY,
    first_name  VARCHAR2(50) NOT NULL,
    last_name   VARCHAR2(50) NOT NULL,
    gender      VARCHAR2(5) CHECK(gender IN ('Man' , 'Woman')),
    birth_day   DATE   DEFAULT sysdate,
    email       VARCHAR2(200) UNIQUE NOT NULL
);
DESC members;

-- �ܷ�Ű (Fk)
DROP TABLE dept; -- ���̺� ����
CREATE TABLE dept(
    dno NUMBER(4),
    dname VARCHAR2(20),
    CONSTRAINT dept_dno_pk PRIMARY KEY(dno) --�⺻Ű
);
DROP TABLE emp;
CREATE TABLE emp (
    eno NUMBER(4),
    emp_name VARCHAR2(20),
    sal NUMBER(10),
    dno NUMBER(4),
    CONSTRAINT emp_eno_pk PRIMARY KEY(eno), --�⺻Ű
    CONSTRAINT emp_dno_fk FOREIGN KEY(dno) 
    --REFERENCES dept(dno) ON DELETE CASCADE --������ ������ �ڵ����� , REFERENCES dept(dno) ON DELETE CASCADE 
     REFERENCES dept(dno) ON DELETE SET NULL
);
DELETE FROM dept;  -- ��� �� ����
INSERT INTO dept VALUES (10, 'TEST1');
INSERT INTO dept VALUES (20, 'TEST2');
INSERT INTO dept VALUES (30, 'TEST3');
INSERT INTO dept VALUES (40, 'TEST4');
INSERT INTO dept VALUES (50, 'TEST5');
SELECT * FROM dept;

INSERT INTO emp VALUES (1010, 'Kim', 200, 10);
INSERT INTO emp VALUES (1020, 'Lee', 180, 20);
INSERT INTO emp VALUES (1030, 'Jung', 220, 30);
INSERT INTO emp VALUES (1040, 'Oh', 250, 40);
INSERT INTO emp VALUES (1050, 'King', 300, 50);
SELECT * FROM emp;

-- �ܷ�Ű�� �������� �� �̿ܿ��� �ԷºҰ�
INSERT INTO emp VALUES (1060, 'Kang', 500, 60);
-- ��, �ΰ��� �Է°���
INSERT INTO emp VALUES (1060, 'Kang', 500, NULL);

-- ������ ���� �߻�
DELETE FROM dept
WHERE dno = 30;
--1 ������ ������ �ڵ� ����
-- ON DELETE CASCASE

--2 ������ ������ �ڵ� �ΰ�
-- ON DELETE SET NULL
















