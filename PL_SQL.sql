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

-- 예외(오류)
-- 컴파일 오류 / 런타임 오류
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
        WHERE DEPTNO = 10;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외처리 - 수치 또는 값 오류 발생');
END;
/

-- 예외종류(Internal exception(내부예외) / user-defined exception(사용자정의예외))

DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
        WHERE DEPTNO = 10;
EXCEPTION
    when TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('예외처리 - 요구보다 많은 행 추출 오류 발생');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외처리 - 수치 또는 값 오류 발생');
    when OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외처리 - 사전 정의 외 오류 발생');
END;
/

-- //SQL문 예외 처리 번호랑 메시지 보기
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
        WHERE DEPTNO = 10;
EXCEPTION
    when OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외처리 - 사전 정의 외 오류 발생');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE)); -- SQLCODE(오류번호)
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM); --SQLERRM(오류메시지)
END;
/

-- 실습[30]
-- 명시적 커서를 사용하여 EMP 테이블의 전체 데이터를 조회한 후 커서 안의 데이터가
-- 다음과 같이 출력되도록 PL/SQL 문 작성하기

-- for

DECLARE
    -- 커서 테이터가 입력될 변수 선언
    V_EMP_ROW EMP%ROWTYPE;
     -- 명시적 커서 선언
    CURSOR C1 IS
        SELECT * FROM EMP;
BEGIN
    --커서 열기
    OPEN C1;
    LOOP 
        -- 커서로부터 읽어온 데이터 사용(fetch)
        FETCH C1 INTO V_EMP_ROW;
        -- 커서의 모든 행을 읽어오기 위한 속성 지정
        EXIT WHEN C1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('EMPTNO : ' || V_EMP_ROW.EMPNO
        || ' NAME : ' || V_EMP_ROW.eNAME || ' JOB : ' || V_EMP_ROW.JOB ||
        ' SAL : ' || V_EMP_ROW.SAL || ' COMM : ' || V_EMP_ROW.COMM ||
        ' MGR : ' || V_EMP_ROW.MGR || ' HIREDATE : ' || V_EMP_ROW.HIREDATE ||
        ' DEPTNO : ' || V_EMP_ROW.DEPTNO );
    END LOOP;  
    -- 커서 닫기
    CLOSE C1;
END;
/



-- LOOP 사용한 방식 // .eNAME 그냥 네임
DECLARE
     -- 명시적 커서 선언
    CURSOR C1 IS
        SELECT * FROM EMP;
BEGIN
    for c1_rec in c1 LOOP 
        -- 커서의 모든 행을 읽어오기 위한 속성 지정
        EXIT WHEN C1%NOTFOUND;
    
        DBMS_OUTPUT.PUT_LINE('EMPTNO : ' ||  c1_rec.EMPNO
        || ' NAME : ' || c1_rec.eNAME || ' JOB : ' || c1_rec.JOB ||
        ' SAL : ' || c1_rec.SAL || ' COMM : ' || c1_rec.COMM ||
        ' MGR : ' || c1_rec.MGR || ' HIREDATE : ' || c1_rec.HIREDATE ||
        ' DEPTNO : ' || c1_rec.DEPTNO );
    END LOOP;  
    -- 커서 닫기
    CLOSE C1;
END;
/

-- for

DECLARE
    -- 커서 테이터가 입력될 변수 선언
    V_EMP_ROW EMP%ROWTYPE;
     -- 명시적 커서 선언
    CURSOR C1 IS
        SELECT * FROM EMP;
BEGIN
    --커서 열기
    OPEN C1;
    LOOP 
        -- 커서로부터 읽어온 데이터 사용(fetch)
        FETCH C1 INTO V_EMP_ROW;
        -- 커서의 모든 행을 읽어오기 위한 속성 지정
        EXIT WHEN C1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('EMPTNO : ' || V_EMP_ROW.EMPNO
        || ' NAME : ' || V_EMP_ROW.eNAME || ' JOB : ' || V_EMP_ROW.JOB ||
        ' SAL : ' || V_EMP_ROW.SAL || ' COMM : ' || V_EMP_ROW.COMM ||
        ' MGR : ' || V_EMP_ROW.MGR || ' HIREDATE : ' || V_EMP_ROW.HIREDATE ||
        ' DEPTNO : ' || V_EMP_ROW.DEPTNO );
    END LOOP;  
    -- 커서 닫기
    CLOSE C1;
END;
/

