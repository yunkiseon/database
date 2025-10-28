--1. 사원정보가 176 인 사원의 last_name, 부서번호 정보 조회
SELECT
	e.LAST_NAME ,
	e.DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	e.EMPLOYEE_ID = 176;

--2. 연봉이 12000 이상 되는 직원들의 last_name, 급여 조회
SELECT
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.SALARY >= 12000;

--3. 연봉이 5000 ~ 12000 범위가 아닌 사람들의 last_name, 급여 조회
SELECT
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.SALARY < 5000
	OR e.SALARY > 12000;

--4. 20번이나 50번 부서에 근무하는 사원들의 last_name, 부서번호를 오름차순으로 조회
SELECT
	e.LAST_NAME,
	e.DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	e.DEPARTMENT_ID IN (20, 50)
ORDER BY
	e.LAST_NAME ASC,
	DEPARTMENT_ID ASC; 

--5. 커미션을 받는 모든 사원들의 last_name, 급여, 커미션 조회 단, 급여의 내림차순, 커미션 내림차순으로 조회
SELECT
	e.LAST_NAME,
	e.SALARY,
	e.COMMISSION_PCT
FROM
	EMPLOYEES e
WHERE
	e.COMMISSION_PCT > 0
ORDER BY
	e.SALARY DESC,
	e.COMMISSION_PCT DESC;

--6. 연봉이 2500, 3500, 7000이 아니며 직무가 SA_REP, ST_CLERK 인 사원조회
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.SALARY NOT IN (2500, 3500, 7000)
	AND e.JOB_ID IN ('SA_REP', 'ST_CLERK');

--7. 2015/02/20 ~ 2015/05/01 사이에 고용된 사원들의 last_name, 사번, 고용일자 조회
-- 고용일자 내림차순
SELECT
	e.LAST_NAME,
	e.EMPLOYEE_ID,
	e.HIRE_DATE
FROM
	EMPLOYEES e
WHERE
	e.HIRE_DATE >= '2015-02-20'
	AND e.HIRE_DATE <= '2015-05-01'
ORDER BY 
	e.HIRE_DATE DESC;

-- between
--8. 20번, 50번 부서에 근무하는 사원들 중에서 연봉이 5000~ 12000 인 사원들의 last_name, 급여를 조회 후 급여의 오름차순 정렬
SELECT
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.DEPARTMENT_ID IN (20, 50)
	AND e.SALARY BETWEEN 5000 AND 12000
ORDER BY
	e.SALARY ASC;

--9. 연봉이 5000~ 12000 이 아닌 사원들의 last_name, 급여를 조회 후 급여의 오름차순 정렬
SELECT
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.SALARY NOT BETWEEN 5000 AND 12000
ORDER BY
	e.SALARY ASC;

--10. 2015/02/20 ~ 2015/05/01 사이에 고용된 사원들의 last_name, 사번, 고용일자 조회(고용일자 내림차순)
	SELECT
	e.LAST_NAME,
	e.EMPLOYEE_ID,
	e.HIRE_DATE
FROM
	EMPLOYEES e
WHERE
	e.HIRE_DATE BETWEEN '2015-02-20' AND '2015-05-01'
ORDER BY
	e.HIRE_DATE DESC;

--like
--11. last_name 에 u 가 포함되는 사원들의 사번, last_name 조회
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME LIKE '%u%';

--12. last_name 에 네 번째 글자가 a 인 사원들의 last_name 조회
SELECT
	e.LAST_NAME
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME LIKE '___a%';

--13. last_name 에 a 혹은 e 글자가 있는 사원들의 last_name 조횜(last_name 오름차순)
SELECT
	e.LAST_NAME
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME LIKE '%a%'
	OR e.LAST_NAME LIKE '%e%'
ORDER BY
	e.LAST_NAME ASC;
--SQL Error [936] [42000]: ORA-00936: 누락된 표현식
--SELECT e.LAST_NAME  FROM EMPLOYEES e WHERE e.LAST_NAME LIKE IN ('%a%', '%e%') ORDER BY e.LAST_NAME asc;

--14.last_name 에 a, e 글자가 포함된 사원들의 last_name 을 조회하여 last_name으로 오름차순
SELECT
	e.LAST_NAME
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME LIKE '%a%e%'
	OR e.LAST_NAME LIKE '%e%a%'
ORDER BY
	e.LAST_NAME ASC;
--is null / is not null
--15. 매니저 아이디가 없는 사원들의 last_name을 조회(last_name, job_id 조회)
SELECT
	e.LAST_NAME,
	e.JOB_ID
FROM
	EMPLOYEES e
WHERE
	e.MANAGER_ID IS NULL;
--16. 직무가 ST_CLERK 인 사원이 근무하고 있지 않은 부서 id 조회
-- 단, 부서번호가 null인 것은 제외
SELECT
	DISTINCT e.DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	e.JOB_ID != 'ST_CLERK'
	AND e.DEPARTMENT_ID IS NOT NULL;
