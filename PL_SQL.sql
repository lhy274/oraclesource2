-- ���� ����� ȭ�鿡 ���
SET SERVEROUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
END;
/

-- ���� // �ȵ���.
DECLARE
    -- ���� ���� : ������ Ÿ��;
    --            ������ Ÿ�� := ��;
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT.LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT.LINE('V_ENAME : ' || V_ENAME);
END;
/

-- �� // PUT.LINE _�̰� �ƴ϶� . �� ��������
DECLARE 
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/




-- ���
DECLARE
    V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/

-- ������ �⺻�� ���� // ���� ��  DEMS_ �̷��� �Ἥ ������ //��
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- ������ NULL �� ���� ���� // ���� DBME_OU �̷��� �Ἥ ������ // ��
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO ; ' || V_DEPTNO);
END;
/

-- DEFALUT + NOT NULL // ���� DEMS_  // ��
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO ; ' || V_DEPTNO);
END;
/


-- �ڷ���
-- ��Į���� : ����Ŭ �����ͺ��̽����� ����ϴ� �ڷ��� + Boolean
-- ������ : �ٸ� ���̺��� �÷� �ڷ����̳�, �ϳ��� �� ������ ����

-- Ư�� ���̺��� �÷� �ڷ��� ���� // ���� DEMS_  // ��
DECLARE
    -- DEPT ���̺��� DEPTNO�� ���� �ڷ��� ��� 
    V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- DEPT ���̺��� ������ ���� �ڷ��� ��� // ���� DEMS_ // ��
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;
/

-- ���ǹ� // �̰� �ƴ�
DECLARE
    V_NUMBER NUMBER := 13;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('V_NUMBER Ȧ��');
    END IF;
END;
/

-- IF ~ ELSE // �̰͵� ��
DECLARE
    V_NUMBER NUMBER := 14;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
     DBMS_OUTPUT.PUT_LINE('V_NUMBER Ȧ��');
    ELSE
     DBMS_OUTPUT.PUT_LINE('V_NUMBER ¦��');
    END IF;
END;
/

-- IF ~ ELSIF ~ ELSE

DECLARE 
    V_SCORE NUMBER := 87;
BEGIN
    IF V_SCORE >=90 THEN
        DBMS_OUTPUT.PUT_LINE('A');
    ELSIF V_SCORE >=80 THEN
        DBMS_OUTPUT.PUT_LINE('B');
    ELSIF V_SCORE >=70 THEN
        DBMS_OUTPUT.PUT_LINE('C');
    ELSIF V_SCORE >=60 THEN
        DBMS_OUTPUT.PUT_LINE('D');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F');
    END IF;
END;
/


-- CASE // ������� ��
DECLARE 
    V_SCORE NUMBER := 87;
BEGIN
    CASE TRUNC(V_SCORE/10)
    WHEN 10 THEN
        DBMS_OUTPUT.PUT_LINE('A');
    WHEN 9 THEN
        DBMS_OUTPUT.PUT_LINE('B');
    WHEN 8 THEN
        DBMS_OUTPUT.PUT_LINE('C');
    WHEN 7 THEN
        DBMS_OUTPUT.PUT_LINE('D');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F');
    END CASE;
END;
/

-- �ݺ���

-- LOOP : �⺻ �ݺ���
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM+1;
        EXIT WHEN V_NUM > 4; -- �ݺ��� ����
    END LOOP;
END;
/

DECLARE
    V_NUM NUMBER :=0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM+1;
        IF V_NUM > 4 THEN
            EXIT; -- �ݺ��� ����
         END IF;
      END LOOP;
END;
/

-- WHILE  // �̰Ŵ� 0���� 3���� ������
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM+1;
    END LOOP;
END;
/


-- FOR // ��
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || i); -- i�ڸ��� V_NUM ������ 0 ����
    END LOOP;
END;
/

-- FOR REVERSE
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR i IN REVERSE 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || i);
    END LOOP;
END;
/

-- CONTINUE // ��
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 1;
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || i);
    END LOOP;
END;
/

-- [�ǽ�] 1~10 ���� ����ϱ� // �ǽ� �ٵ�
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || i);
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
END;
/
-- [�ǽ�] 1~10 ���� Ȧ���� ���
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR i IN 0..10 LOOP
        CONTINUE WHEN MOD(i, 2) = 2;
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || i);
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..10 LOOP
        IF i MOD 2 = 1 THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
