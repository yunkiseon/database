--sql
--1. 데이터 정의 언어(DDL : Data Define Language)
--2. 데이터 조작 언어(DML : Data Manipulation Language) : SELECT(조회), INSERT(입력), UPDATE(수정), DELETE(삭제)
--3. 데이터 제어 언어(DCL : Data Control Language)
 

--sql 구문은 대소문자를 구별하지 않지만 비밀번호는 대소문자 구별한다. 
 
 --조회(select)
 --select 컬럼명 --> 5번
 --from 테이블명 --> 1번으로 해석시작
 --where 조건절 --> 2번
 --group by --> 3번
 --having --> 4번
 --order by 컬럼명 desc or asc  --> 6번
 
-- emp(사원) 테이블 
-- 컬럼명 : 타입
-- empno(사번) : number(4,0) -> 숫자, 4자리, 소수점 아래 자릿수는 0 라고 해석한다 
 --ename(이름) : varchar2(10) -> 문자 10자리
 --job(직무) : varchar2(9)
 -- mgr(상사번호) : number(4,0)
 --hiredate(입사일) : date
 --sal(급여) : number(7,2)
 --comm(수당) : number(7,2)
 --deptno(부서번호) : number(2,0)   ///// 
 
 --dept 테이블도 확인
 --deptno(부서번호) 
 --dname(부서명)
 --loc(부서위치)
 
 --조회 기본 구문
 --SELECT 보고싶은열이름.... FROM 테이블명;
 --SELECT 보고싶은열이름.... FROM 테이블명 WHERE 조건 나열;
 
 --1) 전체 사원 조회/사원의 모든 정보 추출 
 SELECT * FROM  EMP e ;
 
--2) 전체 사원의 이름만 추출
 SELECT ename FROM EMP e ;

-- 3) 전체 사원 조회 시 사번, 사원명, 부서번호만 추출 
 SELECT empno,ename,deptno FROM EMP e ;

 --4) 전체 사원 조회 시 부서번호만 추출
 SELECT deptno FROM EMP e;
 
 --5) 전체 사원 조회 시 부서번호만 추출 + 중북된 데이터 제거
 SELECT DISTINCT deptno FROM  EMP e;
 
 --6) 별칭-> alais 붙이기
 SELECT ename "사원명" FROM EMP e ;
 SELECT ename 사원명 FROM EMP e ; 
 SELECT ename AS "사원명" FROM  EMP e ;
 
 --연봉구하기(sal * 12 + comm)
 SELECT empno, sal * 12 + comm AS 연봉 FROM EMP e ;
 
 SELECT ename AS "사원 이름" FROM EMP e ;
 
 -- 정렬 ( 오름차순, 내림차순) : order by 정렬기준 열이름... asc(오름차순) desc(내림차순)

 --급여의 오름차순 정령(기본이 오름차순이여서 기준을 따로 설정하지 않으면 오름차순 정렬로 된다.)
 SELECT * FROM  emp ORDER BY sal ASC;
 SELECT * FROM EMP e ORDER BY sal;
 --급여의 내림차순
 SELECT * FROM  emp ORDER BY sal DESC;
 
 --급여의 내림차순, 이름의 오름차순
 SELECT * FROM EMP e ORDER BY sal DESC,ename ASC;
 
 --실습
 --empno : employee_no
 --ename : employee_name
 --mgr : manager
 --sal : salary
 --comm : commission
 --deptno : department_no
 --별칭 지정, 부서번호를 기준으로 내림차순 정렬, 단 부서번호가 같다면 이름 오름차순
 
 SELECT
	empno AS employee_no,
	ename AS emplyee_name,
	mgr AS manager,
	sal AS salary,
	comm AS commission,
	deptno AS departmant_no
FROM
	EMP e
ORDER BY
	deptno DESC,
	ename ASC;
 
 -- 부서번호가 30번인 사원정보를 조회
 
 SELECT * FROM emp wHERE deptno = 30;
 
 -- 사번이 7698 인 사원정보 조회
 SELECT * FROM emp WHERE empno = 7698;
 
 --부서번호가 30번이고 사원직책이 salesman 인 사원정보 조회
 -- 자바랑 달리 같다는 == 가 아니나 =, 문자할 땐 홑따옴표, 입력된 값은 대소문자 구별있다, and 를 쓴다 & 가 아님. or 도 || 안씀
 SELECT * FROM EMP e WHERE deptno =30 AND job = 'SALESMAN';
 --부서번호가 30번이거나 사원직책이 analyst 인 사원정보 조회
 SELECT * FROM EMP e WHERE deptno = 30 OR job = 'ANALYST';
 
 --연산자 
 -- +, -, *, /, =, >, <,>=, <=, and, or, 같지않다[!=, <>, ^=]
 -- in, betwee A and B(이상-이하), 
 --like 
 
 --연봉이 36000인 사원 조회
 SELECT * FROM EMP e WHERE sal * 12 = 36000;
 
 -- 급여가 3000 초과인 사원 조회 
 SELECT * FROM EMP e WHERE sal > 3000;
 
 -- 이름이 'F' 이후의 문자로 시작하는 사원 조회
 SELECT * FROM EMP e WHERE e.ENAME >= 'F';
 
 --직무가 manager, salesman, clerk 인 사원 조회
 SELECT * FROM EMP e WHERE job = 'SALESMAN' OR e.JOB = 'MANAGER' OR e.JOB = 'CLERK';
 
 --sal 이 3000이 아닌 사원 조회 
 SELECT * FROM EMP e WHERE e.SAL != 3000;
 SELECT * FROM EMP e WHERE e.SAL <> 3000;
 SELECT * FROM EMP e WHERE e.SAL ^= 3000;
 
 --직무가 manager, salesman, clerk 인 사원 조회 + in
 sELECT * FROM EMP e WHERE job IN ('SALESMAN', 'MANAGER', 'CLERK');
 SELECT * FROM EMP e WHERE e.JOB NOT IN ('SALESMAN', 'MANAGER', 'CLERK');
 
 --부서번호가 10, 20 번인 사원 조회
 SELECT * FROM EMP e WHERE e.DEPTNO = 10 OR e.DEPTNO = 20;
 SELECT * FROM EMP e WHERE e.DEPTNO IN (10, 20);
 
 --between a and b
 --급여가 2000 이상 3000 이하인 사원 조회
 SELECT * FROM EMP e WHERE e.SAL >= 2000 AND e.SAL <=3000;
 SELECT * FROM EMP e WHERE e.SAL BETWEEN 2000 AND 3000;
 
 -- 급여가 2000 아성 3000 이하인 사원 조회
 SELECT * FROM EMP e  WHERE  e.SAL NOT BETWEEN 2000 AND 3000;
 
 --like + 와일드카드(%, _)
 --% : 길이와 상관없이(문자없는 경우도 포함) 모든 문자 데이터를 의미
 --_ : 한개의 문자 데이터를 의미
 --사원명이 S로 시작하는 사원들의 정보 조회
 SELECT * FROM EMP e WHERE e.ENAME LIKE 'S%';--S 뒤에 무엇이 와도, 안와도 괜찮다는 뜻
 --사원명이 두번째 글자가 L인 사원들의 정보 조회
 SELECT * FROM EMP e WHERE e.ENAME LIKE '_L%';
 --사원이름에 AM이 포함된 사원들의 정보 조회 
 SELECT * FROM EMP e WHERE e.ENAME LIKE '%AM%';
 --사언이름에 AM이 포함되지 않은 사원들의 정보 조회
 SELECT * FROM EMP e WHERE e.ENAME NOT LIKE '%AM%';
 
 --null 값 
 -- null 값은 비교 시 = or != 사용하지 않음
