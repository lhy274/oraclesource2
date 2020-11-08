-- sum : 합계
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- count : 개수
SELECT COUNT(*) FROM emp;

-- 부서번호가 30번인 직원 수 구하기
SELECT COUNT(*) FROM emp WHERE deptno=30;

SELECT COUNT(sal), COUNT(DISTINCT sal), COUNT(ALL sal) FROM emp;

-- MAX(최대값), MIN(최소값)
SELECT MAX(SAL), MIN(SAL) FROM emp;

-- 부서번호가 20인 사원의 입사일 중 가장 최근 입사일 구하기
SELECT MAX(HIREDATE) FROM emp WHERE deptno=20;

-- AVERAGE : 평균
SELECT AVG(SAL) FROM emp;
SELECT AVG(SAL) FROM emp WHERE deptno=30;
SELECT AVG(DISTINCT SAL) FROM emp;

-- 부서별 월급의 평균을 알고 싶다면?
SELECT AVG(SAL) FROM emp WHERE deptno=30;
SELECT AVG(SAL) FROM emp WHERE deptno=20;
SELECT AVG(SAL) FROM emp WHERE deptno=10;

-- GROUP BY : 결과값을 원하는 열로 묶어 출력
SELECT deptno,AVG(SAL) FROM emp GROUP BY deptno;

-- 부서번호별 추가수당 평균 구하기
SELECT deptno, AVG(COMM) FROM emp GROUP BY deptno;

-- 부서번호, 직책별 급여 평균 구하기
SELECT DEPTNO,AVG(SAL),JOB 
FROM emp GROUP BY deptno,job ORDER BY deptno,job;

-- group by 절에 포함 안되는 열을 select 에 포함하면 안됨
SELECT ename,deptno, AVG(sal)
FROM emp
GROUP BY deptno;

-- HAVING : GROUP BY 절에 조건을 줄 때 사용
-- 각 부서의 직책별 평균 급여를 구하되 그 평균 급여가 2000 이상인 그룹만
-- 출력
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job
HAVING AVG(sal) >= 2000 
ORDER BY deptno, job;

/* 오류
SELECT deptno, job, AVG(sal)
FROM emp
WHERE AVG(sal) >= 2000 
GROUP BY deptno, job
ORDER BY deptno, job;
*/

-- EMP 테이블의 부서별 직책의 평균 급여가 500이상인 사원들의
-- 부서번호, 직책, 부서별 직책의 평균 급여 출력
SELECT deptno, job, AVG(sal)    
FROM emp
GROUP BY deptno, job HAVING AVG(sal) >= 500;

SELECT deptno, job, AVG(sal)
FROM emp
WHERE sal<=3000
GROUP BY deptno, job HAVING AVG(sal) >= 2000
ORDER BY deptno, job;

/*
 ppt 연습문제 
*/
-- 문1

SELECT deptno, FLOOR(AVG(sal)) AS AVG_SAL, MAX(sal) AS MAX_SAL, 
       MIN(sal) AS MIN_SAL, COUNT(empno) AS CNT
FROM emp
GROUP BY deptno;

-- 문 2

SELECT job, COUNT(job)
FROM emp
GROUP BY job HAVING COUNT(job) >= 3;

-- 문 3
SELECT TO_CHAR(hiredate,'YYYY') AS hire_year, deptno, 
       COUNT(TO_CHAR(hiredate,'YYYY')) AS CNT
FROM emp
GROUP BY deptno, TO_CHAR(hiredate,'YYYY')
ORDER BY TO_CHAR(hiredate,'YYYY') DESC;

-- 조인

-- 나올 수 있는 모든 조합 조회
SELECT * FROM EMP, DEPT  ORDER BY EMPNO;

-- 1) 내부조인(등가조인)
SELECT *
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO  -- 조인기준
ORDER BY EMPNO;

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO  -- 조인기준
ORDER BY EMPNO;


SELECT *
FROM EMP INNER JOIN DEPT  
ON EMP.DEPTNO = DEPT.DEPTNO  -- 조인기준
ORDER BY EMPNO;

SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO  -- 조인기준
ORDER BY EMPNO;


-- 두 테이블에 같은 이름의 필드가 존재하는 경우
-- 어느 테이블에 있는 필드를 가지고 올것인지 정확히 명시
select empno,ename,job,d.deptno,dname 
from emp E, dept D
where E.deptno = D.deptno
order by empno;

--emp테이블과 dept 테이블을 조인하여 enpno, ename, sal, deptno,
--dname, loc 를 조회한다. 단, 급여가 3000 이상인 사원만 출력
select e.empno, e.ename, e.sal, d.deptno,d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and sal>=3000;

-- emp 테이블의 별칭을 e로, dept 테이블 별칭을 d로 하여
-- 급여가 2500이하이고, 사원번호가 9999 이하인 사원의 정보를 출력

select *
from emp e, dept d
WHERE E.DEPTNO = D.DEPTNO AND SAL<=2500 AND EMPNO <= 9999;

-- emp 테이블의 별칭을 e로, salgrade 테이블 별칭을 s로 하여
-- 각 사원의 정보와 더불어 사원의 등급 정보를 출력

select *
from emp e, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- 2) 셀프조인(자체조인) : 조인 테이블이 자기 자신 테이블일때
SELECT * FROM emp;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

-- OUTER JOIN(외부조인) : 조건을 만족하지 않는 데이터 추출

-- 1) LEFT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+); 


-- 2) RIGHT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO; 

-- PPT 연습문제
-- 급여가 2000초과인 사원들의 부서 정보, 사원 정보를 아래와 같이 출력하는 SQL 문을 작성
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL>2000 ORDER BY E.DEPTNO;

SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
WHERE E.SAL>2000 ORDER BY E.DEPTNO;



-- 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력하는 SQL문을 작성

SELECT E.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL,
       MIN(E.SAL) AS MIN_SAL, COUNT(DNAME)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
GROUP BY E.DEPTNO, D.DNAME
ORDER BY E.DEPTNO;

-- 모든 부서정보와 사원 정보를 아래와 같이 부서번호, 사원이름 순으로 정렬하여 출력하는 SQL문을 작성

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO ORDER BY D.DEPTNO, E.EMPNO;


-- 모든 부서정보와 사원 정보, 급여등급 정보, 각 사원의 직속 상관의 정보 부서번호, 
-- 사원번호 순으로 정렬하여 출력하는 SQL문을 작성
SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO,
       S.LOSAL,S.HISAL,S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 
RIGHT OUTER JOIN DEPT D1 ON E1.DEPTNO = D1.DEPTNO
LEFT OUTER JOIN SALGRADE S ON E1.SAL BETWEEN S.LOSAL AND S.HISAL
LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO
ORDER BY D1.DEPTNO, E1.EMPNO;


SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO,
       S.LOSAL,S.HISAL,S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, DEPT D1, SALGRADE S, EMP E2
WHERE E1.DEPTNO(+) = D1.DEPTNO AND E1.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+) AND E1.MGR = E2.EMPNO(+)
ORDER BY E1.DEPTNO;

