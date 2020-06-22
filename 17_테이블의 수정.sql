-- 제약조건의 추가 및 수정
-- 클래스 테이블 생성
CREATE TABLE class ( 
    cno VARCHAR2(2),
    cname VARCHAR2(50)
);
-- 테이블의 새 행을 입력
INSERT INTO class VALUES ( '01', '데이터베이스');
INSERT INTO class VALUES ( '02', '자바');
SELECT * FROM class;

-- 학생 테이블 생성
CREATE TABLE student (
    sno VARCHAR2(4),
    sname VARCHAR2(50),
    cno VARCHAR2(2)
);

-- 학생 테이블에 새 행을 입력
DELETE FROM student; -- 모든 행 삭제
INSERT INTO student VALUES ('0414', '홍길동', '01');
INSERT INTO student VALUES ('0415', '임꺽정', '02');
INSERT INTO student VALUES ('0416', '이순신', '03');
commit; --영구저장

SELECT * FROM student;

-- 클래스 테이블에 기본키 추가
-- 있는 테이블 수정할 때, ALTER TABLE ADD 제약조건
ALTER TABLE class 
ADD CONSTRAINT class_cno_pk PRIMARY KEY(cno);
-- 기본키는 널값이나 중복될 수 없음
INSERT INTO class VALUES ( NULL, '데이터베이스');

-- 클래스 테이블에 유니크 키를 추가
ALTER TABLE class 
ADD CONSTRAINT class_cname_uk UNIQUE (cname);
-- 유니크는 중복안됨
INSERT INTO class VALUES ( '03', '데이터베이스');

-- 제약조건을 조회하는 명령문
SELECT * 
FROM ALL_CONSTRAINTS --모든 제약조건
WHERE table_name = 'DEPARTMENTS'; -- 테이블명 입력시 대문자

-- 학생 테이블에 기본키를 추가
ALTER TABLE student
ADD CONSTRAINT student_sno_pk PRIMARY KEY(sno);
-- 학생 테이블의 sname에 NOT NULL 추가
-- NOT NULL일 경우  ADD를 사용하는게 아니라 MODIFY를 사용
ALTER TABLE student
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;
-- 학생 테이블에 외래키(FOREIGN KEY (테이블명) ) 추가
ALTER TABLE student
ADD CONSTRAINT student_cno_fk FOREIGN KEY(cno) --외래키 추가
    REFERENCES class(cno); -- 클래스 테이블에 cno 열을 참조
SELECT * FROM class;
SELECT * FROM student;
-- 제약조건을 추가할 때 이미 만들어진 테이블에 각 행의 데이터가 만족해야 제약조건이 추가된다.
UPDATE student SET cno = '01'
WHERE sno = '0416';



-- 제약조건의 삭제
-- 제약조건의 이름으로 삭제
-- CASCADE 옵션시 참조하는 외래키도 삭제
ALTER TABLE class 
DROP CONSTRAINT class_cno_pk CASCADE;

-- 제약조건으로 삭제
ALTER TABLE class
DROP UNIQUE (cname); -- 클래스 테이블의 cname 열의 유니크 제약조건 삭제
ALTER TABLE student
DROP PRIMARY KEY; -- 기본키의 삭제

-- 테이블의 삭제
DROP TABLE class;
DROP TABLE student;

-- 테이블 컬럼(열)의 추가와 삭제

-- 90번 부서의 직원들을 새테이블 E_EMP에 입력
CREATE TABLE E_EMP
AS
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id = 90;

-- 열의 이름을 지정해서 E_EMP2 테이블 생성
CREATE TABLE E_EMP2(emp_id, name, sal, dept_id)
AS
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id = 90;

SELECT * FROM E_EMP2;

-- 열의 추가
SELECT * FROM E_EMP;

ALTER TABLE E_EMP
ADD (GENDER VARCHAR2(1) );
-- 디폴트 값을 0으로 하는 열 추가
ALTER TABLE E_EMP
ADD (커미션 NUMBER DEFAULT 0 NOT NULL);
-- 두개의 열의 추가
ALTER TABLE E_EMP
ADD (날짜 DATE DEFAULT SYSDATE, 제작자 VARCHAR2(100) DEFAULT USER);

-- 열의 수정 
SELECT * FROM E_EMP;

-- 데이터 사이즈 수정
ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(200) );  -- 원래 (100) => (200) 사이즈로
DESC e_emp;

ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(50) ); -- 원래 (200) => (50) 사이즈로 

ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(1) ); -- 원래 (50) => (1) 사이즈로  에러발생
ALTER TABLE E_EMP
MODIFY (제작자 NUMBER ); -- 이미 문자형 데이터가 있기 때문에, 숫자형으로 바꿀 수 없음.

SELECT * FROM e_emp;
DESC e_emp;

-- NULL 값인 경우에 입력된 값이 없기 때문에 데이터 형식을 바꿀 수 있음
ALTER TABLE E_EMP
MODIFY (GENDER NUMBER );
-- 제작자의 데이터 형식을 바꾸려 하면
UPDATE E_EMP
SET 제작자 = NULL;

-- 열의 삭제
ALTER TABLE e_emp
DROP COLUMN 제작자; -- 제작자 열 삭제
--여러개의 열 삭제
ALTER TABLE e_emp
DROP (GENDER , 커미션, 날짜);  -- 여러개 열의 삭제

SELECT * FROM e_emp;

-- 열의 이름 수정(RENAME COLUME 컬럼이름 TO 바꿀이름
ALTER TABLE e_emp
RENAME COLUMN department_id TO 부서번호;
ALTER TABLE e_emp
RENAME COLUMN salary TO 급여;
ALTER TABLE e_emp
RENAME COLUMN employee_id TO 직원번호;
ALTER TABLE e_emp
RENAME COLUMN last_name TO 이름;

-- 테이블의 이름 변경
RENAME E_EMP TO 직원테이블;

-- 예제) employees 테이블의 job_id가 'ST_MAN'인 직원들을 새 테이블 stmans 를 만들어 입력하라.
-- 단 테이블의 컬럼 이름은 id, job, sal ( 직원 테이블의 employees_id, job_id, salary)
CREATE TABLE stmans( id, job, sal)
AS
SELECT employee_id, job_id, salary
FROM employees
WHERE job_id = 'ST_MAN';

SELECT * FROM stmans;