-- SELECT  * FROM EMP e WHERE comm = NULL; 아무런 것도 출력되지 않는다 
 SELECT * FROM emp WHERE comm IS NULL;
 SELECT * FROM emp WHERE comm IS NOT NULL;
 
 --집합 연산자 
 --합집합(UNION, UNION ALL ), 교집합(INTERSECT), 차집합(MINUS)
 
 --합집합 : 출력하려는 열 개수와 자료형이 일치
 --union : 중복 제거
 --deptno=10 union deptno =20
 SELECT
	e.EMPNO, e.ENAME, e.SAL
FROM
	EMP e
WHERE
	e.DEPTNO = 10
UNION 
 SELECT
	e.EMPNO, e.ENAME, e.SAL
FROM
	EMP e
WHERE
	e.DEPTNO = 20;
 
 
 -- union all
  SELECT
	e.EMPNO, e.ENAME, e.SAL
FROM
	EMP e
WHERE
	e.DEPTNO = 10
UNION ALL 
 SELECT
	e.EMPNO, e.ENAME, e.SAL
FROM
	EMP e
WHERE
	e.DEPTNO = 10;
 
 
 --minus
   SELECT
	e.EMPNO, e.ENAME, e.SAL
FROM
	EMP e
MINUS
 SELECT
	e.EMPNO, e.ENAME, e.SAL
FROM
	EMP e
WHERE
	e.DEPTNO = 10;
 
 
 --intersect
    SELECT
	e.EMPNO, e.ENAME, e.SAL
FROM
	EMP e
INTERSECT 
 SELECT
	e.EMPNO, e.ENAME, e.SAL
FROM
	EMP e
WHERE
	e.DEPTNO = 10;
 
 --[실습]
 -- 1. 사원 이름이 s로 끝나는 사원 데이터 조회
 
 SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE '%S';
 
 --2. 30번 부서에 근무하고 있는 사원 중에 JOB이 SALESMAN 인 사원의 사원번호, 이름, 직책, 급여, 부서번호 조회
 
 SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.SAL,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.DEPTNO = 30
	AND e.JOB = 'SALESMAN';
 --3. 20번, 30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 다음 두 방식의 select 문을 사용하여 
 --사원번호, 이름, 직책, 급여 부서 번호를 출력
 --집합 연산자를 사용하는 방식
 
 SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.SAL > 2000
 MINUS
 SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.DEPTNO = 10;
 
 SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.DEPTNO = 20
	AND e.SAL > 2000
UNION 
  SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.DEPTNO = 30
	AND e.SAL > 2000;
 --집합 연산자를 사용하지 않는 방식
  SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.DEPTNO IN (20, 30)
	AND e.SAL > 2000;
 
 SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.DEPTNO
FROM
	EMP e
WHERE
	(e.DEPTNO = 20
		OR e.DEPTNO = 30)
	AND e.SAL > 2000;
 -- 괄호없이 하면 and가 부서번호 30에만 적용됨
 --4. NOT BETWEEN A AND B 연산자를 사용하지 않고 급여열이 2000 이상 3000 이하 범위 이외의 값을 가진 데이터 조회
 
 SELECT
	*
FROM
	EMP e
