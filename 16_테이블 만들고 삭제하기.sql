-- 테이블 만들기
CREATE TABLE ex_date( -- 테이블 이름
    ex_id       NUMBER(2),   -- 열의 이름, 데이터 타입
    start_date  DATE  DEFAULT sysdate  
    -- 디폴트는 입력안될시 디폴트 뒤의 값으로
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

-- 테이블 삭제하기 DROP TABLE
DROP TABLE comp;
DROP TABLE copy_emp;

--예제) product_id(number 타입), product_name(varchar2 타입, 20자리),
--     menu_date(date 타입) 열이 있는 sample_product 이름의 테이블을 생성해 보세요.
CREATE TABLE sample_product (
    product_id      NUMBER,
    product_name    VARCHAR2(20),
    menu_date       DATE 
);

--예제) 위에서 만든 테이블을 삭제해 보세요. DESCRIBE 절로 테이블이 잘 삭제되었는지 확인하세요.
DESC sample_product;

DROP TABLE sample_product;



-- 테이블의 제약조건
CREATE TABLE emp (
    eno     NUMBER(3) CONSTRAINT emp_eno_pk PRIMARY KEY,
    emp_name VARCHAR2 ( 20)
);
DESC emp;
INSERT INTO emp
VALUES ( 2, '양');
-- 중복 불가능
SELECT * FROM emp;
DROP TABLE emp;

-- 제약조건을 테이블 아래쪽에 적는 방법, primary key(eno) 괄호안에 어떤 테이블인지 알려줘야 한다.
CREATE TABLE emp (
    eno     NUMBER(3),
    emp_name VARCHAR2 ( 20),
     CONSTRAINT emp_eno_pk PRIMARY KEY(eno)
);

-- 제약조건의 이름없이
CREATE TABLE emp1 (
    eno     NUMBER(3) PRIMARY KEY,
    emp_name VARCHAR2 ( 20)
);
INSERT INTO emp1
VALUES ( 1, '박');

DROP TABLE emp1;

-- NOT NULL / UK 유니크
CREATE TABLE emp1 ( 
    eno     NUMBER(3),
    emp_name VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL,
    email    VARCHAR2(30) CONSTRAINT emp1_email_uk UNIQUE
);
-- NOT NULL 은 null 값을 입력할 수 없다.
INSERT INTO emp1
VALUES ( 1, NULL, 'hong@naver.com');
DESC emp1;

-- UK 유니크는 동일한 값이 입력될 수 없다.
INSERT INTO emp1
VALUES ( 1, '홍길동', 'hong@naver.com');
INSERT INTO emp1
VALUES ( 2, '홍길동', 'hong@naver.com');

-- CHECK 제약조건
CREATE TABLE emp2 (
    eno NUMBER(3),
    emp_name VARCHAR2(20) CONSTRAINT emp2_ename_nn NOT NULL,
    sal NUMBER(10),
    CONSTRAINT emp2_sal_check CHECK(sal > 1000)
);
INSERT INTO emp2
VALUES ( 1, '홍길동', 1999); -- sal은 1000보다 커야한다.

DROP TABLE emp;
CREATE TABLE emp (
    eno NUMBER(4) PRIMARY KEY, -- 제약조건 이름 생략
    ename VARCHAR2(20) NOT NULL,
    gno VARCHAR2(13) UNIQUE   CHECK (LENGTH(gno) >= 8),
    gender VARCHAR2(5) CHECK(gender IN ('woman', 'man'))
);
INSERT INTO emp VALUES (1, '김','12345678', 'man');
INSERT INTO emp VALUES (2, '강','123456789', 'woman');
INSERT INTO emp VALUES (3, '양','123456789', 'human');

--예제) members 라는 새 테이블을 만듭니다.(제약조건 이름은 생략가능)
CREATE TABLE members (
    member_id   NUMBER(2) PRIMARY KEY,
    first_name  VARCHAR2(50) NOT NULL,
    last_name   VARCHAR2(50) NOT NULL,
    gender      VARCHAR2(5) CHECK(gender IN ('Man' , 'Woman')),
    birth_day   DATE   DEFAULT sysdate,
    email       VARCHAR2(200) UNIQUE NOT NULL
);
DESC members;

-- 외래키 (Fk)
DROP TABLE dept; -- 테이블 삭제
CREATE TABLE dept(
    dno NUMBER(4),
    dname VARCHAR2(20),
    CONSTRAINT dept_dno_pk PRIMARY KEY(dno) --기본키
);
DROP TABLE emp;
CREATE TABLE emp (
    eno NUMBER(4),
    emp_name VARCHAR2(20),
    sal NUMBER(10),
    dno NUMBER(4),
    CONSTRAINT emp_eno_pk PRIMARY KEY(eno), --기본키
    CONSTRAINT emp_dno_fk FOREIGN KEY(dno) 
    --REFERENCES dept(dno) ON DELETE CASCADE --참조열 삭제시 자동삭제 , REFERENCES dept(dno) ON DELETE CASCADE 
     REFERENCES dept(dno) ON DELETE SET NULL
);
DELETE FROM dept;  -- 모든 행 삭제
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

-- 외래키는 참조열의 값 이외에는 입력불가
INSERT INTO emp VALUES (1060, 'Kang', 500, 60);
-- 단, 널값은 입력가능
INSERT INTO emp VALUES (1060, 'Kang', 500, NULL);

-- 삭제시 에러 발생
DELETE FROM dept
WHERE dno = 30;
--1 참조행 삭제시 자동 삭제
-- ON DELETE CASCASE

--2 참조행 삭제시 자동 널값
-- ON DELETE SET NULL
















