-- UPDATE : ������ �����ϱ�

-- ������Ʈ ���� where ���� �׻� �⺻Ű�� Ȱ���Ѵ�.
CREATE TABLE copy_emp
AS 
SELECT * FROM employees;

UPDATE copy_emp
SET salary = 24100
WHERE employee_id = 100;
COMMIT;

-- �ǵ�ġ �ʰ� �̸��� ����������� ������Ʈ�� (�⺻Ű�� ������Ʈ ���ָ� �ߺ��� ����.)
UPDATE copy_emp
SET salary = 24100
WHERE first_name = 'Steven';
COMMIT;

-- where ���� �Ƚ����� ( ��� phone_number �� 123-456-789 �� ������Ʈ �ȴ�. )
UPDATE copy_emp
SET phone_number = '123-456-789';
ROLLBACK;

--����)  ���ߺ�4, 5 ���� manager_id, location_id �� �ΰ��ε� manager_id�� 100, location_id�� 1800���� �ٲ��.
UPDATE copy_departments
SET manager_id = 100 , location_id = 1800
WHERE department_name = '���ߺ� 4' OR department_name = '���ߺ� 5';


--����) copy_departments ���̺��� department_id 150���� 200���� �μ���ȣ�� manager_id�� 100���� �����϶�.
UPDATE copy_departments
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;


