WHERE
	e.SAL > 3000
	OR e.SAL < 2000;
 --5. 사원 이름에 E가 포함된 30번 부서의 사원 중 급여가 1000~2000 사이가 아닌 사원명, 사번, 급여, 부서번호 조회
 
 SELECT
	e.ENAME,
	e.EMPNO,
	e.SAL,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.ENAME LIKE '%E%'
	AND e.DEPTNO = 30
	AND e.SAL NOT BETWEEN 1000 AND 2000;
 --6. 추가 수당이 없고 상급자가 있고 직책이 MANAGER, CLERK인 사원 중에 사원 이름이 두번째 글자가 L이 아닌
 --사원의 정보를 조회
 
 SELECT *
 FROM EMP e 
 WHERE e.COMM IS NULL AND e.MGR IS NOT NULL AND e.JOB IN ('MANAGER', 'CLERK') AND e.ENAME NOT LIKE '_L%';
 
 --함수
 -- 1. 문자함수
 -- UPPER(문자열) : 대문자 변환
 --LOWER(문자열) : 소문자 변환
 --INITCAP(문자열) : 첫글자는 대문자, 나머지 문자는 소문자
 --LENGTH(문자열) : 문자열 길이
 --LENGTHB(문자열) : 문자열의 바이트 길이
 --SUBSTR(문자열 데이터, 시작위치, 추출길이) : 문자열 부분 추출
 --INSTR(대상문자열, 위치를 찾으려는 문자, 위치찾기시작위치, 찾으려는 문자가 몇 번째인지) : 문자열 데이터 안에서 특정문자 위치 찾기
 --REPLACE(문자열, 찾는문자, 바꿀문자) 
 --CONCAT(문자열1, 문자열2) : 두 문자열 데이터 합치기
 --TRIM(삭제옵션(선택), 삭제할문자(선택) FROM 원본문자열)
 --1) 삭제옵션 : LEADING OR TRAILING OR BOTH
 --LTRIM(원본문자열, 삭제할 문자열)
 --RTRIM(원본문자열, 삭제할 문자열)
 
 SELECT ename, UPPER(ename), lower(ename), INITCAP(ename)
 FROM EMP e ;
 
 -- 영어는 1 바이트라 동일하게 출력됨
 SELECT ename, length(ename), lengthb(ename)
 FROM EMP e ;
 
 --임시연산, 테이블 없이 함수결과값을 보기 위한 테이블 dual
 --SYS 소유의 테이블이고 더미 테이블이다
 SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;
 -- length 는 2 lengthb는 6 즉 한글은 한자당 3바이트 사용한다
 --length의 용도-> 사원명 길이가 5이상인 사원 조회
 SELECT *
 FROM EMP e 
 WHERE LENGTH(e.ENAME) >= 5;
 -- 직책명 6자 이상인 사원 조회
 SELECT *
 FROM EMP e 
 WHERE LENGTH(e.JOB) >= 6;
 
 --substr (정보, 시작위치, 개수) 개수 안적으면 시작위치에서 부터 끝까지 추출
 SELECT job, SUBSTR(e.JOB,1,2), substr(e.job,3,2), SUBSTR(e.JOB,5)
 FROM EMP e;
 
 -- emp 테이블에서 사원명을 세번째 글자부터 끝까지 출력
 SELECT e.ENAME, SUBSTR(e.ENAME,3) 
 FROM EMP e;
 
 --substr 시작위치 음수로 주기 -> salesman 이라면 -1이 n, -8이 S 다
 SELECT e.ENAME, SUBSTR(e.ENAME,-1)
 FROM emp e;
 
 SELECT job, SUBSTR(e.JOB,-LENGTH(E.JOB)), SUBSTR(e.job,-LENGTH(e.JOB),2), SUBSTR(e.JOB,-3)
 FROM EMP e;
 
 --INSTR
 SELECT INSTR('HELLO, ORACLE!', 'L') AS 첫번째, INSTR('HELLO, ORACLE!', 'L', 5) AS 두번째, INSTR('HELLO, ORACLE!', 'L',2,2) AS 세번째
 FROM DUAL; --3, 12, 4
 
 --사원명에 문자 S가 포함된 사원 조회 
 -- 1) like 2) instr()
 SELECT * FROM EMP e WHERE e.ENAME LIKE '%S%';
 SELECT * FROM EMP e WHERE INSTR(e.ENAME, 'S') > 0;
 
 --010-4526-7858 에서 -를 공백으로 바꾸고 싶을 때. 혹은 공백도 없애고 싶다면
 --REPLACE
 SELECT '010-4526-7858' AS BEFORE, REPLACE('010-4526-7858','-',' ') AS replace1 , REPLACE('010-4526-7858','-') AS replace2
 FROM DUAL;
 
 --EMPNO, ENAME 합치기
 SELECT CONCAT(e.EMPNO, e.ENAME)
 FROM EMP e;
 
 -- 사이에 : 첨가하려면 아래와 같은 형식이다 || 을 사용해도 가능
 SELECT CONCAT(e.EMPNO, CONCAT(':', e.ENAME)), e.EMPNO || e.ENAME, e.EMPNO || ':' || e.ENAME
 FROM EMP e;          
 
 --TRIM() : 일반 트림은 양쪽 공백 삭제, 리딩은 앞만, 트레일은 뒤만, 보스는 양쪽 공백 모두 삭제
 SELECT 
 '[' || TRIM(' __Orcle__ ') ||']' AS trim,
 '[' || TRIM(LEADING from ' __Orcle__ ') ||']' AS trim_leading,
 '[' || TRIM(TRAILING from ' __Orcle__ ') ||']' AS trim_trailing,
 '[' || TRIM(BOTH from ' __Orcle__ ') ||']' AS trim_both
 FROM DUAL;
 
 --문자열 삭제의 경우
 SELECT 
 '[' || TRIM(' _Orcle_ ') ||']' AS trim,
 '[' || LTRIM(' _Orcle_ ') ||']' AS ltrim,
 '[' || LTRIM('<_Orcle_> ','_<') ||']' AS ltrim2,
 '[' || RTRIM(' _Orcle_ ') ||']' AS rtrim,
 '[' || RTRIM('<_Orcle_>','>_') ||']' AS rtrim2
 FROM DUAL;--_oracl, oracle_>, _oracle_, <_oracle 출력
 
 --2. 숫자함수
 --ROUNG(숫자, 반올림위치) : 반올림
 --TRUNC(숫자, 버림위치) : 버림
 --CEIL(숫자) : 지정된 숫자보다 큰 정수 중 가장 작은 정수 반환
 --FLOOR(숫자) : 지정된 숫자보다 작은 정수 중 가장 큰 정수 반환
 --MOD(숫자, 나눌 숫자) : 지정된 숫자를 나눈 나머지 반환
 
 SELECT -- 1,234 / 1,235/ 1,234.6/ 1,234.57/ 1,230/ 1,200
  ROUND(1234.5678) AS ROUND,
  ROUND(1234.5678, 0) AS ROUND0,
  ROUND(1234.5678, 1) AS ROUND1,
  ROUND(1234.5678, 2) AS ROUND2,
  ROUND(1234.5678,-1) AS ROUND_MINUS1,
  ROUND(1234.5678,-2) AS ROUND_MINUS2
 FROM 
 	DUAL;
 
 
 SELECT--1,234/1,234/1,234.5/1,234.56/1,230/1,200
  TRUNC(1234.5678) AS TRUNC,
  TRUNC(1234.5678, 0) AS TRUNC0,
  TRUNC(1234.5678, 1) AS TRUNC1,
  TRUNC(1234.5678, 2) AS TRUNC2,
  TRUNC(1234.5678,-1) AS TRUNC_MINUS1,
  TRUNC(1234.5678,-2) AS TRUNC_MINUS2
 FROM 
 	DUAL;
 
 SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
 FROM DUAL;
 
 SELECT MOD(15,6), MOD(10,2), MOD(11,2)
 FROM DUAL;--3,0,1
 
 --날짜 함수
 --날짜 데이터 + 숫자 : 이후 날짜 반환
 --날짜 데이터 - 숫자 : 이전 날짜 반환
 --날짜 데이터 + 날짜 데이터 : 연산불가
 --날짜 데이터 - 날짜 데이터 : 두 날짜 데이터 간의 일수 차이 반환
 --ADD_MONTH(날짜데이터, 더할개월 수)
 --MONTHS_BETWEEN(날짜데이터1, 날짜데이터2)
 --NEXT_DAY(날짜데이터1, 요일문자)
 --LAST_DAY(날짜데이터)
 
 --오라클에서 시스템 날짜 출력 : SYSDATE
 SELECT SYSDATE, SYSDATE+1, SYSDATE-1, CURRENT_DATE, CURRENT_TIMESTAMP
 FROM DUAL;
 
 SELECT SYSDATE, ADD_MONTHS(SYSDATE,3)
 FROM DUAL;
 
 --입사 50주년이 되는 날짜 구하기 
 SELECT e.HIREDATE, ADD_MONTHS(e.HIREDATE, 600)
 FROM EMP e;
 
 --입사한지 40년이 넘은 사원 조회
 SELECT e.HIREDATE
 FROM EMP e 
 WHERE ADD_MONTHS(e.HIREDATE, 480) < SYSDATE;
 
 SELECT 
 e.EMPNO,
 e.HIREDATE,
 SYSDATE,
 MONTHS_BETWEEN(e.HIREDATE, SYSDATE) AS MONTH1,
 MONTHS_BETWEEN(SYSDATE, e.HIREDATE) AS MONTH2,
 TRUNC(MONTHS_BETWEEN(SYSDATE, e.HIREDATE)) AS MONTH3
 FROM EMP e;
 
 SELECT SYSDATE, LAST_DAY(SYSDATE), NEXT_DAY(SYSDATE, '월요일')
 FROM DUAL;
 
 --형변환
 --TO_CHAR(): 날짜나 숫자 데이터를 문자로 변환(중요)
 --TO_NUMBER() : 문자를 숫자로 변환
 --TO_DATE() : 문자 데이터를 날짜 데이터로 변환
 
 -- 만약 년월일만 출력하고 싶다면, FORMAT 필요, 
 SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD')
 FROM DUAL;
 
 SELECT e.EMPNO, e.ENAME, e.EMPNO + '500'--''로 문자로 넣었지만 자동으로 형변환하여 더하기 해줌 자동형변환개념
 FROM EMP e 
 WHERE e.ENAME = 'SMITH';
 
 --JAVA : YYYY:mm:DD hh:MM:ss
 SELECT 
 	SYSDATE,
 	TO_CHAR(SYSDATE, 'MM'),
 	TO_CHAR(SYSDATE, 'MON'),
 	TO_CHAR(SYSDATE, 'MONTH'),
 	TO_CHAR(SYSDATE, 'DD'),
 	TO_CHAR(SYSDATE, 'DAY')
 FROM DUAL;
 
 SELECT 
 	SYSDATE,
 	TO_CHAR(SYSDATE, 'HH24:MI:SS'),
 	TO_CHAR(SYSDATE, 'HH24:MI:SS AM'),
	TO_CHAR(SYSDATE, 'HH24:MI:SS P.M.')
FROM DUAL;

SELECT e.SAL, TO_CHAR(e.SAL, '$999,999'), TO_CHAR(e.SAL, 'L999,999')--L은 지역 화폐를 의미함
FROM EMP e;


