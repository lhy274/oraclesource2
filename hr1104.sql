-- HR ������ ������ �ִ� ��� ���̺� ����
select * from tab;

SELECT * From employees;

select first_name, last_name, job_id from employees;

--SELECT * FROM EMP WHRE deptno = 30 OR job='clerk';
--SELECT * FROM emp where empno=7499 and deptno=30;
select * from employees where employee_id=176 and last_name, job_id;

select * from employees where employee_id=176;

select * from employees where salary>=12000 and last_name and salary;

�Ѥѻ����ȣ�� 176�� ����� laset_name�� �μ���ȣ ��ȸ
SELECT last_name, department_id FROM employees WHERE employee_id=176;

-- ���� 12000 �̻� ��������
SELECT last_name, salary FROM employees WHERE salary >= 12000;

--���� 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
SELET last_name, salary from employees whers salary < 5000 or salary > 12000;

--�����ڸ� �̿��� ��ȸ

--���������"sal*12 �� �ݾ׿� 3600 �� ������ ��ȸ
select * from emp where sal*12=36000;

select * from emp where sal > 3000;
salect * form emp where sal >= 3000;

select * from emp where ename >= 'f';

--2500�̻��̰�
select * from emp where sal >=2500 AND job='ANALYST';

select * from emp WHERE job='manager' or job='SALESMAN' or job='clerk';

select * from emp where sal!=3000;

SELECT * FROM emp where SAL!=3000;