END;
/

-- [�ǽ�]
-- DEPT ���̺��� DEPTNO �� �ڷ����� ���� ���� V_DEPTNO �� �����մϴ�.
-- �׸��� V_DEPTNO ���� ���� 10,20,30,40�� �������� �� ������ ���� �μ� �̸���
-- ����ϴ� ���α׷��� �ۼ��ϱ�, ��, �μ� ��ȣ�� 10,20,30,40��
-- �ƴϸ� N/A �� ����ϱ�

-- 10 : ACCOUNTING, 20 : RESERCH, 30 : SALES, 40 : OPERATIONS

DECLARE 
    V_DEPTNO DEPT.DEPTNO%TYPE := 20;
BEGIN
    IF V_DEPTNO = 10 THEN
        DBMS_OUTPUT.PUT_LINE('DNAME : ACCOUNTING');
    ELSIF V_DEPTNO = 20 THEN
        DBMS_OUTPUT.PUT_LINE('DNAME : RESERCH'); 
    ELSIF V_DEPTNO = 30 THEN
        DBMS_OUTPUT.PUT_LINE('DNAME : SALES');
    ELSIF V_DEPTNO = 40 THEN
        DBMS_OUTPUT.PUT_LINE('DNAME : OPERATIONS');   
    ELSE 
        DBMS_OUTPUT.PUT_LINE('DNAME : N/A');       
    END IF;
END;
/


-- ���ڵ� : �ڷ����� ���� �ٸ� �����͸� �ϳ��� ������ ����

DECLARE 
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
BEGIN 
    DEPT_REC.DEPTNO := 99;
    DEPT_REC.DNAME := 'database';
    DEPT_REC.LOC := 'seoul';
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_REC.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || DEPT_REC.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_REC.LOC);
END;
/

-- ���ڵ带 ����� INSERT

-- ���̺� ����(dept ���̺� ���� ������ �״�� �������� ���� 1<>1; �Ʒ� ��������22)
CREATE TABLE DEPT_RECORD
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_RECORD;
DROP DETP_RECORD;

DECLARE 
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
BEGIN 
    DEPT_REC.DEPTNO := 99;
    DEPT_REC.DNAME := 'database';
    DEPT_REC.LOC := 'seoul';
    
    INSERT INTO DEPT_RECORD
    VALUES DEPT_REC;
END;
/

SELECT * FROM DEPT_RECORD;

-- ���ڵ带 ����� UPDATE // ������ // SET ROW ���� ROW ���԰�,  DEPTNO���� E���԰�

DECLARE 
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
BEGIN 
    DEPT_REC.DEPTNO := 50;
    DEPT_REC.DNAME := 'jsp';
    DEPT_REC.LOC := 'busan';
    
    UPDATE DEPT_RECORD
    SET ROW = DEPT_REC
    WHERE DEPTNO = 99;
END;
/

-- ���ڵ带 �����ϴ� ���ڵ� // ���� // DEPTNO+DNAME // �������� DINFO.LOC n ������//SELECT D.DEPTNO,  D.DNAME �� E.DEPTNO, E.DNAME�����
-- INTO ���� EMP_REC.DINFO.LOC, DINFO���� N������ // ��
DECLARE 
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
    TYPE REC_EMP IS RECORD(
        EMPNO EMP.EMPNO%TYPE,
        ENAME EMP.ENAME%TYPE,
        DINFO REC_DEPT
    );
    emp_rec REC_EMP;
BEGIN
    SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    INTO EMP_REC.EMPNO, EMP_REC.ENAME, EMP_REC.DINFO.DEPTNO, EMP_REC.DINFO.DNAME, EMP_REC.DINFO.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.EMPNO = 7788;
    DBMS_OUTPUT.PUT_LINE('EMPNO = ' || EMP_REC.EMPNO);
    DBMS_OUTPUT.PUT_LINE('ENAME = ' || EMP_REC.ENAME);
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO = ' || EMP_REC.DINFO.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME = ' || EMP_REC.DINFO.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC = ' || EMP_REC.DINFO.LOC);
END;
/

-- �÷��� : �ڷ����� ���� ���� ������ ����(�迭, List...)
-- �����迭, ��ø���̺�, Varray

