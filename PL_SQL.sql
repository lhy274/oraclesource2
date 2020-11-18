-- 실행 결과를 화면에 출력
SET SERVEROUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
END;
/

-- 변수 // 안됐음.
DECLARE
    -- 변수 선언 : 변수명 타입;
    --            변수명 타입 := 값;
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT.LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT.LINE('V_ENAME : ' || V_ENAME);
END;
/

-- 됨 // PUT.LINE _이게 아니라 . 찍어서 오류난거
DECLARE 
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/




-- 상수
DECLARE
    V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/

-- 변수의 기본값 지정 // 오류 뜸  DEMS_ 이렇게 써서 오류남 //됨
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- 변수에 NULL 값 저장 막기 // 오류 DBME_OU 이렇게 써서 오류남 // 됨
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO ; ' || V_DEPTNO);
END;
/

-- DEFALUT + NOT NULL // 오류 DEMS_  // 됨
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO ; ' || V_DEPTNO);
END;
/


-- 자료형
-- 스칼라형 : 오라클 데이터베이스에서 사용하는 자료형 + Boolean
-- 참조형 : 다른 테이블의 컬럼 자료형이나, 하나의 행 구조를 참조

-- 특정 테이블의 컬럼 자료형 참조 // 오류 DEMS_  // 됨
DECLARE
    -- DEPT 테이블의 DEPTNO와 같은 자료형 사용 
    V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- DEPT 테이블의 구조와 같은 자료형 사용 // 오류 DEMS_ // 됨
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

-- 조건문 // 이거 됐다
DECLARE
    V_NUMBER NUMBER := 13;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('V_NUMBER 홀수');
    END IF;
END;
/

-- IF ~ ELSE // 이것도 됨
DECLARE
    V_NUMBER NUMBER := 14;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
     DBMS_OUTPUT.PUT_LINE('V_NUMBER 홀수');
    ELSE
     DBMS_OUTPUT.PUT_LINE('V_NUMBER 짝수');
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


-- CASE // 여기까지 됨
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

-- 반복문

-- LOOP : 기본 반복문
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
        V_NUM := V_NUM+1;
        EXIT WHEN V_NUM > 4; -- 반복문 종료
    END LOOP;
END;
/

DECLARE
    V_NUM NUMBER :=0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
        V_NUM := V_NUM+1;
        IF V_NUM > 4 THEN
            EXIT; -- 반복문 종료
         END IF;
      END LOOP;
END;
/

-- WHILE  // 이거는 0부터 3까지 나오네
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
        V_NUM := V_NUM+1;
    END LOOP;
END;
/


-- FOR // 됨
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || i); -- i자리에 V_NUM 넣으니 0 나옴
    END LOOP;
END;
/

-- FOR REVERSE
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR i IN REVERSE 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || i);
    END LOOP;
END;
/

-- CONTINUE // 됨
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 1;
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || i);
    END LOOP;
END;
/

-- [실습] 1~10 까지 출력하기 // 실습 다됨
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || i);
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
END;
/
-- [실습] 1~10 까지 홀수만 출력
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    FOR i IN 0..10 LOOP
        CONTINUE WHEN MOD(i, 2) = 2;
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || i);
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

-- [실습]
-- DEPT 테이블의 DEPTNO 와 자료형이 같은 변수 V_DEPTNO 를 선언합니다.
-- 그리고 V_DEPTNO 변수 값에 10,20,30,40을 대입했을 때 다음과 같이 부서 이름을
-- 출력하는 프로그램을 작성하기, 단, 부서 번호가 10,20,30,40이
-- 아니면 N/A 로 출력하기

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


-- 레코드 : 자료형이 각기 다른 데이터를 하나의 변수에 저장

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

-- 레코드를 사용한 INSERT

-- 테이블 생성(dept 테이블 복사 구조도 그대로 가져오는 것은 1<>1; 아래 연습문제22)
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

-- 레코드를 사용한 UPDATE // 에러남 // SET ROW 에서 ROW 빼먹고,  DEPTNO에서 E빼먹고

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

-- 레코드를 포함하는 레코드 // 에러 // DEPTNO+DNAME // 마지막줄 DINFO.LOC n 빼먹음//SELECT D.DEPTNO,  D.DNAME 를 E.DEPTNO, E.DNAME라고함
-- INTO 절에 EMP_REC.DINFO.LOC, DINFO에서 N빼먹음 // 됨
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

-- 컬렉션 : 자료형이 같은 여러 데이터 저장(배열, List...)
-- 연관배열, 중첩테이블, Varray

-- 연관배열 : key, value

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

-- 레코드를 활용한 연관배열  //아까 위에서 쓴거 갖다 씀

DECLARE 
    -- 레코드 정의  
    TYPE REC_DEPT IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE,
        DNAME DEPT.DNAME%TYPE
    );
    -- 연관배열 정의
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

-- 컬렉션 메서드 사용하기
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

-- 실습[PL/SQL] PPT22
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

-- 연습문제
-- EMP 테이블과 같은 열 구조를 가지는 빈 테이블 EMP_RECORD를 생성하는 SQL문 작성

-- 테이블 생성
CREATE TABLE EMP_RECORD
    AS SELECT *
        FROM EMP
        WHERE 1<>1;

