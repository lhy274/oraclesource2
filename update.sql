CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;

-- dept_temp2에 있는 loc 모두 수정
UPDATE dept_temp2  -- 테이블명
SET LOC='SEOUL';    -- 수정할 내용

ROLLBACK;

SELECT * FROM DEPT_TEMP2;

UPDATE dept_temp2  -- 테이블명
SET LOC='SEOUL'    -- 수정할 내용
WHERE DEPTNO=10;   --업데이트 조건

-- EMP_TEMP 테이블의 사원들 중에서 급여가 3000 이하인 사원만 추가수당을 
-- 50으로 수정
SELECT * FROM EMP_TEMP;

UPDATE EMP_TEMP
SET COMM = 50
WHERE SAL <=3000;

SELECT * FROM EMP_TEMP;

-- 서브쿼리를 이용한 데이터 수정

-- 40번 부서의 부서명과 지역을 수정
UPDATE DEPT_TEMP2
SET (DNAME,LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO=30)
WHERE DEPTNO=40;

-- 이거 뭐라 쓸라 했는데 ... DEPTNO
UPDATE DEPT_TEMP2
SET LOC = 'SEOUL'
WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='OPERATIONS');

COMMIT;














































