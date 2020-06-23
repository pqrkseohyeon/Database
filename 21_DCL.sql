-- DCL : DATA CONTROL LANGUAGE 데이터 제어 언어
-- 데이터의 사용권한을 관리
-- GRANT : 특정 사용자에게 수행 권한을 부여
-- REVOKE : 특정 사용자에게 수행 권한을 회수 및 박탈

-- 새 유저 만들기
CREATE USER John Identified by 1234;  -- 새 유저 존을 만들고, 비빌번호 1234
-- 접속 권한 주기
GRANT CREATE SESSION TO John;  -- John 유저에게 접속 권한 주기
-- 테이블 생성 권한 부여
GRANT CREATE TABLE TO John;
-- 테이블 스페이스 ( 테이블을 저장할 수 있는 공간)
CREATE TABLESPACE johnSpace
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' SIZE 10M
AUTOEXTEND ON NEXT 5M;
-- johnspace라는 테이블 저장공간 생성
-- 파일의 경로 설정, 최초 사이즈는 10m byte 
-- 자동으로 테이블 공간이 부족하면 5mbyte씩 추가됨

-- 존 계정이 이 테이블 스페이스를 사용할 수 있도록
ALTER USER John DEFAULT TABLESPACE johnSpace;  -- 디폴트 존스페이스로
ALTER USER John QUOTA UNLIMITED ON johnSpace;  -- 테이블 스페이스 사용권한

-- 롤(role) 부여
GRANT CONNECT, RESOURCE to John;
-- Connect 롤은 접속관련 권한들의 모음
-- Resource 롤은 여러객체들 ( 테이블, 뷰 등) 을 생성 및 사용 권한

-- 권한을 제거 및 회수 (관리자계정에서만)  REVOKE + 권한 + FROM + 유저
REVOKE CREATE TABLE FROM John;

-- 롤을 제거 및 회수
REVOKE RESOURCE FROM John;

-- John 계정을 삭제
DROP USER John CASCADE;

-- 테이블 스페이스 삭제
DROP TABLESPACE johnspace;

-- 현재 생성되어 있는 계정 확인
SELECT * FROM ALL_USERS;
SELECT * FROM DBA_USERS;

-- 사용자에 부여된 시스템 권한 확인
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE = 'HR';


















