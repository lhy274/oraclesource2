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
