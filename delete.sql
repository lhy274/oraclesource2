CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

-- JOB MANAGER인 데이터 삭제하기
DELETE FROM EMP_TEMP2 WHERE JOB='MANAGER';

ROLLBACK;

DELETE EMP_TEMP2;

-- EMP_TEMP2 테이블의 사원 중에서 급여가 5000 이상인 사원 삭제
DELETE FROM EMP_TEMP2 WHERE SAL=5000;

COMMIT;

-- 급여 등급이 3등급 사이에 있는 30번 부서의 사원들만 삭제
DELETE FROM EMP_TEMP2 WHERE EMPNO IN (SELECT E.EMPNO
                                    FROM EMP_TEMP2 E, SALGRADE S
                                    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                                    AND S.GRADE=3 AND DEPTNO=30);

-- DELETE FROM EMP_TEMP2 WHERE EMPNO IN (7001,7002,7003);



-- 실습[31]
실습을 위하여 기존 테이블을 이용하여 테이블을 생성한다.

CREATE TABLE EXAM_EMP AS SELECT * FROM EMP; -- 사용안함
CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT; --이걸로 만들었음.

CREATE TABLE EXAM_EMP AS SELECT * FROM EMP WHERE 1<>1; -- 이걸로 테이블 만들었음.
SELECT * FROM EXAM_EMP;

-- 실습2
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

-- 실습3
UPDATE EXAM_EMP
SET DEPTNO=70 
WHERE SAL > (SELECT AVG(SAL) FROM EXAM_EMP WHERE DEPTNO=50);
 

-- 실습4 SAL
UPDATE EXAM_EMP
SET SAL = SAL*1.1, DEPTNO = 80
WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM EXAM_EMP WHERE DEPTNO=60);

-- 실습5 SALGRADE
DELETE FROM EXAM_EMP WHERE EMPNO IN
                                (SELECT EMPNO
                                FROM EXAM_EMP, SALGRADE
                                WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=5);










































































