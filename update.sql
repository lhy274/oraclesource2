CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;

-- dept_temp2�� �ִ� loc ��� ����
UPDATE dept_temp2  -- ���̺��
SET LOC='SEOUL';    -- ������ ����

ROLLBACK;

SELECT * FROM DEPT_TEMP2;

UPDATE dept_temp2  -- ���̺��
SET LOC='SEOUL'    -- ������ ����
WHERE DEPTNO=10;   --������Ʈ ����

-- EMP_TEMP ���̺��� ����� �߿��� �޿��� 3000 ������ ����� �߰������� 
-- 50���� ����
SELECT * FROM EMP_TEMP;

UPDATE EMP_TEMP
SET COMM = 50
WHERE SAL <=3000;

SELECT * FROM EMP_TEMP;

-- ���������� �̿��� ������ ����

-- 40�� �μ��� �μ���� ������ ����
UPDATE DEPT_TEMP2
SET (DNAME,LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO=30)
WHERE DEPTNO=40;

-- �̰� ���� ���� �ߴµ� ... DEPTNO
UPDATE DEPT_TEMP2
SET LOC = 'SEOUL'
WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='OPERATIONS');

COMMIT;














































