-- SCOTT ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- emp ���̺��� ����
DESC emp;


-- emp ���̺��� ��� ���� ��ȸ
SELECT * FROM emp;

-- emp ���̺��� Ư�� �ʵ常 ��ȸ
SELECT ename, job, sal FROM emp;



-- �ߺ� ���ڵ� ������ �� ��ȸ : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais(��Ī) : AS
SELECT empno AS �����ȣ FROM emp;

SELECT ename, sal, sal*12+comm AS ����, comm FROM emp;

SELECT ename as ����̸�, job AS "�� å" from emp;

-- ORDER BY : �����Ͽ� ��ȸ

-- �ϳ��� ���� ������ �־� ��������(ASC) ��ȸ
SELECT ename,sal FROM emp ORDER BY sal;

-- �ϳ��� ���� ������ �־� �������� ��ȸ
SELECT ename,sal FROM emp ORDER BY sal DESC;

-- ��ü �����͸� ��ȸ(�����ȣ ��������)
SELECT * FROM emp ORDER BY empno;

-- �μ���ȣ�� ���������̰�, �μ���ȣ�� �����ϴٸ� �޿��� ��������
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

-- ��µǴ� ���� ��Ī�� ������ ���� �����Ѵ�.
-- EMPNO : EMPLOYEE_NO
-- ENAME : EMPLOYEE_NAME
-- MGR : MANAGER
-- SAL : SALARY
-- COMM : COMMISSION
-- DEPTNO : DEPARTMENT_NO

-- �μ���ȣ�� �������� ������������ �����ϵ� �μ� ��ȣ�� ���ٸ� ��� �̸��� �������� �������� �����Ѵ�.

SELECT empno AS EMPLOYEE_NO, ename AS EMPLOYEE_NAME, job, mgr AS MANAGER,
       hiredate, sal AS SALARY, comm AS COMMISSION, deptno AS DEPARTMENT_NO
FROM emp ORDER BY deptno DESC, ename ASC;

-- WHERE : ��ȸ�� �� �� ���� �ֱ�

-- �μ���ȣ�� 30���� ��� ��ȸ
SELECT * FROM emp WHERE deptno = 30;

-- �����ȣ�� 7782�� ��� ��ȸ
SELECT * FROM emp WHERE empno=7782;

-- �μ���ȣ�� 30�̰�, �����å�� SALESMAN ���� ��ȸ
SELECT * FROM emp WHERE deptno=30 AND job='SALESMAN';

-- �����ȣ�� 7499�̰�, �μ���ȣ�� 30�� ���� ��ȸ
SELECT * FROM emp WHERE empno=7499 AND deptno=30;

-- �μ���ȣ�� 30�̰ų�, �����å�� CLERK ���� ��ȸ
SELECT * FROM emp WHERE deptno=30 OR job='CLERK';

-- �μ���ȣ�� 20�̰ų�, �����å�� SALESMAN ���� ��ȸ
SELECT * FROM emp WHERE deptno=20 OR job='SALESMAN';


-- �����ڸ� �̿��� ��ȸ

-- ��������� : sal*12 �� �ݾ��� 36000 �� ������ ��ȸ
SELECT * FROM emp WHERE sal*12=36000;

-- ���迬���� : >, <, >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

SELECT * FROM emp WHERE ename >= 'F';

-- �������� : AND, OR
-- �޿��� 2500�̻��̰�, ������ ANALYST�� ������� ��ȸ
SELECT * FROM emp WHERE sal >=2500 AND job='ANALYST';

-- ������ MANAGER, SALESMAN, CLERK �� ������� ��ȸ
SELECT * FROM emp WHERE job='MANAGER' OR job='SALESMAN' OR job='CLERK';

-- ������� : ���� �׸��� ������ �˻�

-- SAL�� 3000�� �ƴ� ������� ���
SELECT * FROM emp WHERE sal!=3000;
SELECT * FROM emp WHERE sal<>3000;
SELECT * FROM emp WHERE sal^=3000;

-- ������ MANAGER, SALESMAN, CLERK �� ������� ��ȸ
SELECT * FROM emp WHERE job='MANAGER' OR job='SALESMAN' OR job='CLERK';

