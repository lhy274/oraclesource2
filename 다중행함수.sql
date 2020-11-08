-- sum : �հ�
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- count : ����
SELECT COUNT(*) FROM emp;

-- �μ���ȣ�� 30���� ���� �� ���ϱ�
SELECT COUNT(*) FROM emp WHERE deptno=30;

SELECT COUNT(sal), COUNT(DISTINCT sal), COUNT(ALL sal) FROM emp;

-- MAX(�ִ밪), MIN(�ּҰ�)
SELECT MAX(SAL), MIN(SAL) FROM emp;

-- �μ���ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի��� ���ϱ�
SELECT MAX(HIREDATE) FROM emp WHERE deptno=20;

-- AVERAGE : ���
SELECT AVG(SAL) FROM emp;
SELECT AVG(SAL) FROM emp WHERE deptno=30;
SELECT AVG(DISTINCT SAL) FROM emp;

-- �μ��� ������ ����� �˰� �ʹٸ�?
SELECT AVG(SAL) FROM emp WHERE deptno=30;
SELECT AVG(SAL) FROM emp WHERE deptno=20;
SELECT AVG(SAL) FROM emp WHERE deptno=10;

-- GROUP BY : ������� ���ϴ� ���� ���� ���
SELECT deptno,AVG(SAL) FROM emp GROUP BY deptno;

-- �μ���ȣ�� �߰����� ��� ���ϱ�
SELECT deptno, AVG(COMM) FROM emp GROUP BY deptno;

-- �μ���ȣ, ��å�� �޿� ��� ���ϱ�
SELECT DEPTNO,AVG(SAL),JOB 
FROM emp GROUP BY deptno,job ORDER BY deptno,job;

-- group by ���� ���� �ȵǴ� ���� select �� �����ϸ� �ȵ�
SELECT ename,deptno, AVG(sal)
FROM emp
GROUP BY deptno;

-- HAVING : GROUP BY ���� ������ �� �� ���
-- �� �μ��� ��å�� ��� �޿��� ���ϵ� �� ��� �޿��� 2000 �̻��� �׷츸
-- ���
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job
HAVING AVG(sal) >= 2000 
ORDER BY deptno, job;

/* ����
SELECT deptno, job, AVG(sal)
FROM emp
WHERE AVG(sal) >= 2000 
GROUP BY deptno, job
ORDER BY deptno, job;
*/

-- EMP ���̺��� �μ��� ��å�� ��� �޿��� 500�̻��� �������
-- �μ���ȣ, ��å, �μ��� ��å�� ��� �޿� ���
SELECT deptno, job, AVG(sal)    
FROM emp
GROUP BY deptno, job HAVING AVG(sal) >= 500;

SELECT deptno, job, AVG(sal)
FROM emp
WHERE sal<=3000
GROUP BY deptno, job HAVING AVG(sal) >= 2000
ORDER BY deptno, job;

/*
 ppt �������� 
*/
-- ��1

SELECT deptno, FLOOR(AVG(sal)) AS AVG_SAL, MAX(sal) AS MAX_SAL, 
       MIN(sal) AS MIN_SAL, COUNT(empno) AS CNT
FROM emp
GROUP BY deptno;

-- �� 2

SELECT job, COUNT(job)
FROM emp
GROUP BY job HAVING COUNT(job) >= 3;

-- �� 3
SELECT TO_CHAR(hiredate,'YYYY') AS hire_year, deptno, 
       COUNT(TO_CHAR(hiredate,'YYYY')) AS CNT
FROM emp
GROUP BY deptno, TO_CHAR(hiredate,'YYYY')
ORDER BY TO_CHAR(hiredate,'YYYY') DESC;

-- ����

-- ���� �� �ִ� ��� ���� ��ȸ
SELECT * FROM EMP, DEPT  ORDER BY EMPNO;

-- 1) ��������(�����)
SELECT *
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO  -- ���α���
ORDER BY EMPNO;

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO  -- ���α���
ORDER BY EMPNO;


SELECT *
FROM EMP INNER JOIN DEPT  
ON EMP.DEPTNO = DEPT.DEPTNO  -- ���α���
ORDER BY EMPNO;

SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO  -- ���α���
ORDER BY EMPNO;


-- �� ���̺� ���� �̸��� �ʵ尡 �����ϴ� ���
-- ��� ���̺� �ִ� �ʵ带 ������ �ð����� ��Ȯ�� ���
select empno,ename,job,d.deptno,dname 
from emp E, dept D
where E.deptno = D.deptno
order by empno;

--emp���̺�� dept ���̺��� �����Ͽ� enpno, ename, sal, deptno,
--dname, loc �� ��ȸ�Ѵ�. ��, �޿��� 3000 �̻��� ����� ���
select e.empno, e.ename, e.sal, d.deptno,d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and sal>=3000;

-- emp ���̺��� ��Ī�� e��, dept ���̺� ��Ī�� d�� �Ͽ�
-- �޿��� 2500�����̰�, �����ȣ�� 9999 ������ ����� ������ ���

select *
from emp e, dept d
WHERE E.DEPTNO = D.DEPTNO AND SAL<=2500 AND EMPNO <= 9999;

-- emp ���̺��� ��Ī�� e��, salgrade ���̺� ��Ī�� s�� �Ͽ�
-- �� ����� ������ ���Ҿ� ����� ��� ������ ���

select *
from emp e, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- 2) ��������(��ü����) : ���� ���̺��� �ڱ� �ڽ� ���̺��϶�
SELECT * FROM emp;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

-- OUTER JOIN(�ܺ�����) : ������ �������� �ʴ� ������ ����

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

-- PPT ��������
-- �޿��� 2000�ʰ��� ������� �μ� ����, ��� ������ �Ʒ��� ���� ����ϴ� SQL ���� �ۼ�
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL>2000 ORDER BY E.DEPTNO;

SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
WHERE E.SAL>2000 ORDER BY E.DEPTNO;



-- �� �μ��� ��� �޿�, �ִ� �޿�, �ּ� �޿�, ������� ����ϴ� SQL���� �ۼ�

SELECT E.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL,
       MIN(E.SAL) AS MIN_SAL, COUNT(DNAME)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
GROUP BY E.DEPTNO, D.DNAME
ORDER BY E.DEPTNO;

-- ��� �μ������� ��� ������ �Ʒ��� ���� �μ���ȣ, ����̸� ������ �����Ͽ� ����ϴ� SQL���� �ۼ�

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO ORDER BY D.DEPTNO, E.EMPNO;


-- ��� �μ������� ��� ����, �޿���� ����, �� ����� ���� ����� ���� �μ���ȣ, 
-- �����ȣ ������ �����Ͽ� ����ϴ� SQL���� �ۼ�
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

