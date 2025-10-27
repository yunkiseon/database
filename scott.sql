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
	EMP e 

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