-- �����迭 : key, value

DECLARE 
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    
    TEXT_ARR ITAB_EX;
BEGIN 
    TEXT_ARR(1) := '1st date';
    TEXT_ARR(2) := '2st date';
    TEXT_ARR(3) := '3st date';
    TEXT_ARR(4) := '4st date';
    
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(1) : ' || TEXT_ARR(1));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(1) : ' || TEXT_ARR(2));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(1) : ' || TEXT_ARR(3));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(1) : ' || TEXT_ARR(4));
END;
/

-- ���ڵ带 Ȱ���� �����迭  //�Ʊ� ������ ���� ���� ��

DECLARE 
    -- ���ڵ� ����  
    TYPE REC_DEPT IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE,
        DNAME DEPT.DNAME%TYPE
    );
    -- �����迭 ����
    -- int arr[]={}, Account arr[], arr[0].owner, arr[0].balance
    TYPE ITAB_DEPT IS TABLE OF REC_DEPT INDEX BY PLS_INTEGER;
    
    DEPT_ARR ITAB_DEPT;
    IDX PLS_INTEGER := 0;
BEGIN 
    FOR i IN (SELECT DEPTNO, DNAME FROM DEPT) LOOP
        IDX := IDX + 1;
        DEPT_ARR(IDX).DEPTNO := i.DEPTNO;
        DEPT_ARR(IDX).DNAME := i.DNAME;
        
        DBMS_OUTPUT.PUT_LINE(DEPT_ARR(IDX).DEPTNO || ' : ' || DEPT_ARR(IDX).DNAME);
    END LOOP;
END;
/

-- �÷��� �޼��� ����ϱ�
DECLARE 
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    
    TEXT_ARR ITAB_EX;
BEGIN 
    TEXT_ARR(1) := '1st date';
    TEXT_ARR(2) := '2st date';
    TEXT_ARR(3) := '3st date';
    TEXT_ARR(20) := '50st date';
    
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.COUNT : ' || TEXT_ARR.COUNT);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.FIRST : ' || TEXT_ARR.FIRST);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.LAST : ' || TEXT_ARR.LAST);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.PRIOR(50) : ' || TEXT_ARR.PRIOR(50));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.NEXT(50) : ' || TEXT_ARR.NEXT(50));
END;
/

-- �ǽ�[PL/SQL] PPT22
DECLARE
    TYPE EMP_RECORD IS RECORD(
        EMPTNO EMP.EMPTNO%TYPE,
        ENAME EMP.ENAME%TYPE,
        JOB EMP.JOB%TYPE,
        MGR EMP.MGR%TYPE,
        HIREDATE EMP.HIREDATE%TYPE,
        SAL EMP.SAL%TYPE,
        COMM EMP.COMM%TYPE,
        DEPTNO EMP.DEPTNO%TYPE,
    );
    EMP EMP_RECORD;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 40;
    
    EMP.EMPTNO := 6699;
    EMP.ENAME := 'JOHN';
    EMP.JOB := 'SALESMAN';
    EMP.MGR := 7902;
    EMP.HIREDATE := '07/11/05';
    EMP.SAL := 1500;
    EMP.COMM := NULL;
    EMP.DEPTNO := 10;
    
    
    DBMS_OUTPUT.PUT_LINE('EMPTNO : ' || EMP_RECORD.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || EMP_RECORD.DNAME);
    DBMS_OUTPUT.PUT_LINE('JOB : ' || EMP_RECORD.LOC);
    DBMS_OUTPUT.PUT_LINE('MGR : ' || EMP_RECORD.LOC);
    DBMS_OUTPUT.PUT_LINE('HIREDATE : ' || EMP_RECORD.LOC);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || EMP_RECORD.LOC);
    DBMS_OUTPUT.PUT_LINE('COMM : ' || EMP_RECORD.LOC);
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || EMP_RECORD.LOC);
END;
/

SELECT*FROM EMP_RECORD;

-- ��������
-- EMP ���̺�� ���� �� ������ ������ �� ���̺� EMP_RECORD�� �����ϴ� SQL�� �ۼ�

-- ���̺� ����
CREATE TABLE EMP_RECORD
    AS SELECT *
        FROM EMP
        WHERE 1<>1;