SELECT 1300 - '1500', '1300' + 1500, '1300' + '1500'
FROM DUAL;

-- , 넣은 경우 수차가 부적합합니다 가 출력된다. 그럴땐  TO_NUMBER를 사용하면 된다
SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
FROM DUAL;

SELECT TO_DATE('20251027', 'YYYY-MM-DD'), TO_DATE('20251027', 'YYYY/MM/DD')
FROM DUAL;

SELECT TO_DATE('2025-10-27') - TO_DATE('2025-09-23')
FROM DUAL;

--null 처리 함수
--1. NVL(널에 해당하는 열, 반환할 데이터) : 널인 경우만 반환할 데이터로 돌아옴 
--2.  NVL2(널에 해당하는 열, 널이 아닐때 반환할 데이터, 반환할 데이터)
--null+null = null
--숫자 + null = null
SELECT empno, ename, sal, comm,comm + sal FROM emp;
SELECT empno, ename, sal, comm,NVL(comm, 0) + sal FROM emp;
SELECT empno, ename, sal, comm, NVL2(comm, '0', 'x'), NVL2(comm, sal * 12 + comm , sal * 12) FROM emp;

--DECODE, CASE 함수 상황에 따라 다른 데이터를 반환
--직책이 manager 인 사원은 급여의 10%, SALESMAN 인 사원은 급여의 5%, ALAYST 인 사원은 그대로, 나머지는 3%만큼 인상된 급여 구하기

--DACODE(검사대상이 될 열 또는 데이터, 
--[조건1],[조건1과 일치할 때 반환할 결과]
--[조건 2], [조건2와 일치할 때 반환할 결과]
--...
--[위에 나열한 조건과 일치하지 않는 경우 반환할 결과])
SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.SAL,
	DECODE(e.JOB, 'MANAGER', e.SAL * 1.1,
	'SALESMAN', e.SAL * 1.05,
	'ANALYST', e.SAL,
	e.SAL * 1.03) AS 급여
FROM
	EMP e;
	
--case 검사 대상이 될 열 또는 데이터 
--when [조건1] then [조건1과 일치할 때 반환할 결과]
--when [조건2] then [조건2과 일치할 때 반환할 결과]
--when [조건3] then [조건3과 일치할 때 반환할 결과]
--else [위에 나열한 조건과 일치하지 않는 경우 반환할 결과]
--end 

SELECT 
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.SAL,
	CASE e.job
	WHEN 'MANAGER' THEN e.SAL * 1.1
	WHEN 'SALESMAN' THEN e.SAL * 1.05
	WHEN 'ANALYST' THEN e.SAL
	ELSE e.SAL * 1.03
END AS 급여
FROM emp e;

-- comm 이 null 인 경우 해당없음, 0인 경우에는 수당없음, 0보다 큰 경우에는 수당 : 800
-- case 의 특징은 = 말고도 다양한 조건활용이 가능하다 , 각 조건에 사용하는 데이터가 연관성이 없어도 괜찮다
SELECT
	e.EMPNO,
	e.ENAME,
	e.COMM,
	CASE
		WHEN e.comm IS NULL THEN '해당없음'
		WHEN e.comm = 0 THEN '수당없음'
		WHEN e.comm > 0 THEN '수당 : ' || e.comm
	END AS comm_text
FROM
	EMP e;

--emp 테이블에서 사원의 월 평균 근무일수는 21.5일이다
--하루 근무시간울 8시간으로 보았을 때 사원의 하루급여(DAY_PAY), 시급(TIME_PAY)를 계산하여 결과를 출력
--하루 급여는 소수 셋째 자리에서 버리고, 시급은 소수 둘째 자리에서 반올림 
SELECT
	e.EMPNO,
	ename,
	e.sal,
	e.COMM ,
	TRUNC(e.SAL / 21.5, 2) AS DAY_PAY,
	ROUND((e.SAL / 21.5) / 8, 1) AS TIME_PAY,
FROM
	EMP e;


-- emp 테이블에서 사원은 입사일 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다. 사원이 정직원이 되는 날짜(R_JOB)을 
--YYYY-MM-DD 형식으로 출력. 단, 추가수당이 없는 사원의 추가수당은 N/A로 출력
--empno, ename, hiredate, r_job, comm 출력

SELECT
	e.EMPNO,
	e.ENAME,
	e.HIREDATE,
	e.COMM ,
	TO_CHAR(NEXT_DAY(ADD_MONTHS(e.HIREDATE, 3), '월요일'), 'YYYY/MM/DD') AS R_JOB,
	NVL(TO_CHAR(e.COMM), 'N/A') AS COMM
FROM
	EMP e;

SELECT
	e.EMPNO,
	e.ENAME,
	e.HIREDATE,
	e.COMM ,
	TO_CHAR(NEXT_DAY(ADD_MONTHS(e.HIREDATE, 3), '월요일'), 'YYYY/MM/DD') AS R_JOB,
	CASE 
		WHEN e.comm IS NULL THEN 'N/A'
		WHEN e.comm IS NOT NULL THEN to_char(e.comm)
	END AS COMM
	FROM
	EMP e;

SELECT NVL(TO_CHAR(e.COMM),'N/A')--comm 은 number 타입인데 문자를 담으라고 해서 오류가 난 것이라 tochar하면 됨
FROM EMP e;

--emp 테이블의 모든 사원을 대상으로 직속 상관의 사원번호(mgr)을 아래의 조건을 기준으로 변환해서 chg_mgr 열에 출력
--조건
--직속 상관의 번호가 없는 경우 0000
--직속 상관의 사원번호 앞 두자리가 75 일 때 5555
--직속 상관의 사원번호 앞 두자리가 76 일 대 6666
--직속 상관의 사원번호 앞 두자리가 77 일 때 7777
--직속 상관의 사원번호 앞 두자리가 78 일 때 8888
--직속 상관의 사원번호 앞 두자리가 79 일 때 9999
-- 그외 직속상관 사원 번호일 때 : 본래 직속상관의 사원번호 그대로 출력

SELECT e.empno,
e.ename,
e.hiredate,
e.mgr,
CASE substr(to_char(NVL(e.MGR, 0)), 1, 2) 
	WHEN '0' THEN '0000'
	WHEN '75' THEN '5555'
	WHEN '76' THEN '6666'
	WHEN '77' THEN '7777'
	WHEN '78' THEN '8888'
	ELSE TO_CHAR(e.mgr)
END AS CHG_MGR
FROM EMP e;

SELECT e.empno,
e.ename,
e.hiredate,
e.mgr,
DECODE(substr(to_char(e.MGR), 1, 2) ,
NULL, '0000',
'75', '5555',
'76', '7777',
'78', '8888',
TO_CHAR(e.mgr)
) AS CHG_MGR
FROM EMP e;


--like 로도 가능
SELECT e.empno,
e.ename,
e.hiredate,
e.mgr,
CASE
	WHEN e.MGR IS null THEN '0000'
	WHEN e.MGR LIKE '75%%' THEN '5555'
	WHEN e.MGR LIKE '76%%' THEN '6666'
	WHEN e.MGR LIKE '77%%' THEN '7777'
	WHEN e.MGR LIKE '78%%' THEN '8888'
	ELSE TO_CHAR(e.mgr)
END AS CHG_MGR
FROM EMP e;

