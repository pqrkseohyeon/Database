-- ������ �Լ��� ��ҹ��� �Լ��� ���� �����Լ��� ������.

-- 1. ��ҹ��� ���� �Լ�(upper, lower, initcap)
SELECT 1+1
FROM DUAL; -- ������̺��� ������ ���̺�

--LOWER(�ҹ���), UPPER(�빮��), INITCAP(ù ���ڸ� �빮��)
SELECT LOWER('SQL COURSE'), UPPER('SQL COURSE'),
        INITCAP('SQL SOURSE')
FROM DUAL;

-- �����Լ��� where ���� ���
SELECT employee_id, first_name
FROM employees
WHERE UPPER(first_name) = 'PATRICK'; --UPPER �빮�ڷ� �� �ٲ� ������ ���Ͽ� �˻�, UPPER�� �Ⱥ��̸� �˻��� �ȵȴ�.

-- 2. ���� ���� �Լ���
-- CONCAT
SELECT first_name , last_name, 
        CONCAT(first_name, last_name)Ǯ����
FROM employees;

--SUBSTR (���̸�, m, n) m �� ���۹���, n �� �߶� ����(n�� �������� ���� ������)
SELECT employee_id, 
first_name,
SUBSTR(first_name, 1, 3), --ù��° ���ں��� ���� 3���� �߶󳽴� , ���� ������ġ, �ڿ��� �߶� ����
SUBSTR(first_name, 2, 4), -- �ι�° ���ں��� 4���� �߶󳽴�.
SUBSTR(first_name, 2), -- ���ۺ��� ������
SUBSTR(first_name, -3) -- ������ ��  ���������� ī��Ʈ ���������� 3���ڸ� �߶󳽴�.
FROM employees;

--length : ���ڿ��� ����
SELECT first_name, LENGTH(first_name) --first_name�� ���ڿ��� ���̸� �˷��ش�.
FROM employees;

-- INSTR (���ڿ�, ���� ����, m, n)
-- m�� �˻� ���� ��ġ
-- n�� ã�� Ƚ��
-- ����Ʈ ���� m, n ���� 1
SELECT first_name, 
INSTR(first_name, 'e', 2), --'e'�� �ڸ����� �˷��ش�.
INSTR(first_name, 'e', 5), --5��° ���� �����ϸ� ���� ���� �ִ� 'e'�� ã�� ������ �ڸ����� 7�̵ȴ�.
INSTR(first_name, 'e', 1, 2) --ù��° 'e' ����  2��° ��ġ�� 'e'�� ã���ش�.
FROM employees
WHERE first_name = 'Nanette';

--lpad / rpad (���ڿ�, �ڸ���, ä�﹮��)
SELECT employee_id, first_name, salary,
    LPAD(salary, 10, '#'), RPAD(salary, 10, '*') --LAPD�� ����, RPAD�� ������
FROM employees;

-- ������ �̿��� ���ڿ��� �и�
SELECT 
'ȫ �浿' ����, 
SUBSTR('ȫ �浿',1,INSTR('ȫ �浿',' ')-1) ��, -- �������� ���ڿ��� ������ ������ ������ �������� -1�� ���ָ� ���� ��µȴ�.
SUBSTR('ȫȫ �浿', INSTR('ȫȫ �浿',' ')+1) �̸� -- �������� ���ڿ��� ������ ������ ������ �������� +1 ���ָ� �̸��� ��µȴ�
FROM DUAL; 

-- ������ �Լ� ����
SELECT last_name, CONCAT('�������� ',job_id) AS ������ 
FROM employees
WHERE SUBSTR(job_id, 4,3) = 'REP';
--job_id�� 4��° ���ں��� REP�� ���

SELECT employee_id,
    CONCAT(first_name, last_name) ��ü�̸�,
    last_name,
    LENGTH(last_name) ����,
    INSTR(last_name, 'a') "'a' �� ���°?"
FROM employees;

--���� ġȯ : REPLACE
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') --�տ��� �˻��� ���ڿ�(ACCOUNT)��, �ڿ��� �ٲ� ���ڿ�(ACCNT)�� ġȯ�Ѵ�.
FROM employees
WHERE job_id LIKE '%ACCOUNT%';

--����) 
SELECT last_name �̸�, 
LOWER(last_name) LOWER����, 
UPPER(last_name) UPPER����,
email �̸���,
INITCAP(email) INITCAT����
FROM employees;

--����)
SELECT job_id ������,
SUBSTR(job_id, 1, 2) ����2��
FROM employees;







