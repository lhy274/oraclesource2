CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

-- JOB MANAGER�� ������ �����ϱ�
DELETE FROM EMP_TEMP2 WHERE JOB='MANAGER';

ROLLBACK;

DELETE EMP_TEMP2;

-- EMP_TEMP2 ���̺��� ��� �߿��� �޿��� 5000 �̻��� ��� ����
DELETE FROM EMP_TEMP2 WHERE SAL=5000;

COMMIT;

-- �޿� ����� 3��� ���̿� �ִ� 30�� �μ��� ����鸸 ����
DELETE FROM EMP_TEMP2 WHERE EMPNO IN (SELECT E.EMPNO
                                    FROM EMP_TEMP2 E, SALGRADE S
                                    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                                    AND S.GRADE=3 AND DEPTNO=30);

-- DELETE FROM EMP_TEMP2 WHERE EMPNO IN (7001,7002,7003);



-- �ǽ�[31]
�ǽ��� ���Ͽ� ���� ���̺��� �̿��Ͽ� ���̺��� �����Ѵ�.

CREATE TABLE EXAM_EMP AS SELECT * FROM EMP; -- ������
CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT; --�̰ɷ� �������.

CREATE TABLE EXAM_EMP AS SELECT * FROM EMP WHERE 1<>1; -- �̰ɷ� ���̺� �������.
SELECT * FROM EXAM_EMP;

-- �ǽ�2
INSERT INTO EXAM_EMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500,NULL,50);
INSERT INTO EXAM_EMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,NULL,50);
INSERT INTO EXAM_EMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400,NULL,60);
INSERT INTO EXAM_EMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(7204,'TEST_USER4','SALESMAN',7201,'2016-05-31',2700,300,60);
INSERT INTO EXAM_EMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(7205,'TEST_USER5','CLERK',7201,'2016-07-20',2600,NULL,70);
INSERT INTO EXAM_EMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600,NULL,70);
INSERT INTO EXAM_EMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300,NULL,80);
INSERT INTO EXAM_EMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(7208,'TEST_USER8','STUDENT',7201,'2018-03-09',1200,NULL,80);

COMMIT;

SELECT * FROM EXAM_EMP;

-- �ǽ�3
UPDATE EXAM_EMP
SET DEPTNO=70 
WHERE SAL > (SELECT AVG(SAL) FROM EXAM_EMP WHERE DEPTNO=50);
 

-- �ǽ�4 SAL
UPDATE EXAM_EMP
SET SAL = SAL*1.1, DEPTNO = 80
WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM EXAM_EMP WHERE DEPTNO=60);

-- �ǽ�5 SALGRADE
DELETE FROM EXAM_EMP WHERE EMPNO IN
                                (SELECT EMPNO
                                FROM EXAM_EMP, SALGRADE
                                WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=5);










































