-- 익명 블록 : 이름 없음, 저장할 수 없음, 실행할 대마다 컴파일, 공유 안됨,
--            다른 응용프로그램에서 호출 안됨

-- 저장 서브 프로그램 : 이름 지정, 저장 가능, 저장할 때 한 번 컴파일, 공유가능
--                    호출가능

-- 프로시저 생성
CREATE OR REPLACE PROCEDURE PRO_NOPARAM
IS
    V_EMPNO NUMBER(4) := 77;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

EXECUTE PRO_NOPARAM;

-- PL/SQL 블록에서 프로시저 실행
BEGIN
    PRO_NOPARAM;
END;
/

-- 프로시저 삭제하기
DROP PROCEDURE PRO_NOPARAM;

-- 프로시저에 파라미터 지정 : IN, OUT, IN OUT

-- IN 파라미터(기본)
CREATE OR REPLACE PROCEDURE PRO_NOPARAM_IN
(
    PARAM1 IN NUMBER,
    PARAM2 NUMBER,
    PARAM3 NUMBER :=3,
    PARAM4 NUMBER DEFAULT 2
)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('PARAM1 : ' || PARAM1);
    DBMS_OUTPUT.PUT_LINE('PARAM2 : ' || PARAM2);
    DBMS_OUTPUT.PUT_LINE('PARAM3 : ' || PARAM3);
    DBMS_OUTPUT.PUT_LINE('PARAM4 : ' || PARAM4);
END;
/

EXECUTE PRO_NOPARAM_IN(1,2,7,8);

EXECUTE PRO_NOPARAM_IN(1,2);

EXECUTE PRO_NOPARAM_IN(1);


-- OUT 모드 파라미터(프로시저 실행 후 호출한 프로그램으로 값 반환)
CREATE  OR REPLACE PROCEDURE PRO_PARAM_OUT
(
    IN_EMPNO IN EMP.EMPNO%TYPE,
    OUT_ENAME OUT EMP.ENAME%TYPE,
    OUT_SAL OUT EMP.SAL%TYPE

)
IS
BEGIN
    SELECT ENAME, SAL INTO OUT_ENAME, OUT_SAL
    FROM EMP
    WHERE EMPNO = IN_EMPNO;
END;
/

-- 다른 PL/SQL 블록에서 프로시저 사용
DECLARE
    V_ENAME EMP.ENAME%TYPE;
    V_SAL EMP.SAL%TYPE;
BEGIN
    PRO_PARAM_OUT(7788, V_ENAME, V_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : ' ||V_SAL);
END;
/

-- IN OUT : IN, OUT 기능을 동시에 수행
CREATE OR REPLACE PROCEDURE PRO_PAPAM_INOUT
(
    INOUT_NO IN OUT NUMBER
)
IS
BEGIN
    INOUT_NO := INOUT_NO * 2;
END;
/

-- IN OUT 사용  // DBMS를 또 DEMS라고 함... BBBB!!!!!
DECLARE
    NO NUMBER;
BEGIN
    NO := 5;
    PRO_PAPAM_INOUT(NO);
    DBMS_OUTPUT.PUT_LINE('NO : ' || NO);
END;
/

-- JAVADB에서 실행 // 연결을 SCOTT에서 JAVADB로 바꾸고 //mobile NVARCHAR2에 ; 콜론 찍음
CREATE OR REPLACE PROCEDURE REGISTER_USER
(
    name NVARCHAR2,
    year NUMBER,
    addr NCHAR,
    mobile NVARCHAR2
)
IS
BEGIN
    INSERT INTO userTBL(no, username, birthyear, addr, mobile)
    VALUES(USERTBL_SEQ.nextval, name, year, addr, mobile);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(name || year || addr || mobile);
END;
/

EXECUTE REGISTER_USER('대조영', '1996', '부산', '010-4569-4568');

SELECT * FROM USERTBL;

-- 실습 1번
CREATE OR REPLACE PROCEDURE PRO_DEPT_IN
(
    INOUT_DEPTNO IN OUT DEPT.DEPTNO%TYPE,
    OUT_DNAME OUT DEPT.DNAME%TYPE,
    OUT_LOC OUT DEPT.LOC%TYPE
)
IS
BEGIN
    SELECT DEPTNO, DNAME, LOC  INTO INOUT_DEPTNO, OUT_DNAME, OUT_LOC
    FROM DEPT
    WHERE DEPTNO = INOUT_DEPTNO;
END;
/

-- 실습 2 - 출력하기
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE;
    V_DNAME DEPT.DNAME%TYPE;
    V_LOC DEPT.LOC%TYPE;
BEGIN
    V_DEPTNO := 10;
    PRO_DEPT_IN(V_DEPTNO, V_DNAME,V_LOC);
    DBMS_OUTPUT.PUT_LINE('부서번호 : ' || V_DEPTNO);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || V_DNAME);
    DBMS_OUTPUT.PUT_LINE('지역 : ' || V_LOC);
