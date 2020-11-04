-- SCOTT ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- emp ���̺��� ����
DESC emp;

--emp ���̺��� ��� ���� ��ȸ
SELECT * FROM emp;

--emp ���̺��� Ư�� �ʵ常 ��ȸ
SELECT ename, job, sal FROM emp;

--�ߺ� ���ڵ� ������ �� ��ȸ : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais(��Ī): AS
SELECT empno AS �����ȣ FROM emp;

SELECT ename, sal, sal*12+comm AS ����, comm FROM emp;

SELECT ename as ����̸�, job as "�� å" from emp;

-- ORDER BY : �����Ͽ� ��ȸ

-- �ϳ��� ���� ������ �־�  ��������(ASC) ��ȸ
SELECT ename,sal FROM emp ORDER by sal;

-- �ϳ��� ���� ������ �־� �������� ��ȸ
SELECT ename,sal FROM emp ORDER by sal DESC;

-- ��ü �����͸� ��ȸ(�����ȣ ��������)
SELECT * FROM emp ORDER BY empno;

-- �μ���ȣ�� ���������̰�, �μ���ȣ�� �����ϴٸ� �޿��� ��������
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

SELECT empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME, mgr as MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO FROM EMP;

SELECT * FROM emp ORDER by  empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME, mgr as MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO;

SELECT empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME, mgr as MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO 
FROM EMP order by deptno desc, ename asc;

-- WHERE : ��ȸ�� �� �� ���� �ֱ�

--�μ���ȣ�� 36���� ��� ��ȸ
SELECT * FROM emp WHERE deptno = 30;

-- �����ȣ�� 7782�� ��� ��ȣ ��ȸ
select * from emp where empno=7782;

--�μ���ȣ�� 30�̰� ����� ��å�� salseman ���� ��ȸ
select * from emp where deptno=30 and job='SALESMAN';

-- �����ȣ�� 7499���� �μ���ȣ�� 30�� ���� ��ȸ
SELECT * FROM emp where empno=7499 and deptno=30;

-- �μ���ȣ�� 30�̰ų�, �����å�� clerk ���� ��ȸ
SELECT * FROM EMP WHeRE deptno = 30 OR job='clerk';

--�μ���ȣ�� 20�̰ų�, �����å�� salesman ���� ��ȸ
SELECT * FROM emp WHeRE deptno=20 OR job='salesman';












