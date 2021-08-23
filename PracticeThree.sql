SELECT *
FROM employees A,
                            (   SELECT department_id
                                FROM   departments
                                WHERE department_name = 'IT' ) B
WHERE A.department_id = B.department_id;

INSERT INTO departments ( department_id, department_name, manager_id, location_id)
VALUES
(271, 'Sample_Dept', 200, 1700);
SELECT * FROM departments;

INSERT   INTO departments
VALUES
(272, 'Sample_Dept', 200, 1700);
commit;

UPDATE departments
SET manager_id = 201,
       location_id = 1800
WHERE department_name = 'Sample_Dept';
SELECT * FROM departments;

UPDATE departments
SET   (manager_id, location_id) = ( SELECT manager_id, location_id  
                                                  FROM   departments
                                                  WHERE department_id = 40)nm
WHERE department_name = 'Sample_Dept';
SELECT * FROM departments;

DELETE FROM departments
WHERE department_name = 'Sample_Dept';

DELETE FROM departments
WHERE department_id IN (SELECT  department_id
                                      FROM     departments
                                      WHERE   department_name = 'Sample_Dept' );
commit;
