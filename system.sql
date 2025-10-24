-- c##을 사용안하도록 설정
-- 오라클버전이 업데이트되면서 사용자 설정할 때 사용자 아이디 앞에 c##을 붙이도록 설정되어있다. 
-- hr 사용자 생성 -> c##hr 로 되는데 그것을 막지위한 것이며 현재 세션에서만 유용한 것이다.
ALTER SESSION SET "_oracle_script"=TRUE;

--@C:\Users\soldesk\Downloads\db-sample-schemas-main\db-sample-schemas-main\human_resources\hr_install.SQL
--@C:\app\soldesk\product\21c\dbhomeXE\rdbms\admin\scott.sql

--sys AS sysdba