--17. COMMISSION_PCT 가 NULL 이 아닌 사원들 중에서 
--COMMISSION = SALARY * COMMISSION_PCT를 구하여 사번, FIRST_NAME, JOB_ID 조회
SELECT
	e.SALARY * e.COMMISSION_PCT AS COMMISSION,
	e.EMPLOYEE_ID,
	e.FIRST_NAME,
	e.JOB_ID
FROM
	EMPLOYEES e
WHERE
	e.COMMISSION_PCT IS NOT NULL;

--함수
--18. FIRST_NAME 이 Curtis 인 사람의 first_name, last_name, email, phone_number, job_id 조회
-- 단, job_id 결과는 소문자로 출력 LOWER

SELECT e.FIRST_NAME, e.LAST_NAME, e.EMAIL, e.PHONE_NUMBER, LOWER(e.JOB_ID) 
FROM EMPLOYEES e 
WHERE e.FIRST_NAME = 'Curtis';

--19. 부서번호가 60, 70, 80, 90인 사원들의 사원번호, first_name, hire_date, job_id 조회
-- 단 , job_id가 IT_PROG 인 사원의 경우 프로그래머로 변경하여 출력

SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.HIRE_DATE, REPLACE(e.JOB_ID, 'IT_PROG',' 프로그래머') 
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID IN (60, 70, 80, 90);

-- 20. job_id가 AD_PRES, PU_CLERK인 사원들의 사원번호, first_name, last_name, 부서번호, job_id 조회
-- 사원명은 first_name 과 last_name을 연결하여 출력하시오

SELECT e.EMPLOYEE_ID, e.FIRST_NAME || ' ' || e.LAST_NAME, e.DEPARTMENT_ID, e.JOB_ID
FROM EMPLOYEES e 
WHERE e.JOB_ID IN ('AD_PRES', 'PU_CLERK');

--다중행함수
--21. 회사 내의 최대 연봉 및 최소연봉의 차이를 조회
--sal_ gap
SELECT max(e.SALARY) - MIN(e.SALARY) AS sal_gap
FROM EMPLOYEES e;


--22. 매니저로 근무하는 사원들의 총 숫자 조회
SELECT COUNT(DISTINCT e.MANAGER_ID) AS "매니저 수"
FROM EMPLOYEES e ;

--23. 매니저가 없는 사원들은 제외하고 매니저가 관리하는 사원들 중에서
--최소급여를 받는 사원 조회(단, 매니저가 관리하는 사원중 연봉 6000미만 제외)
-- 매니저 아이디, 최소급여 

SELECT
	e.MANAGER_ID,
	MIN(e.SALARY)
FROM
	EMPLOYEES e
WHERE
	e.MANAGER_ID IS NOT NULL
GROUP BY
	e.MANAGER_ID
HAVING
	min(e.SALARY) > 6000;

--join 
--24. 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기
-- emplyees SELF join
SELECT
	e1.EMPLOYEE_ID AS 내아이디,
	e1.FIRST_NAME AS 내이름,
	e1.MANAGER_ID AS 내매니저아이디,
	e1.HIRE_DATE AS 내입사일,
	e2.FIRST_NAME AS 매니저명,
	e2.HIRE_DATE AS 매니저입사일
FROM
	EMPLOYEES e1
JOIN EMPLOYEES e2 ON
	e1.MANAGER_ID = e2.EMPLOYEE_ID
	AND e1.HIRE_DATE < e2.HIRE_DATE;

-- 25. 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, last_name, 부서번호 조회
--emplyees, departments, locations
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	d.DEPARTMENT_ID,
	l.CITY
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN LOCATIONS l ON
	d.LOCATION_ID = l.LOCATION_ID
WHERE
	l.CITY LIKE 'T%';

--26. 위치 ID가 1700인 사원들의 사번, last_name, 부서번호, 연봉 조회
--emplyees, departments 
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	d.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE
	d.LOCATION_ID = 1700;

--27. 부서명, 위치 ID, 각 부서별 사원총수, 부서별 평균 연봉 조회, 평균연봉은 소수점 2자리까지만 
--emplyees, departments
SELECT
	d.DEPARTMENT_NAME,
	d.LOCATION_ID,
	COUNT(*) AS 사원총수,
	ROUND(AVG(e.SALARY), 2) AS 평균연봉
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY
	d.DEPARTMENT_NAME,
	d.LOCATION_ID
ORDER BY
	d.DEPARTMENT_NAME;

--28. Executive 부서에 근무하는 모든 사원들의 last_name, 부서번호, 부서명, job_id 조회
--emplyees, departments 
SELECT
	e.LAST_NAME,
	e.DEPARTMENT_ID,
	d.DEPARTMENT_NAME,
	e.JOB_ID
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
	AND d.DEPARTMENT_NAME = 'Executive';