-- EMP_RECORD 테이블에 레코드를 사용하여 새로운 사원 정보를
-- 다음과 같이 삽입하는 PL/SQL 문 작성
--2번째  //  ); 타입전에 , 빼는거 + EMPNO를 EMPTNO라고 함 //BEGIN 절에도 EMPNO를 EMPTNO라고 함

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

--[실습 23]
-- EMP 테이블을 구성하는 모든 열을 저장할 수 있는 레코드를 활용하여 연관 배열을
-- 작성해 보기

-- 연관배열 // 애러남 // IDX PLS_INTEGER := 0;에서 INS로 함. // END LOOP를 EMP라고함
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

-- 커서 : SQL 문 실행시 결과를 저장한 메모리 공간(Private SQL Area)의 포인터
-- 단일 행 데이터를 저장하는 커서
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
     -- 명시적 커서 선언
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = 40;
BEGIN
    --커서 열기
    OPEN C1;
    
    -- 커서로부터 읽어온 데이터 사용(fetch)
    FETCH C1 INTO V_DEPT_ROW;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
    
    -- 커서 닫기
    CLOSE C1;
END;
/


-- 커서 없이(커서 열고 닫고 fetch 없애고) 한 것 결과가 하나일 경우에만 가능

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

-- 여러 행이 조회되는 경우 CURSOR
-- FROM DEPT; 복사 가져오면서 40 값입력 지우면서 ;도 지워짐// 됨
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
     -- 명시적 커서 선언
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
BEGIN
    --커서 열기
    OPEN C1;
    
    LOOP 
        -- 커서로부터 읽어온 데이터 사용(fetch)
        FETCH C1 INTO V_DEPT_ROW;
        
        -- 커서의 모든 행을 읽어오기 위해 지정
        EXIT WHEN C1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
    END LOOP;  
    -- 커서 닫기
    CLOSE C1;
END;
/

-- FOT문 구조 -- 여러 행이 조회되는 경우 CURSOR // 에러 FROM에 ; 빼먹음 //됨
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
     -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
BEGIN
    -- 커서 FOR LOOP 시작(자동 OPEN, FETCH, CLOSE)
    FOR c1_rec IN C1 LOOP
       
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || c1_rec.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || c1_rec.LOC);
    END LOOP;  
END;
/

-- 커서에 파라미터 사용 // 에러
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
     -- 명시적 커서 선언
    CURSOR c1(p_deptno DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = p_deptno;
BEGIN
    --커서 열기
    OPEN c1(10);
        LOOP
            -- 커서로부터 읽어온 데이터 사용(fetch)
            FETCH c1 INTO V_DEPT_ROW;
            -- 커서의 모든 행을 읽어오기 위해 지정
            EXIT WHEN c1%NOTFOUND;
            
           -- DBMS_OUTPUT.PUT_LINE('10번부서 DEPTNO : ' || V_DEPT_ROW.DEPTNO || DNAME : ' || V_DEPT_ROW.DNAME || 'LOC : ' || V_DEPT_ROW.LOC);
           -- 위에 껄로 하니까 에러남. //'DNAME : '에서 앞에 ' 가 없음.
           DBMS_OUTPUT.PUT_LINE('10번부서 DEPTNO : ' || V_DEPT_ROW.DEPTNO || 'DNAME : ' || V_DEPT_ROW.DNAME || 'LOC : ' || V_DEPT_ROW.LOC);

        END LOOP;  
    -- 커서 닫기
     CLOSE C1;
     OPEN C1(20);
        LOOP 
            -- 커서로부터 읽어온 데이터 사용(fetch)
            FETCH C1 INTO V_DEPT_ROW;
            -- 커서의 모든 행을 읽어오기 위해 지정
            EXIT WHEN C1%NOTFOUND;
            
            -- DBMS_OUTPUT.PUT_LINE('20번부서 DEPTNO : ' || V_DEPT_ROW.DEPTNO || 'DNAME : ' || V_DEPT_ROW.DNAME || 'LOC : ' || V_DEPT_ROW.LOC);
            DBMS_OUTPUT.PUT_LINE('20번부서 DEPTNO : ' || V_DEPT_ROW.DEPTNO || 'DNAME : ' || V_DEPT_ROW.DNAME || 'LOC : ' || V_DEPT_ROW.LOC);
        END LOOP;  
    -- 커서 닫기
    CLOSE C1;
END;
/

-- FOR로 바꿈 //where deptno = p_deptno 이 없어서 전체 출력 됐었음.
DECLARE
    -- 사용자가 입력한 부서번호를 저장하는 변수
    V_DEPTNO DEPT.DEPTNO%TYPE;
    
    -- 명시적 커서 선언
    CURSOR c1(p_deptno DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT where deptno = p_deptno;
BEGIN
    V_DEPTNO := &INPUT_DEPTNO;
    -- 커서 FOR LOOP 시작(자동 OPEN, FETCH, CLOSE)
    FOR c1_rec IN c1(V_DEPTNO) LOOP
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO || 'DNAME : ' || c1_rec.DNAME || 'LOC : ' || c1_rec.LOC);
    END LOOP;  
END;
/

-- 묵시적 커서(DML 명령이나 SELECT INTO 실행될 때 자동으로 생성 및 처리)
BEGIN
    UPDATE DEPT_TEMP SET DNAME = 'DATABASE'
    WHERE DEPTNO=50;
    
    DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 : ' || SQL%ROWCOUNT);
    
    IF(SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 : FALSE');
    END IF;
    IF(SQL%ISOPEN) THEN
        DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : FALSE');
    END IF;
END;
/