END;
/

-- 트리거 : 데이터베이스 안의 특정 상황이나 동작, 즉 이벤트가 발생할 때 자동으로
-- 실해시키는 기능

-- BEFORE 트리거
-- 트리거를 적용할 테이블 생성
CREATE TABLE EMP_TRG AS SELECT * FROM EMP;

-- EMP_TRG에 DML구문(사용시 주말이라면 사원정보 수정 불가) 사용시 트리거 발생
-- RAISE_APPLICATION_ERROR : 사용자 정의 예외
-- 예외지정코드는 -20000 ~ 20999 범위의 숫자를 사용 ///NODML_WEEKEND 에서  ML_WEEKEND 빼먹어서 안됐었는데 지금은 됨. 
CREATE OR REPLACE TRIGGER TRG_EMP_NODML_WEEKEND
BEFORE
-- 트리거 작동
INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') IN ('토','일') THEN
        IF INSERTING THEN
            raise_application_error(-20000, '주말 사원정보 추가 불가');
        ELSIF UPDATING THEN
             RAISE_APPLICATION_ERROR(-20001, '주말 사원정보 수정 불가');
        ELSIF deleting THEN
            RAISE_APPLICATION_ERROR(-20002, '주말 사원정보 삭제 불가');
        ELSE
            RAISE_APPLICATION_ERROR(-20003, '주말 사원정보 변경 불가');
        END IF;
    END IF;
END;
/

SELECT * FROM EMP_TRG;

UPDATE EMP_TRG
SET SAL = 3500
WHERE EMPNO = 7788;

-- 트리거 : AFTER
-- EMP_TRG 테이블에 DML 명령어가 실행될 경우 테이블에 수행된 DML 명령어의
-- 종류, DML 을 실행시킨 사용자, DML 명령어가 수행된 날짜와 시간 저장
CREATE TABLE EMP_TRG_LOG(
    TABLENAME VARCHAR2(10),
    DML_TYPE VARCHAR2(10),
    EMPNO NUMBER(4),
    USER_NAME VARCHAR2(30),
    CHANGE_DATE DATE);

--
CREATE OR REPLACE TRIGGER TRG_EMP_LOG
AFTER
INSERT OR DELETE OR UPDATE ON EMP_TRG
FOR EACH ROW -- DML 문장에 의해 영향받는 행별로 실행

BEGIN
    IF INSERTING THEN
        INSERT INTO EMP_TRG_LOG
        VALUES('EMP_TRG', 'INSERT', :NEW.EMPNO, SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE);
    ELSIF UPDATING THEN
         INSERT INTO EMP_TRG_LOG
         VALUES('EMP_TRG', 'UPDATE', :OLD.EMPNO,
         SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE); -- 현재 데이터베이스 접속자
     ELSIF DELETING THEN
         INSERT INTO EMP_TRG_LOG
         VALUES('EMP_TRG', 'DELETE', :OLD.EMPNO, SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE);
    END IF;
END;
/

INSERT INTO EMP_TRG VALUES(9990, 'TESTemp', 'CLERK', 7788, TO_DATE('2018-03-03', 'YYYY-MM-DD'), 1200, NULL,20);

SELECT * FROM EMP_TRG;
SELECT * FROM EMP_TRG_LOG;

UPDATE EMP_TRG
SET SAL = 1300
WHERE MGR = 7788;

-- 트리거 조회
SELECT *
FROM USER_TRIGGERS;

-- 트리거 삭제
DROP TRIGGER TRG_EMP_LOG; -- 이름 바꿔

-- 트리거 변경(활성화 혹은 비호라성화) ENABLE OR DISABLE
ALTER TRIGGER TRG_EMP_NODML_WEEKEND DISABLE;
ALTER TRIGGER TRG_EMP_NODML_WEEKEND ENABLE;
ALTER TRIGGER TRG_EMP_LOG DISABLE;
ALTER TRIGGER TRG_EMP_LOG ENABLE;








