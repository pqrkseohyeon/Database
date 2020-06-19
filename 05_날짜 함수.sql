-- ��¥�� �Լ�
SELECT first_name, hire_date --��¥���� ������ 
FROM employees;

--SYSDATE ���� ��¥�� �ð�
SELECT SYSDATE 
FROM DUAL;

--��¥ + ���� => ��¥
SELECT SYSDATE, SYSDATE+3, SYSDATE-3 --
FROM DUAL;

--��¥ - ��¥ = �� �ϼ�
SELECT employee_id, SYSDATE, hire_date,
    SYSDATE - hire_date, ROUND(SYSDATE-hire_date)
FROM employees;

--�ð����
SELECT SYSDATE + 5/24 --�ð� 1(�Ϸ�)
FROM DUAL;

--months_between : ���� ���
SELECT employee_id, first_name,
   ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)),
    (sysdate - hire_date)/30
FROM employees;

-- add_months: ���� ���� ',' �ڿ� ������ ���ڸ�ŭ ���� �����ش�.
SELECT employee_id, first_name, hire_date,
    ADD_MONTHS(hire_date ,4) --4�� ���ϱ�
FROM employees;

--next_date(��¥, ������ ���� ����)
SELECT sysdate, NEXT_DAY(sysdate, 'ȭ����')
FROM DUAL;

--last_day(��¥) �� ���� ������ ��
SELECT LAST_DAY(SYSDATE)
FROM DUAL;

--��¥�� �ݿø�
SELECT employee_id, hire_date,
    ROUND(hire_date, 'MONTH') ��, --������ �ݿø� 1��
    ROUND(hire_date, 'YEAR') �� -- ������ �ݿø� 1��
FROM employees
WHERE MONTHS_BETWEEN(sysdate, hire_date) < 150;

--����)
SELECT SYSDATE, hire_date, MONTHS_BETWEEN(SYSDATE, hire_date)
FROM employees
WHERE department_id = 100;

--����)
SELECT hire_date,
    ADD_MONTHS(hire_date, 3),
    ADD_MONTHS(hire_date, -3),
employee_id
FROM employees
WHERE employee_id  BETWEEN 100 AND 106 ;











