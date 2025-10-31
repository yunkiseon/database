-- c##을 사용안하도록 설정
-- 오라클버전이 업데이트되면서 사용자 설정할 때 사용자 아이디 앞에 c##을 붙이도록 설정되어있다. 
-- hr 사용자 생성 -> c##hr 로 되는데 그것을 막지위한 것이며 현재 세션에서만 유용한 것이다. -> DBeaver을 종료하면 다시 해야 함.
ALTER SESSION SET "_oracle_script"=TRUE;

--@C:\Users\soldesk\Downloads\db-sample-schemas-main\db-sample-schemas-main\human_resources\hr_install.SQL
--@C:\app\soldesk\product\21c\dbhomeXE\rdbms\admin\scott.sql

--sys AS sysdba

--권한을 부여: GRANT
GRANT CREATE VIEW TO SCOTT;
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;



--사용자
--데이터베이스에 접속하여 데이터 관리하는 계정 하지만 자신에게 할당된 범위 내에서만 가능하다

--오라클의 데이터베이스의 경우
--테이블, 뷰, 인덱스, 시퀀스 등 -> 업무별 사용자 생성 후 객체 생성할 수 있는 권한 부여
--CREATE USER 사용자이름 IDENTIFIED BY 비밀번호;

--공통 사용자 또는 롤 이름이 부적합합니다. 라고 출력되는 이유 : 오라클 버전이 올라가며 C##이라는 접두어가 必
--CREATE USER TEST1 IDENTIFIED BY 12345;

CREATE USER C##TEST1 IDENTIFIED BY 12345;

--하지만 위의 alter session set "_oracle_script" = true 를 실행한 세션이라면 아래만으로도 가능하다.

CREATE USER TEST2 IDENTIFIED BY 12345;

--오라클, xe test2로 연결하려고 하면 creat session 권한을 가지고 있지 않음; 로그온이 거절되었습니다 출력됨
--권한 자체가 매우 다양하다. 그 권한에 따라서 어떠한 업무에 참여할 수 있는가가 나뉘어진다. 

GRANT CREATE SESSION TO TEST2;
--를 통해서 연결할 수 있는 권한을 부여해주어야 한다. 하지만 테이블 생성 등이 불가능하다. create table, alter, drop 등....

--이러한 개별권한 등이 너무 많아서 묶어서 관리한다 -> 롤
--grant connect, resource to test2; 등의 식이다.
GRANT CONNECT, RESOURCE TO TEST2;
--테이블스페이스 'users'에 대한 권한이 없습니다. 의 경우에는 아래로 하면 된다. 2M은 생각보다 작은 범위이니 넉넉히 주는 것이 편리하다.
--ALTER USER test2 DEFAULT TABLESPACE USERS QUOTA 2M ON USERS;

--이렇게 하면 너무 번거롭기 때문에 아예 생성시 부여할 수 있다. 
--사용자 생성

CREATE USER javadb IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA 10M ON USERS;

--권한 부여
GRANT CONNECT, RESOURCE TO javadb;
--까지가 사용자 생성 시 하나의 세트라고 기억해두자.

--사용자 삭제
--'TEST2'(을)를 삭제하려면 CASCADE를 지정하여야 합니다
--DROP USER test2 CASCADE;
--DROP USER test3 CASCADE;


--권한 취소
--REVOKE 취소할권한이름 FROM 사용자명
--REVOKE CREATE SESSION FROM test2;

-- 비밀번호변경 
--alter user test3 identified by 변경할비밀번호








