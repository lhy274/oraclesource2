-- ȸ������, �Խñ� ���, �Ա�... ���� �ǻ�Ȱ ���õ� ��.

-- ������ DEPT ���̺��� �����ؼ� dept_temp ���̺� ����
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

-- ���� ���̺� ��ȸ
SELECT *
FROM DEPT_TEMP;

-- ������ �߰��ϱ�(��� 1)
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
VALUES(50, 'DATABASE', 'SEOUL');

-- ������ �߰��ϱ�(��� 2)
INSERT INTO DEPT_TEMP VALUES(60, 'NETWORK', 'BUSAN');

-- ���� 
-- INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(50, 'DATABASE');
-- INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(500, 'DATABASE', 'SEOUL');

--NULL �����ϱ� 
-- ��������� NULL ����.
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(70, 'DATABASE', NULL);
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(80, 'DATABASE', ' ');

-- ���������� NULL ����.
INSERT INTO DEPT_TEMP(DEPTNO, LOC) VALUES(90, 'INCHEON');

-- EMP���̺��� �����Ͽ� EMP_TENP ���̺� ����
CREATE TABLE EMT_TEMP AS SELECT * FROM EMP;

-- ���̺� ����
DROP TABLE EMP_TEMP;
DROP TABLE EMT_TEMP; -- �̰ŷ� �߾���.

-- EMP���̺��� �����Ͽ� EMP_TENP ���̺� �����ϵ� ������ �����ϱ�
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;
SELECT * FROM EMP_TEMP;

DESC EMP_TEMP;
INSERT INTO EMP_TEMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(9999,'ȫ�浿','PRESIDENT',NULL,'2020-11-09',4000,NULL,10);
INSERT INTO EMP_TEMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(8888,'������','MANAGER',NULL,'2020-10-08',3000,NULL,10);

-- �����ݿ�
COMMIT;

INSERT INTO EMP_TEMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(7777,'����ȣ','MANAGER',NULL,TO_DATE('07/01/2010', 'DD/MM/YYYY'),4000,NULL,20);

INSERT INTO EMP_TEMP(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(6666,'�̼���','MANAGER',NULL,SYSDATE,3000,NULL,20);

-- EMP ���̺��� SALGRADE ���̺��� �����Ͽ� �޿� ����� 1����� �����ŭ
-- EMP_TEMP ���̺� �߰��ϰ� �ʹٸ�?
-- ���������� �ۼ��ϱ�(�����Ͱ� �߰��Ǵ� ���̺��� �� ������ ���������� �� ������ ��ġ)
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 1;

-- COMMIT;