-- IN ������
SELECT * FROM emp WHERE job IN('MANAGER','SALESMAN','CLERK');

-- ������ MANAGER, SALESMAN, CLERK�� �ƴ� ������� ��ȸ
SELECT * FROM emp WHERE job!='MANAGER' AND job!='SALESMAN' AND job!='CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');

-- IN �� ����ؼ� �μ���ȣ�� 10,20���� ������� ��ȸ
SELECT * FROM emp WHERE deptno IN(10,20);

-- DETWEEN A AND B

--�޿��� 2000�̻� 3000���� ��� ��ȸ
SELECT * FROM emp WHeRE sal >=2000 AND sal <= 3000;

SELECT * FROM emp WHeRE sal BETWEEN 2000 and  3000;
--�޿��� 2000�̻� 3000���� ��� ��ȸ
SELECT * FROM emp WHeRE sal NOT BETWEEN 2000 and  3000;

-- LIKE : ���ڿ� �˻� ���(s�� �����ϴ� ~~, H�� ������...., ����� T�� ������)
--1) ����̸��� S�� �����ϴ� ��� ������� ��ȸ�ϱ�
SELECT * FROM emp WHERE ename LIKE 'S%';

--2) ��� �̸� �ι�° ���ڰ� L�� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '_L%';

--3) ��� �̸��� AM�� ���ԵǾ� �ִ� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '%AM%';

--4) ��� �̸��� AM�� ���ԵǾ� ���� �ʴ� ����� ��ȸ
SELECT * FROM emp WHERE ename NOT LIKE '%AM%';

--IS NULL
--SELECT * FROM emp WHERE comm = NULL; (X)
SELECT * FROM emp WHERE comm IS NULL;

-- MGR(�Ŵ���ID)�� ���� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS NULL;

-- MGR(�Ŵ���ID)�� ���� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS NOT NULL;

-- ���տ����� : ������(UNION), ������(INTERSECT), ������(MINUS)
-- DEPTNO �� 10�� ���̺� �� DEPRNO �� 20�� ����� ���ؼ� ���ؼ� �����ֱ�
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno = 20;

SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno = 10;

-- �μ���ȣ�� 10�� �ƴ� ������� ���� ��ȸ
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno=10;

-- �μ���ȣ�� 10�� ������� ���� ��ȸ
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE deptno=10;

-- 20, 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� SAL �� 2000 �ʰ��� ����� ���� �ΰ���
-- ����� SELECT ���� ����Ͽ�, �����ȣ, �̸�, �޿�, �μ���ȣ�� ����ϴ�
-- SQL �� �ۼ��ϱ�
SELECT * FROM emp;

-- ���տ����� ������� �ʴ� ���

SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE deptNO IN(20,30) AND SAL>2000; 

-- ���ѿ����ڸ� ����ϴ� ���

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

-- ����Ŭ �Լ�
-- 1) �����Լ� : UPPER, LOWER, INITCAP

-- ENAME �� UPPER, LOWER, INITCAP���� ��ȯ�Ͽ� ��ȸ
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

-- DAUL ���̺� �̿�(SYS�� �����ϰ� �ִ� ���̺�� �ӽÿ����̳� �Լ��� �������
-- Ȯ���ϴ� �뵵)
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM DUAL;

-- ��å �̸��� 6���� �̻�� ������� ���� ����
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- ���ڿ� �Լ� : substr
SELECT job, substr(job,1,2), substr(job,3,2), substr(job,5) from emp;

SELECT job, substr(job, -length(job)), substr(job, -length(job), 2), substr(job, -3)
from emp;

-- ���ڿ� �Լ� : INSTR(Ư������ ��ġ ã��)
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FroM dual;

-- ���ڿ� �Լ� : replace(ã�Ƽ� �ٲٱ�)
SELECT replace('�̰��� ORACLE�̴�', '�̰���', 'This is')
FROM dual;

SELECT '010-1234-5678' as replace_before,
replace('010-1234-5678', '-',' ') as replace_1,
replace('010-1234-5678', '-') as replace_2
from dual;

SELECT * FROM emp;

