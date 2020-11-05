-- SCOTT 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- emp 테이블의 구조
DESC emp;


-- emp 테이블의 모든 내용 조회
SELECT * FROM emp;

-- emp 테이블의 특정 필드만 조회
SELECT ename, job, sal FROM emp;



-- 중복 레코드 제거한 후 조회 : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais(별칭) : AS
SELECT empno AS 사원번호 FROM emp;

SELECT ename, sal, sal*12+comm AS 연봉, comm FROM emp;

SELECT ename as 사원이름, job AS "직 책" from emp;

-- ORDER BY : 정렬하여 조회

-- 하나의 열로 기준을 주어 오름차순(ASC) 조회
SELECT ename,sal FROM emp ORDER BY sal;

-- 하나의 열로 기준을 주어 내림차순 조회
SELECT ename,sal FROM emp ORDER BY sal DESC;

-- 전체 데이터를 조회(사원번호 오름차순)
SELECT * FROM emp ORDER BY empno;

-- 부서번호의 오름차순이고, 부서번호가 동일하다면 급여의 내림차순
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

-- 출력되는 열의 별칭을 다음과 같이 지정한다.
-- EMPNO : EMPLOYEE_NO
-- ENAME : EMPLOYEE_NAME
-- MGR : MANAGER
-- SAL : SALARY
-- COMM : COMMISSION
-- DEPTNO : DEPARTMENT_NO

-- 부서번호를 기준으로 내림차순으로 정렬하되 부서 번호가 같다면 사원 이름을 기준으로 오름차순 정렬한다.

SELECT empno AS EMPLOYEE_NO, ename AS EMPLOYEE_NAME, job, mgr AS MANAGER,
       hiredate, sal AS SALARY, comm AS COMMISSION, deptno AS DEPARTMENT_NO
FROM emp ORDER BY deptno DESC, ename ASC;

-- WHERE : 조회를 할 때 기준 주기

-- 부서번호가 30번인 사원 조회
SELECT * FROM emp WHERE deptno = 30;

-- 사원번호가 7782인 사원 조회
SELECT * FROM emp WHERE empno=7782;

-- 부서번호가 30이고, 사원직책이 SALESMAN 정보 조회
SELECT * FROM emp WHERE deptno=30 AND job='SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 정보 조회
SELECT * FROM emp WHERE empno=7499 AND deptno=30;

-- 부서번호가 30이거나, 사원직책이 CLERK 정보 조회
SELECT * FROM emp WHERE deptno=30 OR job='CLERK';

-- 부서번호가 20이거나, 사원직책이 SALESMAN 정보 조회
SELECT * FROM emp WHERE deptno=20 OR job='SALESMAN';


-- 연산자를 이용한 조회

-- 산술연산자 : sal*12 한 금액이 36000 인 데이터 조회
SELECT * FROM emp WHERE sal*12=36000;

-- 관계연산자 : >, <, >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

SELECT * FROM emp WHERE ename >= 'F';

-- 논리연산자 : AND, OR
-- 급여가 2500이상이고, 직업이 ANALYST인 사원정보 조회
SELECT * FROM emp WHERE sal >=2500 AND job='ANALYST';

-- 직무가 MANAGER, SALESMAN, CLERK 인 사원정보 조회
SELECT * FROM emp WHERE job='MANAGER' OR job='SALESMAN' OR job='CLERK';

-- 등가연산자 : 양쪽 항목이 같은지 검사

-- SAL이 3000이 아닌 사원정보 출력
SELECT * FROM emp WHERE sal!=3000;
SELECT * FROM emp WHERE sal<>3000;
SELECT * FROM emp WHERE sal^=3000;

-- 직무가 MANAGER, SALESMAN, CLERK 인 사원정보 조회
SELECT * FROM emp WHERE job='MANAGER' OR job='SALESMAN' OR job='CLERK';

-- IN 연산자
SELECT * FROM emp WHERE job IN('MANAGER','SALESMAN','CLERK');

-- 직무가 MANAGER, SALESMAN, CLERK가 아닌 사원정보 조회
SELECT * FROM emp WHERE job!='MANAGER' AND job!='SALESMAN' AND job!='CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');

-- IN 을 사용해서 부서번호가 10,20번인 사원정보 조회
SELECT * FROM emp WHERE deptno IN(10,20);

-- DETWEEN A AND B

--급여가 2000이상 3000이하 사원 조회
SELECT * FROM emp WHeRE sal >=2000 AND sal <= 3000;

SELECT * FROM emp WHeRE sal BETWEEN 2000 and  3000;
--급여가 2000이상 3000이하 사원 조회
SELECT * FROM emp WHeRE sal NOT BETWEEN 2000 and  3000;

