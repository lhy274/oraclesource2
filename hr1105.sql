-- HR ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- employees ���̺� ��ü ���� ��ȸ
SELECT * FROM employees;

-- employees ���̺��� first_name, last_name, job_id �� ��ȸ
SELECT first_name, last_name, job_id FROM employees;

-- �����ȣ�� 176�� ����� LAST_NAME�� �μ���ȣ ��ȸ
SELECT last_name, department_id from employees WHERE employee_id=176;

-- ������ 12000 �̻�(>=) �Ǵ� �������� LAST_NAME �� ���� ��ȸ
SELECT last_name,salary FROM employees WHERE salary >= 12000;

-- ������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
SELECT last_name,salary FROM employees WHERE salary < 5000 OR salary > 12000;

-- 20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ���
-- ���� ��ȸ
SELECT LAST_NAME, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY LAST_NAME, department_id;

-- Ŀ�̼��� ���� ��� ������� LAST_NAME,����,Ŀ�̼� ��ȸ�ϱ�. ��, ������ ���� ��
-- Ŀ�̼� �������� ��� ����ϱ�
SELECT LAST_NAME, salary, commission_pct FROM employees WHERE commission_pct>0 ORDER BY salary DESC, commission_pct DESC;

-- ������ 2500,3500,7000�� �ƴϸ�, ������ SA_REP �̳� ST_CLERK �� ����� ��ȸ
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id IN('SA_REP', 'ST_CLERK');

-- 2008/02/20 ~ 2008/05/01 ���̿� ���� ������� LAST_NAME,�����ȣ,������� ��ȸ
-- ��, ������� ������������ �����Ͽ� ���
SELECT last_name, hire_date, employee_id FROM employees WHERE hire_date >= '2008-02-20' AND hire_date <= '2008-05-01' ORDER BY hire_date DESC;

-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� ��������
-- �������� �����Ͽ� ���
SELECT last_name, hire_date FROM employees WHERE hire_date >= '2004-01-01' AND hire_date <= '2004-12-31' ORDER BY hire_date;

--������ 5000���� 12000 ������ �ְ�, 20 OR 50�� �μ��� �ٹ��ϴ� ������� 
--������ ��ȸ�Ͽ� ������������ �����ֱ� (last_name, salary)

SELECT salary FROM employees WHERE salary BETWEEN 5000 AND 12000 ORDER BY last_name, salary;

SELECT last_name,salary
FROM employees
WHERE department_id IN(20, 50) AND salary BETWEEN 5000 AND 12000 ORDER BY salary;

--2004�⵵�� ���� ��� ������� last_name �� ������� ��ȸ�Ͽ� �Ի��� ��������
--�������� �����Ͽ� ���

SELECT last_name, hire_date FROM employees WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31';

SELECT last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY hire_date;

-- ������ 5000-12000 ���� �̿��� ������� last_name, salary ��ȸ

SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

--LIKE ����

--2004�⵵�� ���� ��� ������� last_name �� ������� ��ȸ�Ͽ� �Ի��� ��������
--�������� �����Ͽ� ���

SELECT last_name, hire_date
FROM employees 
WHERE hire_date like '04%' ORDER BY hire_date;

-- last_name�� U�� ���ԵǴ� ������� ��� �� last_name ��ȸ

SELECT employee_id, last_name
FROM employees
WHERE last_name like '%u%';

--last_name �� �׹�° ���ڰ� A�� ������� last_name ��ȸ

SELECT last_name
FROM employees
WHERE last_name like '___a%';

--last_name �� a Ȥ�� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name
--�������� �������� ����

SELECT last_name
FROM employees
WHERE last_name like '%a%' OR last_name like '%e%' ORDER BY last_name;

<<<<<<< HEAD
select * from employees;

=======
>>>>>>> f57d9d0569701f468ac37f8d36c21b3e00578b50
--last_name �� a �� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name
--�������� �������� ����

SELECT last_name
FROM employees
WHERE last_name like '%a%e%' ORDER BY last_name;

-- IS NULL
-- �Ŵ����� ���� ������� LAST_NAME, JOB_ID ��ȸ

SELECT  LAST_NAME, JOB_ID
FROM employees
WHERE MANAGER_ID is null;

-- ST_CLERK�� JOB_ID�� ���� ����� ���� �μ� ID ��ȸ, �μ��� NULL�� �� ����
SELECT * FROM employees;

SELECT distinct department_id
FROM employees
WHERE JOB_ID not in('ST_CLERK') and department_id is not null;

SELECT distinct department_id
FROM employees
WHERE JOB_ID !='ST_CLERK' and department_id is not null;

-- COMMISSION_PCT�� NULL �� �ƴ� ����� �ֿ��� COMMISSION = SALARY * COMMISSION_PCT
-- �� ���Ͽ� EMPLOYEE_ID, FRIST_NAME, JOB_ID �� ���� ��ȸ
--EMPLOYEE_ID, FRIST_NAME, JOB_ID, , SALARY * COMMISSION_PCT//��Ÿ�ֳ�

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY * COMMISSION_PCT as COMMISSION
FROM employees
WHERE COMMISSION_PCT IS NOT NULL;

SELECT * FROM employees;

-- [�ǽ�]���ڿ� �Լ�
-- 1. First_name�� Curtis �� ����� first_name, last_name, email, phone_number,
--    job_id �� ��ȸ�Ѵ�. ��, job_id�� ����� �ҹ��ڷ� ��µǵ��� �Ѵ�.

SELECT first_name, last_name, email, phone_number, job_id
FROM employees
WHERE job_id IN('Curtis');

SELECT first_name, last_name, email, phone_number, LOWER(job_id)
FROM employees
WHERE first_name = 'Curtis';

-- 2. �μ���ȣ�� 70, 80, 90�� ������� employee_id, first_name, hire_date, job_id��
-- ��ȸ�Ѵ�. ��,  job_id�� it_prog�� ����� ��� ���α׷��ӷ� �����Ͽ� ����Ѵ�.

SELECT employee_id, first_name, hire_date, job_id
FROM employees
WHERE DEPARTMENT_ID IN(73, 80, 90);


SELECT employee_id, first_name, hire_date, REPLACE(job_id,'IT_PROG','���α׷���')
FROM employees
WHERE DEPARTMENT_ID IN (60, 70, 80, 90);

-- 3.  job_id�� ad_pres, pu_clerk�� ������� employee_id, first_name, last_name,
-- department_id, job_id�� ��ȸ�Ͻÿ�, ��, ������� first_name�� last_name�� ����
-- �Ͽ� ����Ѵ�.

SELECT employee_idmployee_id, FIRST_NAME || LAST_NAME, department_id, job_id
FROM employees
WHERE job_id IN('ad_pres','pu_clerk');

SELECT employee_idmployee_id, CONCAT(FIRST_NAME,CONCAT(' ', LAST_NAME)), department_id, job_id
FROM employees
WHERE job_id IN('AD_RPES','PU_CLERK');


