-- ���ڿ� �Լ� : concat(����)
-- empno, ename�� �����Ͽ� ��ȸ
SELECT concat(empno,ename), concat(empno, concat(';', ename))
from emp
WHERE ename='SCOTT';

--  || : ������ �ǹ̷� ����   -- '' ����ǥ �ȿ� �ִ� �͵��� �� �빮��, �ҹ��� ���缭
SELECT empno || ename, empno || ';' || ename
from emp
WHERE ename='SCOTT';

SELECT empno || ename, empno || ':' || ename
FROM emp
WHERE ename='SCOTT';

-- ���ڿ� �Լ� : TRIM(��������), LTRIM(���� ���� ����), RTRIM(������ ���� ����)
SELECT '     �̰���      ', TRIM('    �̰���     ')
FROM DUAL;

SELECT '     �̰���      ', rTRIM('    �̰���     ')
FROM DUAL;

SELECT '     �̰���      ', LTRIM('    �̰���     ')
FROM DUAL;

-- ���ڿ� �Լ� : REVERSE 
SELECT REVERSE('Oracle') FROM DUAL;

-- 2. �����Լ� : ROUND(�ݿø�), TRUNC(����), CEIL(�Էµ� ���ڿ� ����� ū ����),
-- FLOOR(�Էµ� ���ڿ� ����� ���� ����), MOD(������)

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

-- 3. ��¥�Լ� : SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM DUAL;

-- ��¥�����ʹ¿����� ������ : ��¥������ +1, -1, ��¥������-��¥������
-- ��¥������ + ��¥�����ʹ� �ȵ�

SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW
FROM DUAL;

-- ��¥�Լ� : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL;

-- �Ի�10�ֳ��� �Ǵ� ����� ��ȸ
SELECT empno, ename, hiredate, ADD_MONTHS(HIREDATE,120) FROM EMP;

-- �Ի�38�� �̸��� ��� ��ȸ
SELECT empno, ename, hiredate, ADD_MONTHS(HIREDATE, 456) FROM EMP;
SELECT * FROM EMP WHERE ADD_MONTHS(hiredate, 456) > SYSDATE;

SELECT * FROM emp WHERE ADD_MONTHS(hiredate,456) < SYSDATE;

-- ��¥�Լ� : MONTHS_BETWEEN(�� ��¥ ������ ����)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;

SELECT EMPNO, ENAME, HIREDATE, SYSDATE, MONTHS_BETWEEN(HIREDATE,sYSDATE) AS MONTHS1,
MONTHS_BETWEEN(HIREDATE,sYSDATE) AS MONTH2, TRUNC(MONTHS_BETWEEN(HIREDATE,sYSDATE))
FROM EMP;

-- ��¥�Լ� : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������'), LAST_DAY(SYSDATE)
FROM DUAL;

-- 4. ����ȯ �Լ� : TO_CHAR(��¥, ���ڵ����͸� ���ڷ� ��ȯ),
--                  TO_NUMBER(���ڵ����͸� ���ڵ����͸� ���ڷ� ��ȯ),
--                  TO_DATE(���� �����͸� ��¥�� ��ȯ)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM') AS ���糯¥ FROM DUAL;

-- ���ó�¥�� ��/��/�� 16:51:45 ǥ��
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð� FROM DUAL;

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


--1981�� 6�� 1�� ���Ŀ� �Ի��� ������� ��ȸ
SELECT *
FROM emp
where hiredate > TO_date('1981-06-01', 'YYYY-MM-DD');

select to_date('2019-12-20') - to_date('2019-10-20') from dual;

-- ��ó�� �Լ� : NVL, NVL2
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL(COMM,0), SAL+NVL(COMM,0)
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL2(COMM,'O','X'), NVL2(COMM, SAL*12+COMM,SAL*12) AS ANNSAL
FROM EMP;

-- DECODE �Լ��� CASE��
-- JOB�� MANAGER, SALESMAN, ANALYST ��쿡 ������ �ٸ� ������ �����ϰ� �ʹٸ�?
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
                            WHEN COMM IS NULL THEN '�ش���׾���'
                            WHEN COMM=0 THEN '�������'
                            WHEN COMM>0 THEN '���� : ' || COMM
                            END AS COMM_TEXT FROM EMP;