--29. 각 사원별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이 존재하는 모든 사원들의 이름 조회
--	이름은 first_name, last_name 을 연결하여 출력 
--employees self join
SELECT
	DISTINCT e1.EMPLOYEE_ID ,
	e1.FIRST_NAME || ' ' || e1.LAST_NAME
FROM
	EMPLOYEES e1
JOIN EMPLOYEES e2 ON
	e1.DEPARTMENT_ID = e2.DEPARTMENT_ID
	AND e1.HIRE_DATE < e2.HIRE_DATE
WHERE
	e1.SALARY < e2.SALARY
ORDER BY 
	e1.EMPLOYEE_ID;


--서브쿼리 
--30. job_id 가 'SA_MAN'인 사원들의 최대 연봉보다 높게 받는 사원들의 LAST_NAME, JOB_ID, SALARY 조회
SELECT
	e.LAST_NAME,
	e.JOB_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.SALARY >ALL (
	SELECT
		e2.SALARY
	FROM
		EMPLOYEES e2
	WHERE
		e2.JOB_ID = 'SA_MAN');

--31. 커미션을 받는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서번호, 급여 조회
SELECT
	e.LAST_NAME,
	e.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	(e.DEPARTMENT_ID,
	e.SALARY) IN (
	SELECT
		e2.DEPARTMENT_ID,
		e2.SALARY
	FROM
		EMPLOYEES e2
	WHERE
		e2.COMMISSION_PCT IS NOT NULL);

--32. 회사 전체 평균 연봉보다 더 버는 사원들 중 LAST_NAME에 u가 들어있는 사원들이 근무하는 부서에서 
-- 근무하는 사원들의 사번, last_name, salary 조회
--단 평균연봉은 반올림한 후 비교
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.DEPARTMENT_ID IN (
	SELECT
		DISTINCT e2.DEPARTMENT_ID
	FROM
		EMPLOYEES e2
	WHERE
		e2.SALARY > (
		SELECT
			ROUND(AVG(e3.SALARY))
		FROM
			EMPLOYEES e3)
		AND e2.LAST_NAME LIKE '%u%');
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e,
	(
	SELECT
		DISTINCT e2.DEPARTMENT_ID
	FROM
		EMPLOYEES e2
	WHERE
		e2.SALARY > (
		SELECT
			ROUND(avg(e3.SALARY))
		FROM
			EMPLOYEES e3)
		AND e2.LAST_NAME LIKE '%u%')dept ;

--33. 위치 id가 1700인 사원들의 급여, 커미션 추출 뒤 추출된 사원들의 급여와 커미션이 동일한 사원정보 출력
-- 사번, 이름(first_name + last_name), 부서번호, 급여
	SELECT
	e.EMPLOYEE_ID,
	e.FIRST_NAME || ' ' || e.LAST_NAME,
	e.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	(e.SALARY,
	NVL(e.COMMISSION_PCT, 0)) IN (
	SELECT
		e2.SALARY,
		NVL(e2.COMMISSION_PCT, 0)
	FROM
		EMPLOYEES e2
	JOIN DEPARTMENTS d ON
		e2.DEPARTMENT_ID = d.DEPARTMENT_ID
		AND d.LOCATION_ID = 1700);

--35. 총 사원 수 및 2011, 2012, 2013, 2014 년도 별 고용된 사원들의 총 수 조회
--select 절에 사용하는 서브쿼리로 작성

SELECT
	DISTINCT (SELECT count(e3.employee_id) FROM employees e3),
	(
	SELECT
		count(*)
	FROM
		EMPLOYEES e2
	GROUP BY
		TO_CHAR(e2.HIRE_DATE, 'YYYY')
	HAVING
		TO_CHAR(e2.HIRE_DATE, 'YYYY') = '2011') AS "2011입사자"
FROM
	EMPLOYEES e;

SELECT DISTINCT (SELECT COUNT(e3.EMPLOYEE_ID) FROM EMPLOYEES e3) AS 총사원수,
(SELECT COUNT(*) FROM EMPLOYEES e2 WHERE TO_CHAR(e2.HIRE_DATE, 'YYYY') = '2011') AS "2011입사자",
(SELECT COUNT(*) FROM EMPLOYEES e2 WHERE TO_CHAR(e2.HIRE_DATE, 'YYYY') = '2012') AS "2012입사자",
(SELECT COUNT(*) FROM EMPLOYEES e2 WHERE TO_CHAR(e2.HIRE_DATE, 'YYYY') = '2013') AS "2013입사자",
(SELECT COUNT(*) FROM EMPLOYEES e2 WHERE TO_CHAR(e2.HIRE_DATE, 'YYYY') = '2014') AS "2014입사자"
FROM EMPLOYEES e;