-- EMP_RECORD ���̺� ���ڵ带 ����Ͽ� ���ο� ��� ������
-- ������ ���� �����ϴ� PL/SQL �� �ۼ�
--2��°  //  ); Ÿ������ , ���°� + EMPNO�� EMPTNO��� �� //BEGIN ������ EMPNO�� EMPTNO��� ��

DECLARE
    TYPE EMP_RECORD IS RECORD(
        EMPNO EMP.EMPNO%TYPE,
        ENAME EMP.ENAME%TYPE,
        JOB EMP.JOB%TYPE,
        MGR EMP.MGR%TYPE,
        HIREDATE EMP.HIREDATE%TYPE,
        SAL EMP.SAL%TYPE,
        COMM EMP.COMM%TYPE,
        DEPTNO EMP.DEPTNO%TYPE
    );
    EMP_REC EMP_RECORD;
BEGIN
    EMP_REC.EMPNO := 6699;
    EMP_REC.ENAME := 'JOHN';
    EMP_REC.JOB := 'SALESMAN';
    EMP_REC.MGR := 7902;
    EMP_REC.HIREDATE := '07/11/05';
    EMP_REC.SAL := 1500;
    EMP_REC.COMM := NULL;
    EMP_REC.DEPTNO := 10;
    INSERT INTO EMP_RECORD VALUES EMP_REC;
END;
/

SELECT*FROM EMP_RECORD;

--[�ǽ� 23]
-- EMP ���̺��� �����ϴ� ��� ���� ������ �� �ִ� ���ڵ带 Ȱ���Ͽ� ���� �迭��
-- �ۼ��� ����

-- �����迭 // �ַ��� // IDX PLS_INTEGER := 0;���� INS�� ��. // END LOOP�� EMP�����
DECLARE 
    TYPE ITAB_EMP IS TABLE OF EMP%ROWTYPE INDEX BY PLS_INTEGER;
    
    EMP_ARR ITAB_EMP;
    IDX PLS_INTEGER := 0;
BEGIN 
    FOR i IN (SELECT * FROM EMP) LOOP
        IDX := IDX+1;
        EMP_ARR(IDX).EMPNO := i.EMPNO;
        EMP_ARR(IDX).ENAME := i.ENAME;
        EMP_ARR(IDX).JOB := i.JOB;
        EMP_ARR(IDX).MGR := i.MGR;
        EMP_ARR(IDX).HIREDATE := i.HIREDATE;
        EMP_ARR(IDX).SAL := i.SAL;
        EMP_ARR(IDX).COMM := i.COMM;
        EMP_ARR(IDX).DEPTNO := i.DEPTNO;
        DBMS_OUTPUT.PUT_LINE(EMP_ARR(IDX).EMPNO ||':' || EMP_ARR(IDX).ENAME ||':'|| EMP_ARR(IDX).JOB ||':'|| EMP_ARR(IDX).MGR ||':'|| EMP_ARR(IDX).HIREDATE ||':'|| EMP_ARR(IDX).SAL ||':'|| EMP_ARR(IDX).COMM ||':'|| EMP_ARR(IDX).DEPTNO);
    END LOOP;
END;
/

-- Ŀ�� : SQL �� ����� ����� ������ �޸� ����(Private SQL Area)�� ������
-- ���� �� �����͸� �����ϴ� Ŀ��
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
     -- ����� Ŀ�� ����
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = 40;
BEGIN
    --Ŀ�� ����
    OPEN C1;
    
    -- Ŀ���κ��� �о�� ������ ���(fetch)
    FETCH C1 INTO V_DEPT_ROW;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
    
    -- Ŀ�� �ݱ�
    CLOSE C1;
END;
/


-- Ŀ�� ����(Ŀ�� ���� �ݰ� fetch ���ְ�) �� �� ����� �ϳ��� ��쿡�� ����

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 40;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;
/

-- ���� ���� ��ȸ�Ǵ� ��� CURSOR
-- FROM DEPT; ���� �������鼭 40 ���Է� ����鼭 ;�� ������// ��
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
     -- ����� Ŀ�� ����
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
BEGIN
    --Ŀ�� ����
    OPEN C1;
    
    LOOP 
        -- Ŀ���κ��� �о�� ������ ���(fetch)
        FETCH C1 INTO V_DEPT_ROW;
        
        -- Ŀ���� ��� ���� �о���� ���� ����
        EXIT WHEN C1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
    END LOOP;  
    -- Ŀ�� �ݱ�
    CLOSE C1;