-- 위까지는 단일행 함수였다. 
--다중행 함수
--sum(), avg(), count(), max(), min()

SELECT SUM(DISTINCT e.SAL), AVG(e.SAL), MAX(e.SAL), MIN(e.SAL), COUNT(*)
FROM EMP e;

-- 단일 그룹의 함수가 아닙니다. 
--SELECT SUM(e.SAL), e.ENAME
--FROM EMP e 

-- 10번 부서의 급여 총계, 평균 구하기 
SELECT SUM(e.SAL), AVG(e.SAL)
FROM EMP e 
WHERE e.DEPTNO = 10;

-- 20번 부서의 제일 오래된 입사일 
SELECT MIN(e.HIREDATE)
FROM emp e
WHERE e.DEPTNO = 20;


--group by 
--다중행 함수 옆에 올 수 있는 컬럼은 GROUP BY 에 사용한 컬럼만 가능
--부서별 급여평균 조회 
SELECT e.DEPTNO,AVG(e.SAL)
FROM EMP e 
GROUP BY e.DEPTNO;

--부서별, 직무별 급여평균
SELECT e.DEPTNO, e.JOB,AVG(e.SAL)
FROM EMP e 
GROUP BY e.DEPTNO, e.JOB
ORDER BY e.DEPTNO, e.JOB;

--부서별 추가수당 평균
SELECT e.DEPTNO, AVG(nvl(e.COMM,0))
FROM EMP e 
GROUP BY e.DEPTNO;

--group by 열이름 having : 그룹 잡은 것에서 출력그룹제한
--평균이 2000 이상인 그룹. 부서별, 직무별 급여 평균 조회
--쓰는이유: where 을 그룹 함수에서 사용불가능
SELECT e.DEPTNO, e.JOB,AVG(e.SAL)
FROM EMP e 
GROUP BY e.DEPTNO, e.JOB
WHERE AVG(e.SAL) >= 2000
ORDER BY e.DEPTNO, e.JOB;

--where 절과 having 절 비교
--실행순서의 차이, where이 우선순위가 위에 있어서 3000 이하 먼저 적용된다
SELECT e.DEPTNO, e.JOB,AVG(e.SAL)
FROM EMP e 
WHERE e.SAL  <= 3000
GROUP BY e.DEPTNO, e.JOB
HAVING AVG(e.SAL) >= 2000
ORDER BY e.DEPTNO, e.JOB;
 

--emp 테이블을 이용하여 부서번호, 평균급여(avg_sal), 최고급여(max_sal), 최저급여(min_sal), 사원수 조회(cnt)
--단, 평균급여 출력 시 소수점을 제외하고 각 부서번호별로 출력
SELECT
	e.DEPTNO,
	floor(AVG(e.SAL)) AS avg_sal,
	MAX(e.SAL) AS max_sal,
	MIN(e.SAL) AS min_sal,
	COUNT(*) AS cnt
FROM
	EMP e
GROUP BY
	e.DEPTNO
ORDER BY
	e.DEPTNO;
--같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력
SELECT e.JOB, COUNT(e.EMPNO) AS cnt
FROM EMP e
GROUP BY e.JOB
HAVING COUNT(e.EMPNO) >= 3;


--사원들의 입사연도를 기준으로 부서별로 몇 명이 입사했는지 출력
--1981-09-28 yyyy로 그룹핑 필요 tocahr

SELECT e.DEPTNO, TO_CHAR(e.HIREDATE, 'YYYY'), COUNT(e.DEPTNO) AS cnt
FROM EMP e 
GROUP BY TO_CHAR(e.HIREDATE, 'YYYY'), e.DEPTNO;


--조회 : join/subquery
--join : 여러 테이블을 하나의 테이블처럼 사용
--1. 내부조인(INNER JOIN) : 교집합
--2. 외부조인(OUTER JOIN) :
--	(1) LEFT OUTER JOIN : 가장많이 사용. 왼쪽 테이블 기준, 교집합포함, 교집합 제외 가능
--	(2) RIGHT OUTER JOIN : 우측 테이블 기준 삼아서 교집합 포함, 제외 가능
--	(3) FULL OUTER JOIN : 모든 테이블, 혹은 모든 테이블에서 교집합 제외 가능
--등가조인 : 같은 칼럼이 있음 비등가조인 : 같은 칼럼이 없음

-- emp에서 자료를 뽑는데, deptno 를 뽑을 때 dname이나 loc도 알고 싶다면? emp table과 dept table 필요하다.
-- 처음오는 테이블이 왼쪽 테이블 on 뒤에 어떤 조인을 할지 결정, 등가조인의 경우 칼럼을 선택해야한다. e일지 d일지 말이다.
-- inner를 붙여도 안붙여도 작동된다
SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.DEPTNO,
	d.DNAME
FROM
	EMP e
INNER JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO;

--위와 같다, 하지만 위가 표준이다
SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.DEPTNO,
	d.DNAME
FROM
	EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO AND e.SAL >= 2000;

--비등가 join + 내부조인
--salgrade 에서 같은 값은 없지만 sal 이 어떤 범주에 들어가는지 알수있다
SELECT *
FROM EMP e JOIN SALGRADE s ON e.SAL BETWEEN s.LOSAL AND s.HISAL;

--셀프조인 
--스미스의 매니저번호 7902이다. 7902이 사번인 사람은 포드다. 이러한 경우 쓴다. 
-- 즉, 매니저번호와 사번을 매칭하여 이름을 추출하기 위한 상황이다.
SELECT
	e1.EMPNO,
	e1.ENAME,
	e1.MGR,
	e2.ENAME AS 매니저명
FROM
	EMP e1
JOIN EMP e2 ON
	e1.MGR = e2.EMPNO;

--외부조인
-- 위와 left 를 추가했을 뿐인데 king 추가됨 outer 생략가능
--본래 king은 매니저번호가 없으니까 출력 x 이지만 테이블 기준을 왼쪽으로 잡아서 지금은 출력된다.
SELECT
	e1.EMPNO,
	e1.ENAME,
	e1.MGR,
	e2.ENAME AS 매니저명
FROM
	EMP e1
LEFT OUTER JOIN EMP e2 ON
	e1.MGR = e2.EMPNO;

--우측테이블로하면 모두 출력 + 매니저가 아닌 사람들 즉 사원들것 한번씩더 출력
SELECT
	e1.EMPNO,
	e1.ENAME,
	e1.MGR,
	e2.ENAME AS 매니저명
FROM
	EMP e1 
RIGHT OUTER JOIN EMP e2 ON
	e1.MGR = e2.EMPNO;

-- + 부서명 조회
-- group by에 dname을 안적고 select에서 하는 것은 안된다.           
SELECT
	e.DEPTNO, d.DNAME,
	floor(AVG(e.SAL)) AS avg_sal,
	MAX(e.SAL) AS max_sal,
	MIN(e.SAL) AS min_sal,
	COUNT(*) AS cnt
FROM
	EMP e JOIN DEPT d ON e.DEPTNO =d.DEPTNO
GROUP BY
	e.DEPTNO, d.DNAME 
ORDER BY
	e.DEPTNO;

--테이블 3개 연동
-- 부서번호, 부서명, 사번, 사원며으 매니저번호, 급여, 급여등급 
--부서명 dept
--사번, 사원명, 매니저번호, 급여, 부서번호 : emp 
-- 급여등급: salgrade 
SELECT
	e.DEPTNO,
	d.DNAME,
	e.EMPNO,
	e.ENAME,
	e.MGR,
	e.SAL,
	s.GRADE
