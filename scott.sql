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
 
 