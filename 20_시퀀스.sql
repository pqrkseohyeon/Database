-- 시퀀스
-- 시퀀스 생성
CREATE SEQUENCE 시퀀스1;  -- 생성
DROP SEQUENCE 시퀀스1;  -- 삭제

-- 시퀀스 이름으로 시퀀스 정보 출력
SELECT * FROM USER_SEQUENCES
WHERE sequence_name = '시퀀스1';

-- 시퀀스 테스트 듀얼 테이블에서
SELECT 시퀀스1.NEXTVAL FROM DUAL;  -- 시퀀스 사용 .nextval
SELECT 시퀀스1.CURRVAL FROM DUAL;  -- 시퀀스의 현재값( 값을 증가하지 않고 현재값)

-- 시퀀스 테스트용 테이블 생성
CREATE TABLE 부서_테스트 (
    부서번호 NUMBER PRIMARY KEY,
    부서이름 VARCHAR2(100)
);

INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES ( 시퀀스1.NEXTVAL, '영업부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES ( 시퀀스1.NEXTVAL, '개발부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES ( 시퀀스1.NEXTVAL, '회계부');
COMMIT; -- 영구저장
SELECT * FROM 부서_테스트;

-- 시퀀스 옵션 사용
-- 시퀀스2 생성 - 시작값을 10, 증가값을 20
CREATE SEQUENCE 시퀀스2
START WITH 10   -- 10번부터 시작
INCREMENT BY 20; -- 증가값이 20

DELETE FROM 부서_테스트; -- 부서테스트 테이블의 모든 행을 삭제

INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES ( 시퀀스2.NEXTVAL, '영업부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES ( 시퀀스2.NEXTVAL, '개발부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES ( 시퀀스2.NEXTVAL, '회계부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES ( 시퀀스2.NEXTVAL, '마케팅부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES ( 시퀀스2.NEXTVAL, '교육부');
COMMIT; -- 영구저장
SELECT * FROM 부서_테스트;

-- 시퀀스1로 부서번호를 업데이트
UPDATE 부서_테스트
SET 부서번호 = 시퀀스1.NEXTVAL;

-- 테이블 삭제 
DROP  TABLE 부서_테스트;
DROP SEQUENCE 시퀀스1;
DROP SEQUENCE 시퀀스2;
DROP TABLE dept CASCADE CONSTRAINTS; --제약조건도 같이 삭제
DROP TABLE emp;
DROP TABLE emp1;
DROP TABLE emp2;
DROP TABLE e_emp2;
DROP TABLE ex_date;
DROP TABLE 직원테이블;
DROP TABLE stmans;
DROP TABLE members;



