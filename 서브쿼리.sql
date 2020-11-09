-- ������ �޿����� ���� �޿��� �޴� ����� ����ϱ�

-- ������ �޿� �˾Ƴ���
SELECT SAL
FROM EMP
WHERE ENAME = 'JONES';

-- ���� �޿� ��� ����ϱ�
SELECT * FROM EMP WHERE SAL > 2975;

-- �������� : ������ �ȿ� �ٸ� �������� �����ϰ� �ִ� ����
-- ������ �������� : >, <, =, <= , >=, ���� ���� : <>, !=, ^=
SELECT * FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

-- ����̸��� ALLEN �� ����� �߰����纸�� ���� �޴� ����� ���
SELECT * FROM EMP WHERE comm > (SELECT comm FROM EMP WHERE ENAME = 'ALLEN');

--�̰� �� �ȵ�?
SELECT * FROM EMP WHERE COMM > (SELECT COMM FORM emp WHERE ENAME = 'ALLEN');

-- ����̸��� WARD �� ����� �Ի��Ϻ��� ���� �Ի��� ����� ���
SELECT * FROM EMP WHERE hiredate > (SELECT hiredate FROM EMP WHERE ENAME = 'WARD');

-- �̰� �� �ȵ�?
SELECT * FROM EMP WHERE hiredate < (SELECT hiredate FORM EMP WHERE ENAME = 'WARD');

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM EMP WHERE hiredate > (SELECT hiredate FROM EMP WHERE DEPTNO = 20);

SELECT * FROM EMP WHERE AVG(SAL) < (SELECT AVG(SAL)FORM EMP WHERE DEPTNO = 20);

SELECT *
FROM EMP
WHERE DEPTNO = 20 AND SAL > (SELECT AVG(SAL) FROM EMP);

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ����� ���� ���
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND  DEPTNO= 20 AND SAL > (SELECT AVG(SAL) FROM EMP);

-- �������� ����� 2�� �̻� ������ ����� ������ ���������� ������ ��� �Ұ�
-- ������ ��������
-- SELECT * FROM EMP WHERE SAL >= (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;

-- IN
SELECT * FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- ANY(SUME)

-- ANY : IN �� ���� ����� ���� ����, ��, IN �� �� ���� �����
SELECT * FROM EMP WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT * FROM EMP WHERE SAL = SOME (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���
SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30;

SELECT * FROM EMP WHERE SAL < ANY (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);

SELECT * FROM EMP WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO=30);

SELECT SAL FROM EMP WHERE DEPTNO=30;
SELECT DISTINCT SAL FROM EMP WHERE DEPTNO=30;

-- -- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM EMP WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO=30);

-- ALL : ���� ������ ����� ��� �����ϴ� ���������� ������ ��
-- �μ���ȣ�� 30���� ������� �ּ� �޿����� �� ���� �޿��� �޴� ��� ���
SELECT * FROM EMP WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);

-- EXISTS : IN �� ����� ����, ��, IN ���� ������ �����
-- ���� ���� ����� �����ϸ� �������� ����� ���

SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=20);
SELECT * FROM EMP WHERE NOT EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=20);

SELECT EMPNO, DEPTNO
FROM EMP
WHERE EXISTS (SELECT DEPTNO
              FROM DEPT
              WHERE DEPTNO IN (20,30) AND EMP.DEPTNO = DEPT.DEPTNO);
              
SELECT EMPNO, DEPTNO
FROM EMP
WHERE EXISTS (SELECT 1
              FROM DEPT
              WHERE DEPTNO IN (20,30) AND EMP.DEPTNO = DEPT.DEPTNO);
              

SELECT EMPNO, DEPTNO
FROM EMP
WHERE NOT EXISTS (SELECT DEPTNO
              FROM DEPT
              WHERE DEPTNO IN (20,30) AND EMP.DEPTNO = DEPT.DEPTNO);

-- 20 30�� �ֵ鸸 �̾Ƴ� ��.

-- �ǽ�[19]
-- ��ü ��� �� ALLEN�� ���� ��å�� ������� �������, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�

SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.JOB_ID IN (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN'); 

-- ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� ��� ����, �μ� ����, �޿� ��� ������ ����ϴ� SQL���� �ۼ��Ͻ�
-- (��, ����� �� �޿��� ���� ������ �����ϵ� �޿��� ���� ��쿡�� ��� ��ȣ�� �������� ������������ �����ϱ�)

SELECT E.EMPTNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.SAL >
                 (SELECT AVG(SAL) FROM EMP) 
ORDER BY E.SAL DESC, E.EMPNO ASC;

-- ���� �� �������� : ���������� SELECT ���� ���� �÷��� ������ ������ ���
SELECT * FROM EMP WHERE (DEPTNO, SAL) IN
            (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- FROM ���� ����ϴ� ��������(�ζ��� ��)
SELECT E,EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM WHERE DEPTNO=10) E, (SELECT * FROM DEPT) D
WHERE E.DEPTNO = D.DEPTNO;

-- SELECT ���� ����ϴ� �������� - ��Į�� ��������

-- �ǽ�[23]
-- 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ����
-- ������� �������, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO E.JOB NOT EXISTS (SELECT DISTINCT JOB FROM EMP WHERE DEPTNO=30)
AND E.DEPTNO=10;

-- ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ���ʵ��� �������,
-- �޿� ��� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�(��, ���������� Ȱ���� �� ������ �Լ���
-- ����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�
SELECT EMPNO, ENAME, SAL, (SELECT GRADE FROM SALGRADE WHERE E.SAL DETWEEN LOSAL AND HISAL) AS GRADE
FROM EMP
WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN');

SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.SAL > ALL 
(SELECT SAL FROM EMP WHERE JOB='SALESMAN');

-- ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� ��� ����, �μ� ����, �޿� ��� ������ ����ϴ� SQL���� �ۼ��Ͻ�
-- (��, ����� �� �޿��� ���� ������ �����ϵ� �޿��� ���� ��쿡�� ��� ��ȣ�� �������� ������������ �����ϱ�)

--�̰� ������.
SELECT E.EMPTNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.SAL >
                 (SELECT AVG(SAL) FROM EMP) 
ORDER BY E.SAL DESC, E.EMPNO ASC;