FROM
	EMP e
JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO
JOIN SALGRADE s ON 
	e.SAL BETWEEN s.LOSAL AND s.HISAL;


--subqury : 메인 쿼리 외에 select 구문이 여러 개 존재하는 것
--SELECT e.ENAME, (SELECT * FROM EMP e2)
--FROM EMP e JOIN (select)
--WHERE e.DEPTNO = (select)
--무조건 괄호작성해야한다
-- 1) 단일 행 서브쿼리 : 서브쿼리 실행 결과가 행 하나
-- > < <= >= != ^= =등의 연산자를 쓰면 실행 결과가 하나만 나와야한다. 안그러면 에러
--2) 다중행 서브쿼리 : 서브쿼리 실행결과가 여러 행
--in, any(some), all, exist
-- in : 서브쿼리 결과 중 하나라도 일치한 데이터가 있다면 true 반환
-- some, any : 서브쿼리 결과가 하나 이상이면 true 반환
-- all : 서브쿼리 결과가 모두 만족하면 true 반환
-- exists : 서브쿼리 결과가 하나라도 있으면 true 반환

--jones 의 급여보다 높은 급여를 받는 사원의 데이터를 조회

SELECT
	*
FROM
	EMP e
WHERE
	e.SAL > (
	SELECT
		e2.SAL
	FROM
		EMP e2
	WHERE
		e2.ENAME = 'JONES');

-- WARD 사원보다 빨리 입사한 사줜 조회
SELECT *
FROM EMP e 
WHERE e.HIREDATE < (SELECT e2.HIREDATE FROM EMP e2 WHERE e2.ENAME = 'WARD');

--20번 부서에 속한 사원 중 전체 사원의 평균급여보다 높은 급여를 받는 사원 조회
--부서정보도 조회
SELECT *
FROM EMP e JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE e.DEPTNO = 20 AND e.SAL > (SELECT AVG(e2.SAL) FROM EMP e2);

-- 동일값출력
SELECT  * FROM EMP e WHERE e.SAL IN (SELECT MAX(e2.SAL) FROM emp e2 GROUP BY e2.DEPTNO);
SELECT  * FROM EMP e WHERE e.SAL = ANY (SELECT MAX(e2.SAL) FROM emp e2 GROUP BY e2.DEPTNO);
SELECT  * FROM EMP e WHERE e.SAL = SOME (SELECT MAX(e2.SAL) FROM emp e2 GROUP BY e2.DEPTNO);

-- < any
--30 번 부서의 최대 급여보다 작은 급여를 받는 사원 조회(최대값 출력해서 비교함 즉 max와 동일)
SELECT  * FROM EMP e WHERE e.SAL < ANY (SELECT e2.sal FROM emp e2 WHERE e2.DEPTNO = 30);
-- 30번 부서의 최소급여보다 많은 급여를 받는 사원 조회
SELECT  * FROM EMP e WHERE e.SAL > ANY (SELECT e2.sal FROM emp e2 WHERE e2.DEPTNO = 30);
-- 30번 부서의 최소 급여보다 더 적은 급여를 받는 사원조회
SELECT  * FROM EMP e WHERE e.SAL < all (SELECT e2.sal FROM emp e2 WHERE e2.DEPTNO = 30);
--30번 부서의 최대 급여보다 더 많은 급여를 받는 사원조회
SELECT  * FROM EMP e WHERE e.SAL > ALL (SELECT e2.sal FROM emp e2 WHERE e2.DEPTNO = 30);

--서브쿼리 결과가 하나이상 나오면 true 반환해서 모두 출력됨
SELECT * FROM EMP e WHERE EXISTS (SELECT dname FROM dept d WHERE d.DEPTNO = 30);

--다중렬 서브쿼리
SELECT  * FROM EMP e WHERE (e.DEPTNO, e.SAL) IN (SELECT e2.deptno, MAX(e2.SAL) FROM emp e2 GROUP BY e2.DEPTNO);
--from 절 서브쿼리(= 인라인 뷰)
SELECT e10.*, d.*
FROM (SELECT * FROM emp e WHERE e.DEPTNO = 10) e10, (SELECT * FROM DEPT) d
WHERE e10.DEPTNO = d.DEPTNO;

--select 절 서브쿼리(= 스칼라 서브쿼리), ctrl shift e 로 코드 실행 코스트 확인 가능, 이걸로 최적화 가능 
SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	(
	SELECT
		s.GRADE
	FROM
		SALGRADE s
	WHERE
		sal BETWEEN s.LOSAL AND s.HISAL) AS salgrade,
	e.DEPTNO,
	(
	SELECT
		d.DNAME
	FROM
		DEPT d
	WHERE
		e.DEPTNO = d.DEPTNO) AS dname
FROM
	EMP e;

--전체 사원 중에서 ALLEN과 같은 직책인 사원들의 사원정보, 부서정보 조회
--정보 : 사번, 이름, 직무, 급여, 부서번호, 부서명 
SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.SAL,
	e.DEPTNO,
	d.DNAME
FROM
	EMP e
JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO
WHERE
	e.JOB = (
	SELECT
		e2.JOB
	FROM
		EMP e2
	WHERE
		e2.ENAME = 'ALLEN');

-- 자신의 부서 내에서 최고연봉과 동일한 급여를 받는 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	(e.DEPTNO ,
	e.sal) = ANY (
	SELECT
		e2.DEPTNO,
		MAX(e2.SAL)
	FROM
		EMP e2
	GROUP BY
		e2.DEPTNO);

--10번 부서에 근무하는 사원 중 30번 부서에 없는 직책인 사원의 사번, 이름, 직무, 부서번호, 부서명, 부서위치 조회
SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.DEPTNO,
	d.DNAME,
	d.LOC
FROM
	EMP e
JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO
WHERE
	e.DEPTNO = 10
	AND e.JOB NOT IN (
	SELECT
		e2.JOB
	FROM
		EMP e2
	WHERE
		e2.DEPTNO = 30);


--insert : 테이블에 데이터 추가
--INSERT INTO 테이블명 VALUES(삽입될 값1, 값2...)
--열이름 생략 가능은하지만 모든 열의 값이 지정되어야한다. 

-- 연습용 테이블 생성
CREATE TABLE dept_temp AS SELECT * FROM dept;
CREATE TABLE EMP_temp AS SELECT * FROM EMP WHERE 1<>1; -- 구조만 복사
SELECT * FROM dept_temp;
SELECT * FROM EMP_temp;
--50부서 database seoul 삽입
INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES(50, 'DATABASE','SEOUL');

INSERT INTO dept_temp VALUES(60, 'NETWORK','BUSAN');
-- 값으로 NULL 명시적으로 삽입 가능
INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES(70, 'WEB',NULL);
INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES(80, 'MOBILE','');
--NULL 암시적 처리
INSERT INTO dept_temp(DEPTNO, DNAME) VALUES(90, 'OS');


SELECT * FROM EMP_temp;
INSERT INTO emp_temp(empno, ename, JOB, mgr, hiredate, sal, comm, deptno) 
VALUES(1111, '성춘향','MANAGER', 9999, '2010-10-25', 4000, NULL, 20) ;

INSERT INTO emp_temp(empno, ename, JOB, mgr, hiredate, sal, comm, deptno) 
VALUES(9999, '홍길도','PRESIDENT', NULL, '2000-01-25', 8000, 1000, 10) ;