END;
/

-- FOT�� ���� -- ���� ���� ��ȸ�Ǵ� ��� CURSOR // ���� FROM�� ; ������ //��
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
     -- ����� Ŀ�� ����
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
BEGIN
    -- Ŀ�� FOR LOOP ����(�ڵ� OPEN, FETCH, CLOSE)
    FOR c1_rec IN C1 LOOP
       
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || c1_rec.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || c1_rec.LOC);
    END LOOP;  
END;
/

-- Ŀ���� �Ķ���� ��� // ����
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
     -- ����� Ŀ�� ����
    CURSOR c1(p_deptno DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = p_deptno;
BEGIN
    --Ŀ�� ����
    OPEN c1(10);
        LOOP
            -- Ŀ���κ��� �о�� ������ ���(fetch)
            FETCH c1 INTO V_DEPT_ROW;
            -- Ŀ���� ��� ���� �о���� ���� ����
            EXIT WHEN c1%NOTFOUND;
            
           -- DBMS_OUTPUT.PUT_LINE('10���μ� DEPTNO : ' || V_DEPT_ROW.DEPTNO || DNAME : ' || V_DEPT_ROW.DNAME || 'LOC : ' || V_DEPT_ROW.LOC);
           -- ���� ���� �ϴϱ� ������. //'DNAME : '���� �տ� ' �� ����.
           DBMS_OUTPUT.PUT_LINE('10���μ� DEPTNO : ' || V_DEPT_ROW.DEPTNO || 'DNAME : ' || V_DEPT_ROW.DNAME || 'LOC : ' || V_DEPT_ROW.LOC);

        END LOOP;  
    -- Ŀ�� �ݱ�
     CLOSE C1;
     OPEN C1(20);
        LOOP 
            -- Ŀ���κ��� �о�� ������ ���(fetch)
            FETCH C1 INTO V_DEPT_ROW;
            -- Ŀ���� ��� ���� �о���� ���� ����
            EXIT WHEN C1%NOTFOUND;
            
            -- DBMS_OUTPUT.PUT_LINE('20���μ� DEPTNO : ' || V_DEPT_ROW.DEPTNO || 'DNAME : ' || V_DEPT_ROW.DNAME || 'LOC : ' || V_DEPT_ROW.LOC);
            DBMS_OUTPUT.PUT_LINE('20���μ� DEPTNO : ' || V_DEPT_ROW.DEPTNO || 'DNAME : ' || V_DEPT_ROW.DNAME || 'LOC : ' || V_DEPT_ROW.LOC);
        END LOOP;  
    -- Ŀ�� �ݱ�
    CLOSE C1;
END;
/

-- FOR�� �ٲ� //where deptno = p_deptno �� ��� ��ü ��� �ƾ���.
DECLARE
    -- ����ڰ� �Է��� �μ���ȣ�� �����ϴ� ����
    V_DEPTNO DEPT.DEPTNO%TYPE;
    
    -- ����� Ŀ�� ����
    CURSOR c1(p_deptno DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT where deptno = p_deptno;
BEGIN
    V_DEPTNO := &INPUT_DEPTNO;
    -- Ŀ�� FOR LOOP ����(�ڵ� OPEN, FETCH, CLOSE)
    FOR c1_rec IN c1(V_DEPTNO) LOOP
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO || 'DNAME : ' || c1_rec.DNAME || 'LOC : ' || c1_rec.LOC);
    END LOOP;  
END;
/

-- ������ Ŀ��(DML ����̳� SELECT INTO ����� �� �ڵ����� ���� �� ó��)
BEGIN
    UPDATE DEPT_TEMP SET DNAME = 'DATABASE'
    WHERE DEPTNO=50;
    
    DBMS_OUTPUT.PUT_LINE('���ŵ� ���� �� : ' || SQL%ROWCOUNT);
    
    IF(SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('���� ��� �� ���� ���� : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('���ŵ� ���� �� : FALSE');
    END IF;
    IF(SQL%ISOPEN) THEN
        DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : FALSE');
    END IF;
END;
/

