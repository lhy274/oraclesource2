-- ������ ���� : �����ͺ��̽� �޸�, ����, �����, ����, ��ü�� ���� ����Ŭ
-- ��� �ʿ��� �߿��� �����Ͱ� ������ ���

-- SCOTT �������� ��� ������ ������ ����
SELECT * FROM DICT;

SELECT * FROM USER_TABLES;

SELECT * FROM ALL_TABLES;

-- �� : ���� ���̺�

CREATE VIEW VM_EMP20 AS (SELECT EMPNO, ENAME, JOB, DEPTNO
                         FROM EMP
                         WHERE DEPTNO=20);

SELECT * FROM VM_EMP20;

-- �� Ȯ��
SELECT * FROM USER_VIEWS;

CREATE VIEW VM_EMP30ALL AS SELECT * FROM EMP;

-- ������ �並 ���ؼ� INSERT �۾�
INSERT INTO VM_EMP30ALL VALUES(7777, 'KIM','JUNKI',NULL,'20/10/19',2650,NULL,20);

SELECT * FROM VM_EMP30ALL;
SELECT * FROM EMP;

-- ��� SELECT�� �����ϵ��� ����
CREATE VIEW VM_EMP_READ AS
    SELECT EMPNO, ENAME, JOB FROM EMP WITH READ ONLY;


-- ������ �信 ������ �����Ѱ�?
SELECT * FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME='VM_EMP30ALL';

SELECT * FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME='VM_EMP_READ';

-- �並 ����ϴ� ����
-- ����(���� ���̺��� ������ �ִ� �ΰ��� ���� ����)
SELECT * FROM EMP; -- SAL, COMM
-- ��������, ���ΰ� ���� ������ ���� ����� �����ؼ� ���

-- �ε��� - �����̱� ������ SELECT ���� ȿ���� ����

-- SCOTT ������ ������ �ε��� ���� ����
SELECT * FROM USER_INDEXES;

-- �⺻Ű ���� => �ڵ� �ε����� ��

-- �ε��� ����(EMP ���̺��� SAL ���� �ε��� ����)
CREATE INDEX IDX_EMP_SQL ON EMP(SAL);

SELECT * FROM EMP WHERE SAL=1250;

--
CREATE TABLE USERTBL(
    USERID CHAR(8) NOT NULL PRIMARY KEY,
    USERNAME NVARCHAR2(10) NOT NULL,
    BIRTHYEAR NUMBER(4) NOT NULL,
    MOBILE CHAR(3));

SELECT INDEX_NAME, UNIQUENESS, INDEXE_TYPE FROM USER_INDEXES;
SELECT * FROM USER_INDEXES;

-- ������ : Ư�� ��Ģ�� �´� ���� ���� ����
--       : �Խñ� ��ȣ, ��ǰ ��ȣ, �ֹ���ȣ....

CREATE SEQUENCE DEPT_SEQ
INCREMENT BY 10 -- 10�� ����
START WITH 10 -- ó�� ���� ����
MAXVALUE 90   -- ������ ����
MINVALUE 0    -- START ������ �۰� ����
NOCYCLE CACHE 2; -- �ݺ����� ����, �̸� ������ ������ ����

CREATE TABLE DEPT_SEQ_TBL AS SELECT * FROM DEPT WHERE 1<>1;

-- �������� �̿��ؼ� ����
SELECT * FROM DEPT_SEQ_TBL;
INSERT INTO DEPT_SEQ_TBL VALUES(DEPT_SEQ.NEXTVAL, 'DATABASE','SEOUL');

-- ������ ����
ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE;

-- ������ ����� ������ Ȯ���ϱ�
SELECT DEPT_SEQ.CURRVAL FROM DUAL;

-- SYNOMYM(���Ǿ�) : ���� ��Ī
-- ���̺�, ��, ������ �� ��ü�鿡�� ��� ����� �� �ִ� �̸� �ο�

CREATE SYNONYM E FOR EMP;

SELECT * FROM E;

DROP SYNONYM E;



-- �ǽ�[13] ���⼭����
CREATE TABLE EMPIDX AS SELECT * FROM EMP WHERE 1<>1;

CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(EMPNO);
DROP INDEX IDX_EMPIDX_EMPNO;

SELECT * FROM USER_INDEXES;

CREATE VIEW EMPIDX_OVER15K AS SELECT * FROM EMPIDX WHERE SAL > 1500;


-- �������///

--EMP���̺�� ���� ������ �����͸� �����ϴ��� EMPIDX ���̺��� �����Ͻÿ�
CREATE TABLE EMPIDX AS SELECT * FROM EMP;

-- ������ EMPIDX ���̺��� EMPNO ���� IDX_EMPIDX_EMPNO �ε����� �����Ͻÿ�.
CREATE INDEX IDX_EMPIDX_EMPNO ON EMP(EMPNO);

--�ε����� �� �����Ǿ����� ������ ���� �並 ���� Ȯ���Ͻÿ�
SELECT * FROM DICT;
SELECT * FROM USER_INDEXES;

-- �ǽ�[2] �ǽ� 1���� ������ EMPIDX ���̺��� ������ �� �޿��� 1500�ʰ��� ����鸸
-- ����ϴ� EMPIDX_OVER15K�並 �����Ͻÿ�(�����ȣ,����̸�,��å,�μ���ȣ,�޿�,�߰����� ���� ������ �ִ�)
SELECT * FROM USER_VIEWS;

--CREATE VIEW EMPIDX_OVER15K AS SELECT * FROM EMPIDX;
CREATE VIEW EMPIDX_OVER15K AS
    SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, COMM FROM EMPIDX WHERE SAL > 1500;





-- �ǽ�[3] ���⼭���� ///
CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;

CREATE SEQUENCE DEPTSEQ_SEQ
INCREMENT BY 1 -- 10�� ����
START WITH 1 -- ó�� ���� ����
MAXVALUE 99   -- ������ ����
MINVALUE 1    -- START ������ �۰� ����
NOCYCLE NOCACHE; -- �ݺ����� ����, �̸� ������ ������ ����

--CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT WHERE 1<>1;

SELECT * FROM USER_SEQUENCE;
SELECT * FROM USER_SEQUENCES;

INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.NEXTVAL, 'DATABASE','SEOUL');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.NEXTVAL, 'WEB','BUSAN');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.NEXTVAL, 'MOBILE','ILSAN');

SELECT * FROM DEPTSEQ;

-- ������� /// 
-- �ǽ�[4]
SELECT * FROM DEPTSEQ;
--INSERT INTO DEPTSEQ VALUES(DEPTSEQ.NEXTVAL, 'DATABASE','SEOUL');
INSERT INTO DEPTSEQ(DATABASE,WEB,MOBILE)
VALUES('SEOUL','BUSAN','ILSAN');


�Ѥ� �������� �׽�Ʈ