-- LIKE : 문자열 검색 사용(s로 시작하는 ~~, H로 끝나는...., 가운데에 T가 있으면)
--1) 사원이름이 S로 시작하는 모든 사원정보 조회하기
SELECT * FROM emp WHERE ename LIKE 'S%';

--2) 사원 이름 두번째 글자가 L인 사원만 조회
SELECT * FROM emp WHERE ename LIKE '_L%';

--3) 사원 이름에 AM이 포함되어 있는 사원만 조회
SELECT * FROM emp WHERE ename LIKE '%AM%';

--4) 사원 이름에 AM이 포함되어 있지 않는 사원만 조회
SELECT * FROM emp WHERE ename NOT LIKE '%AM%';

--IS NULL
--SELECT * FROM emp WHERE comm = NULL; (X)
SELECT * FROM emp WHERE comm IS NULL;

-- MGR(매니저ID)이 널인 사원벙보 조회
SELECT * FROM emp WHERE mgr IS NULL;

-- MGR(매니저ID)이 널인 사원벙보 조회
SELECT * FROM emp WHERE mgr IS NOT NULL;

-- 집합연산자 : 합집합(UNION), 교집합(INTERSECT), 차집합(MINUS)
-- DEPTNO 가 10인 테이블 과 DEPRNO 가 20인 결과를 구해서 합해서 보여주기
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno = 20;

SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno = 10;

-- 부서번호가 10이 아닌 사원들의 정보 조회
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno=10;

-- 부서번호가 10인 사원들의 정보 조회
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno=10;

-- 20, 30번 부서에 근무하고 있는 사원 중 SAL 이 2000 초과인 사원을 다음 두가지
-- 방식의 SELECT 문을 사용하여, 사원번호, 이름, 급여, 부서번호를 출력하는
-- SQL 문 작성하기
SELECT * FROM emp;

-- 집합연산자 사용하지 않는 방식

SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE deptNO IN(20,30) AND SAL>2000; 

-- 집한연산자를 사용하는 방식

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP 
WHERE deptNO = 10;

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP 
WHERE SAL>2000 AND deptNO = 30;

-- 오라클 함수
-- 1) 문자함수 : UPPER, LOWER, INITCAP

-- ENAME 을 UPPER, LOWER, INITCAP으로 변환하여 조회
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

-- DAUL 테이블 이용(SYS가 소유하고 있는 테이블로 임시연산이나 함수의 결과값을
-- 확인하는 용도)
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;

-- 직책 이름이 6글자 이상니 사원들의 정보 추출
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- 문자열 함수 : substr
SELECT job, substr(job,1,2), substr(job,3,2), substr(job,5) from emp;

SELECT job, substr(job, -length(job)), substr(job, -length(job), 2), substr(job, -3)
from emp;

-- 문자열 함수 : INSTR(특정문자 위치 찾기)
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FroM dual;

-- 문자열 함수 : replace(찾아서 바꾸기)
SELECT replace('이것이 ORACLE이다', '이것이', 'This is')
FROM dual;

SELECT '010-1234-5678' as replace_before,
replace('010-1234-5678', '-',' ') as replace_1,
replace('010-1234-5678', '-') as replace_2
from dual;

SELECT * FROM emp;

-- 문자열 함수 : concat(연결)
-- empno, ename을 연결하여 조회
SELECT concat(empno,ename), concat(empno, concat(';', ename))
from emp
WHERE ename='SCOTT';

--  || : 연결의 의미로 사용됨   -- '' 따옴표 안에 있는 것들은 꼭 대문자, 소문자 맞춰서
SELECT empno || ename, empno || ';' || ename
from emp
WHERE ename='SCOTT';

SELECT empno || ename, empno || ':' || ename
FROM emp
WHERE ename='SCOTT';

-- 문자열 함수 : TRIM(공백제거), LTRIM(왼쪽 공백 제거), RTRIM(오른쪽 공백 제거)
SELECT '     이것이      ', TRIM('    이것이     ')
FROM DUAL;

SELECT '     이것이      ', rTRIM('    이것이     ')
FROM DUAL;

SELECT '     이것이      ', LTRIM('    이것이     ')
FROM DUAL;

-- 문자열 함수 : REVERSE 
SELECT REVERSE('Oracle') FROM DUAL;

-- 2. 숫자함수 : ROUND(반올림), TRUNC(버림), CEIL(입력된 숫자와 가까운 큰 정수),
-- FLOOR(입력된 숫자와 가까운 작은 정수), MOD(나머지)

SELECT ROUND(1234.5678) AS ROUND,
    ROUND(1234.5678, 0) AS ROUND_1,
    ROUND(1234.5678,1) AS ROUND_2,
    ROUND(1234.5678,-1) AS ROUND_MINUS,
    ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM DUAL;

