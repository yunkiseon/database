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