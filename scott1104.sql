-- SCOTT 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- emp 테이블의 구조
DESC emp;

--emp 테이블의 모든 내용 조회
SELECT * FROM emp;

--emp 테이블의 특정 필드만 조회
SELECT ename, job, sal FROM emp;

--중복 레코드 제거한 후 조회 : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais(별칭): AS
SELECT empno AS 사원번호 FROM emp;

SELECT ename, sal, sal*12+comm AS 연봉, comm FROM emp;

SELECT ename as 사원이름, job as "직 책" from emp;

-- ORDER BY : 정렬하여 조회

-- 하나의 열로 기준을 주어  오름차순(ASC) 조회
SELECT ename,sal FROM emp ORDER by sal;

-- 하나의 열로 기준을 주어 내림차순 조회
SELECT ename,sal FROM emp ORDER by sal DESC;

-- 전체 데이터를 조회(사원번호 오름차순)
SELECT * FROM emp ORDER BY empno;

-- 부서번호의 오름차순이고, 부서번호가 동일하다면 급여의 내림차순
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

SELECT empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME, mgr as MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO FROM EMP;

SELECT * FROM emp ORDER by  empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME, mgr as MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO;

SELECT empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME, mgr as MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO 
FROM EMP order by deptno desc, ename asc;

-- WHERE : 조회를 할 때 기준 주기

--부서번호가 36번인 사원 조회
SELECT * FROM emp WHERE deptno = 30;

-- 사원번호가 7782인 사원 번호 조회
select * from emp where empno=7782;

--부서번호가 30이고 사원의 직책이 salseman 정보 조회
select * from emp where deptno=30 and job='SALESMAN';

-- 사원번호가 7499악흐 부서번호가 30인 정보 조회
SELECT * FROM emp where empno=7499 and deptno=30;

-- 부서번호가 30이거나, 사원직책이 clerk 정보 조회
SELECT * FROM EMP WHeRE deptno = 30 OR job='clerk';

--부서번호가 20이거나, 사원직책이 salesman 정보 조회
SELECT * FROM emp WHeRE deptno=20 OR job='salesman';