SELECT TRUNC(1234.5678) AS TRUNC,
    TRUNC(1234.5678,0) AS TRUNC_1,
    TRUNC(1234.5678,1) AS TRUNC_2,
    TRUNC(1234.5678,-1) AS TRUNC_MINUS,
    TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM DUAL;

SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM DUAL;

SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM DUAL; 

-- 3. 날짜함수 : SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM DUAL;

-- 날짜데이터는연산이 가능함 : 날짜데이터 +1, -1, 날짜데이터-날짜데이터
-- 날짜데이터 + 날짜데이터는 안됨

SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW
FROM DUAL;

-- 날짜함수 : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL;

-- 입사10주년이 되는 사원들 조회
SELECT empno, ename, hiredate, ADD_MONTHS(HIREDATE,120) FROM EMP;

-- 입사38년 미만인 사원 조회
SELECT empno, ename, hiredate, ADD_MONTHS(HIREDATE, 456) FROM EMP;
SELECT * FROM EMP WHERE ADD_MONTHS(hiredate, 456) > SYSDATE;

SELECT * FROM emp WHERE ADD_MONTHS(hiredate,456) < SYSDATE;

-- 날짜함수 : MONTHS_BETWEEN(두 날짜 사이의 차이)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;

SELECT EMPNO, ENAME, HIREDATE, SYSDATE, MONTHS_BETWEEN(HIREDATE,sYSDATE) AS MONTHS1,
MONTHS_BETWEEN(HIREDATE,sYSDATE) AS MONTH2, TRUNC(MONTHS_BETWEEN(HIREDATE,sYSDATE))
FROM EMP;

-- 날짜함수 : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일'), LAST_DAY(SYSDATE)
FROM DUAL;

-- 4. 형변환 함수 : TO_CHAR(날짜, 숫자데이터를 문자로 변환),
--                  TO_NUMBER(문자데이터를 숫자데이터를 문자로 변환),
--                  TO_DATE(문자 데이터를 날짜로 변환)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM') AS 현재날짜 FROM DUAL;

-- 오늘날짜를 년/월/일 16:51:45 표현
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간 FROM DUAL;

SELECT 1300-'1500', '1300'+1500 FROM DUAL;
SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM DUAL;
SELECT TO_NUMBER(1,300)-'1500', '1300'+1,500 FROM DUAL;
SELECT 1,300-'1500', '1300'+1,500 FROM DUAL;

SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM DUAL;

--SELECT TO_NUMBER('1,300')-TO_NUMBER('1,500') FROM DUAL;(X)

SELECT TO_NUMBER('1,300', '9999') - TO_NUMBER('1,5','99') FROM DUAL;
SELECT TO_NUMBER('1,3', '9999') - TO_NUMBER('1,5','99') FROM DUAL;

SELECT SAL, TO_CHAR(SAL, '$999,999') AS SAL_$,
TO_CHAR(SAL, 'L999,999') AS SAL_L,
TO_CHAR(SAL, '$999,999.00') AS SAL_1,
TO_CHAR(SAL, '000.999,999.00') AS SAL_2,
TO_CHAR(SAL, '000999999.99') AS SAL_3,
TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP;

--selcet to_date('2020-11-05'
to_date('20201105', 'yyyy-mm-dd') as todate2 from dual;


--1981년 6월 1일 이후에 입사한 사원정보 조회
SELECT *
FROM emp
where hiredate > TO_date('1981-06-01', 'YYYY-MM-DD');

select to_date('2019-12-20') - to_date('2019-10-20') from dual;

-- 널처리 함수 : NVL, NVL2
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL(COMM,0), SAL+NVL(COMM,0)
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL2(COMM,'O','X'), NVL2(COMM, SAL*12+COMM,SAL*12) AS ANNSAL
FROM EMP;

-- DECODE 함수와 CASE문
-- JOB이 MANAGER, SALESMAN, ANALYST 경우에 각각의 다른 비율을 적용하고 싶다면?
SELECT empno,ename,job,sal, DECODE(JOB,
    `                               'MANAGER', SAL*1.1,
                                    'SALESMAN', SAL*1.05,
                                    'ANALYST', SAL,
                                    SAL*1.03) AS UPSAL
FROM EMP;

SELECT empno,ename,job,sal,CASE JOB,
        `                         WHEN 'MANAGER' THEN SAL*1.1,
                                  WHEN 'SALESMAN' THEN SAL*1.05,
                                  WHEN 'ANALYST' THEN SAL,
                                  else  SAL*1.03
                           end AS UPSAL
FROM EMP;

SELECT empno,ename,job,sal,CASE 
                            WHEN COMM IS NULL THEN '해당사항없음'
                            WHEN COMM=0 THEN '수당없음'
                            WHEN COMM>0 THEN '수당 : ' || COMM
                            END AS COMM_TEXT FROM EMP;