INSERT INTO emp_temp(empno, ename, JOB, mgr, hiredate, sal, comm, deptno) 
VALUES(2222, '김수호','MANAGER', 9999, SYSDATE, 4000, NULL, 30) ;

-- INSERT 구문에서의 서브쿼리
--EMP 테이블에서 SALGRADE 가 1인 사원만 EMP_TEMP 삽입
INSERT INTO emp_temp(empno, ename, JOB, mgr, hiredate, sal, comm, deptno)
SELECT e.EMPNO, e.ENAME, e.JOB, e.MGR, e.HIREDATE, e.SAL, e.COMM, e.DEPTNO 
FROM EMP e JOIN SALGRADE s ON e.SAL BETWEEN s.LOSAL AND s.HISAL AND s.GRADE = 1;


--UPDATE 구문
--UPDATE 테이블명
--SET 열이름 = 수정할 값, 열이름2 =수정할 값
--WHERE 수정할 조건

SELECT * FROM DEPT_TEMP dt;
SELECT * FROM EMP_temp;
-- 10부서의 위치 SEOUL 변경
UPDATE DEPT_TEMP dt 
SET dt.loc = 'SEOUL'
WHERE dt.DEPTNO = 10;

-- emp_temp 테이블의 사원 중 sal 이 2500 이하인 사원만 추가수당 50으로 수정
UPDATE EMP_TEMP et 
SET et.comm = 50
WHERE et.SAL <= 2500;

--update 에서 서브쿼리 
-- dept 테이블의 40 부서의 dname, loc 정보를 가져와서 dept_temp 40번 부서의 내용으로 변경
UPDATE DEPT_TEMP dt 
SET (dt.dname, dt.loc) = (SELECT d.DNAME, d.LOC FROM dept d WHERE d.DEPTNO = 40)
WHERE dt.DEPTNO = 40;

--DBEAVER가 경고 줌
UPDATE DEPT_TEMP dt
SET loc = 'BUSAN';

-- DELETE : 데이터 삭제
--DELETE FROM 테이블명 WHERE 삭제할 조건
--DELETE 테이블명 WHERE 삭제할 조건 

CREATE TABLE EMP_temp2 AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2 et;

--7902, 7844 사원 삭제
DELETE FROM EMP_TEMP2 WHERE EMPNO = 7902;
DELETE EMP_TEMP2 WHERE EMPNO = 7844;
--데이터 전체 삭제
DELETE FROM EMP_TEMP2;

--EMP 테이블을 복사하여 EXAM_EMP 테이블 생성
CREATE TABLE EXAM_EMP AS SELECT * FROM EMP;
--DEPT 테이블을 복사하여 EXAM_DEPT 테이블 생성
CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT;
--SALGRADE 테이블을 복사하여 EXAM_SALGRADE 테이블 생성
CREATE TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE;

--EXAM_DEPT 테이블에 50, 60, 70, 80번 부서를 등록하는 SQL 구문 작성
--50, ORACLE, BUSAN
--60, SQL, ILSAN
--70, SELECT, INCHEON
--80, DML, BUNDANG 
SELECT * FROM EXAM_DEPT ed;
INSERT INTO EXAM_DEPT(DEPTNO, DNAME, LOC) VALUES(50, 'ORACLE', 'BUSAN');
INSERT INTO EXAM_DEPT(DEPTNO, DNAME, LOC) VALUES(60, 'SQL', 'ILSAN');
INSERT INTO EXAM_DEPT(DEPTNO, DNAME, LOC) VALUES(70, 'SELECT', 'INCHEON');
INSERT INTO EXAM_DEPT(DEPTNO, DNAME, LOC) VALUES(80, 'DML', 'BUNDANG');

--EXAM_EMP 테이블에 8명의  사원정보를 등록하는 SQL 구문 작성
--8명은  임의의 값
SELECT * FROM EXAM_EMP ee;
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7936, 'KONG', 'SALESMAN', '', SYSDATE, 600, '', 40);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7937, 'JONG', 'SALESMAN', '', SYSDATE, 600, '', 50);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7938, 'HONG', 'SALESMAN', '', SYSDATE, 600, '', 50);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7939, 'SONG', 'SALESMAN', '', SYSDATE, 600, '', 50);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7940, 'LONG', 'SALESMAN', '', SYSDATE, 600, '', 60);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7941, 'PONG', 'SALESMAN', '', SYSDATE, 600, '', 70);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7942, 'MONG', 'SALESMAN', '', SYSDATE, 600, '', 80);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7943, 'ZONG', 'SALESMAN', '', SYSDATE, 600, '', 80);


--EXAM_EMP 에서 50번 부서 근무하는 사원의 평균 급여보다 많이 받는 사원을 70번 부서로 옮기는 SQL 구문 작성
UPDATE EXAM_EMP ee 
SET DEPTNO = 70
WHERE ee.SAL > (SELECT AVG(EE2.SAL) FROM EXAM_EMP EE2 WHERE EE2.DEPTNO = 50);

--EXAM_EMP 에 속한 사원 중 입사일이 가장 빠른 60번 부서 사원보다 늦게 입사한 사원의 급여를 10% 인상하고 
--80번 부서로 옮기는 SQL 구문 작성 
UPDATE EXAM_EMP ee 
SET SAL = ee.SAL * 1.1 ,DEPTNO = 80
WHERE ee.HIREDATE > (SELECT min(ee2.HIREDATE) FROM EXAM_EMP ee2 WHERE ee.DEPTNO = 60);


--EXAM_EMP 에 속한 사원 중 급여 등급이 5인 사원을 삭제하는 SQL 구문 작성
--조인 시 EXAM_SALGRADE 테이블 사용
DELETE
FROM
	EXAM_EMP
WHERE
	EMPNO IN (
	SELECT
		ee.EMPNO
	FROM
		EXAM_EMP ee
	JOIN EXAM_SALGRADE es ON
		ee.SAL BETWEEN es.LOSAL AND es.HISAL
		AND es.GRADE = 5);


--DML : INSERT, UPDATE, DELETE -> 데이터 변경이 일어나는 작업
--트랜잭션 : 하나의 단위로 데이터 처리하는 개념 
--만약 오류가 나서 하나 단위의 작업이 실패한다면 롤백한다. 
--ROLLBACK : 되돌리기
--COMMIT : 데이터베이스에 반영 DBEAVER 기본설정이  AUTO여서 자동 COMMIT 되고 있었다.

CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TCL dt;

-- 트랜잭션 시작
INSERT INTO DEPT_TCL VALUES(50,'DATABASE','SEOUL');

UPDATE DEPT_TCL dt SET LOC = 'BUSAN' WHERE dt.DEPTNO = 40;

DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
--트랜잭션 종료

SELECT * FROM DEPT_TCL;

ROLLBACK;

COMMIT;
--COMMIT 이후론 ROLLBACK 할 수 없다. + 트랜잭션 시작


--세션 : 데이터베이스 접속을 시작으로 작업을 수행한 후 접속을 종료하기까지 전체 기간을 의미
SELECT * FROM DEPT_TCL;
DELETE FROM DEPT_TCL WHERE deptno = 50;
COMMIT;
--트랜잭션 시작, DBEAVER와 SQL PLUS에서 동시 확인 가능하다. 그러나 update 등의 변경이 있는데 commit 이나 rollback 없었다면
-- 먼저 한 세션을 끝내기 전까진 접속할 수 없다
UPDATE DEPT_TCL dt SET loc = 'SEOUL' WHERE dt.DEPTNO = 30;
COMMIT;

