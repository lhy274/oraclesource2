-- HR 계정이 가지고 있는 모든 테이블 보기
select * from tab;

SELECT * From employees;

select first_name, last_name, job_id from employees;

--SELECT * FROM EMP WHRE deptno = 30 OR job='clerk';
--SELECT * FROM emp where empno=7499 and deptno=30;
select * from employees where employee_id=176 and last_name, job_id;

select * from employees where employee_id=176;

select * from employees where salary>=12000 and last_name and salary;

ㅡㅡ사원번호가 176인 사람의 laset_name와 부서번호 조회
SELECT last_name, department_id FROM employees WHERE employee_id=176;

-- 연봉 12000 이상 직원들의
SELECT last_name, salary FROM employees WHERE salary >= 12000;

--연봉 5000에서 12000의 범위 이외의 사람들의 LAST_NAME 및 연봉 조회
SELET last_name, salary from employees whers salary < 5000 or salary > 12000;

--연산자를 이용한 조회

--산술연산자"sal*12 한 금액에 3600 인 데이터 조회
select * from emp where sal*12=36000;

select * from emp where sal > 3000;
salect * form emp where sal >= 3000;

select * from emp where ename >= 'f';

--2500이상이고
select * from emp where sal >=2500 AND job='ANALYST';

select * from emp WHERE job='manager' or job='SALESMAN' or job='clerk';

select * from emp where sal!=3000;

SELECT * FROM emp where SAL!=3000;

--20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 알파벳순으로 조회
SELECT * FROM employees ORDER BY last_name and department_id where department_id IN(20, 50);

--커미션을 버는 모든 사원들의 LAST_NAME, 연봉, 커미션 조회하기. 단, 연봉의 역순 및 커미션 역순으로 결과 출력
SELECT * FROM employees where department_id IN(20, 50);

--연봉이 2500, 3500, 7000이 아니며, 직업이 SA_REP 이나 ST_CLERK인 사람들 조회
SELECT * FROM employees WHERE SALARY NOT IN(2500, 3500, 7000) AND job_id IN('SA_REP', 'ST_CLERK');

--2000/02/20 ~ 2008/05/01 사이에 고용된 사원들이 LAST_NAME, 사원번호, 고용일자 조회 단, 고용일자 내림차순으로 정렬하여 출력
SELECT * FROM employees LAST_NAME, employees_id;

--2004년에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름차순 정렬하여 출력
SELECT * FROM employees 