--데이터 정의(DDL)
-- 객체를 생성, 변경, 삭제하는 명령어. 각각  creat, alter, drop 이다. 
--dml에서만 rollback, commit 개념이 있기에 객체를 바꾸려면 반드시 alter, drop이 필수이다. 

--1) 테이블 생성
--create table dept_tcl as select * from dept;
--create table dept_tcl as select * from dept where 1<>1;
--create table 테이블명 ( 열이름1 타입(20), 열이름2 타입()...)

--타입
--문자 : char/nchar/varchar2/nvarchar2
--char: 고정크기 / varchar : 가변크기 
-- char(10) : abc-> 메모리 내에서 사용하지 않는 자리까지 세서 10자리를 사용함
-- varchar(10) : abc -> 3자리만 사용, 그래서 활용도가 높다
-- varchar(10) : 안녕하세요 불가능 한글은 한 형태소에 3byte 여서
-- nvarchar(10) : 안녕하세요 가능
--숫자 : number(7,2) 소수 둘째 자리를 포함해서 총 7자리 숫자 지정 가능 
--날짜 : date 

-- 테이블명 : 문자로 시작, 특수문자(_,$,#) 가능, 숫자가능/ 예약어(select, order, from...) 사용불가
-- 열명 :  문자로 시작, 특수문자(_,$,#) 가능, 숫자가능/ 예약어(select, order, from...) 사용불가

--2) 자료형을 정의하여 새 테이블 생성
CREATE TABLE EMP_DDL(
	EMPNO NUMBER(4),
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2)
);

--테이블 변경 : ALTER
--1. 컬럼추가 : ADD
--2. 열 이름 변경 : RENAME COLUMN
--3. 열 자료형 변경 : MODIFY
--4. 열 삭제 : DROP COLUMN

--테이블 이름 변경 : RENAME 변경전테이블명 TO 변경후테이블명

ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);
-- HP -> TEL
ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL; 
-- EMPNO (4) -> 5 변경
ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);
--TEL 칼럼 제거 
ALTER TABLE EMP_DDL DROP COLUMN TEL;
SELECT * FROM EMP_DDL;
--테이블 이름 변경
RENAME EMP_DDL TO EMP_RENAME;

--테이블 삭제 
-- DROP
DROP TABLE EMP_RENAME;

--MEMBER 테이블 생성
-- ID 가변형 문자열 15
--PASSWORE 가변형문자열 20
--NAME 가변형문자열 10
--TEL 가변형문자열 15
--EMAIL 가변형문자열 20
--AGE 숫자 4
CREATE TABLE MEMBER(
	ID VARCHAR2(15),
	PASSWORD VARCHAR2(20),
	NAME VARCHAR2(10),
	TEL VARCHAR2(15),
	EMAIL VARCHAR2(20),
	AGE NUMBER(4)
);
--BIGO 열 추가(가변형문자열10)
ALTER TABLE MEMBER ADD BIGO VARCHAR2(10);
--BIGO 열 크기 변경 30
ALTER TABLE MEMBER MODIFY BIGO VARCHAR2(30);
--BIGO 열 이름 REMARK 로 변경
ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;
SELECT * FROM MEMBER;

--인덱스 : 테이블 검색 성능 향상
--SQL 튜닝 관련된 개념
--인덱스 사용 여부에 따라
--1) 테이블 풀 스캔 : 처음부터 끝까지 검색
--2) 인덱스 스캔 : 인덱스를 사용한 검색
SELECT * FROM EMP WHERE EMPNO = 7844;

--인덱스 생성
--CREATE INDEX 인덱스명 ON 테이블명(컬럼명)
CREATE INDEX IDX_EMP_SAL ON EMP(SAL);
--인덱스 삭제 
--DROP INDEX 인덱스명
DROP INDEX IDX_EMP_SAL;

-- 뷰 : 가상테이블
--	    하나 이상의 테이블을 조회하는 SELECT문을 저장한 객체

--CREATE VIEW 뷰이름(열이름1, 열이름2) AS (저장할 SELECT문) WITH CHECK OPTION 제약조건 WITH READ ONLY 제약조건
CREATE VIEW VW_EMP20 AS (SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = 20);
CREATE VIEW VW_EMP_READ AS SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WITH READ ONLY;
--권한이 불충분합니다. 출력. SYSTEM에서 GRANT 해줘야 함 그래면 정상적으로 만들어짐
-- 관리자가 EMP테이블에서 SELECT한 정보들만 추출해서 임시테이블을 생성, 접근할 권한을 줌, 즉 원본 EMP접근권한이 없다
--보안에 용이함. 
--편리함 : SQL 구문의 복잡도 완화
--DROP VIEW 뷰이름
INSERT INTO VW_EMP20 VALUES(7777,'홍길동','SALESMAN',10);
SELECT * FROM VW_EMP20 ve;
SELECT * FROM EMP e;
--뷰에 작업해도 원본에 반영이 된다. 그렇기때문에 모든 권한을 줄 필요가 없이 VIEW 만 주면 되는 것이다.

--USER_ : 현재 데이터베이스에 접속한 사용자가 소유한 객체 정보
SELECT TABLE_NAME FROM USER_TABLES;
SELECT * FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME = 'VM_EMP20';
--읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.
--INSERT INTO VW_EMP_READ VALUES(7777,'홍길동','SALESMAN',10);

DROP VIEW VW_EMP20;
DROP VIEW VW_EMP_READ;

--시퀀스 = MYSQL에서의 LIMIT 
--오라클 데이터베이스에서 특정 규칙에 따른 연속 숫자를 생성하는 객체

--CREATION SEQUENCE 시퀀스명; 
--INCREMENT BY N(기본값 1)
--START WITH N(기본값 1)
--MAXVALUE N | NOMAXVALUE
--MINVALUE N | NOMINVALUE
--CYCLE |NOCYCLE
--CACHE N | NOCACHE

CREATE SEQUENCE SEQ_DEPT_SEQUENCE;
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

ALTER SEQUENCE SEQ_DEPT_SEQUENCE INCREMENT BY 3 MAXVALUE 99 CYCLE;
--시작 번호 10, 10씩 증가
CREATE SEQUENCE SEQ_DEPT_SEQUENCE INCREMENT BY 10 START WITH 10 MAXVALUE 90 MINVALUE 0 NOCYCLE CACHE 2;


CREATE TABLE DEPT_SEQUENCE AS SELECT * FROM DEPT WHERE 1 <> 1;

INSERT INTO DEPT_SEQUENCE VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
INSERT INTO DEPT_SEQUENCE VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL, 'NETWORK', 'BUSAN');
DELETE FROM DEPT_SEQUENCE;
SELECT * FROM DEPT_SEQUENCE ds;

--SEQ-DEPT_SEQUENCE.CURRVAL : 현재 시쿼스 값 조회
SELECT SEQ_DEPT_SEQUENCE.CURRVAL FROM DUAL;

-- 동의어 : SYNONYM (별칭)
-- 테이블, 뷰, 시퀀스 등 객체 이름 대신 사용할 수 있는 다른 이름 부여

--emp 테이블 별칭을 e로 지정
CREATE synonym e FOR emp;

SELECT * FROM e;
DROP synonym e;

