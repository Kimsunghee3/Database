CREATE TABLE sample_product
            (   product_id         number,
                product_name    varchar2(30),
                manu_date         date
            );

INSERT INTO sample_product VALUES ( 1, 'television', to_date( '140101', 'YYMMDD'));
INSERT INTO sample_product VALUES ( 2, 'washer', to_date( '150101', 'YYMMDD'));
INSERT INTO sample_product VALUES ( 3, 'cleaner', to_date( '160101', 'YYMMDD'));
commit;

SELECT * FROM sample_product;

ALTER TABLE sample_product
          ADD ( factory varchar2(10));

SELECT * FROM sample_product;

ALTER TABLE sample_product MODIFY ( factory char(10));
SELECT * FROM sample_product;

ALTER TABLE sample_product RENAME COLUMN factory to factory_name;
SELECT * FROM sample_product;

ALTER TABLE sample_product DROP COLUMN factory_name;
SELECT * FROM sample_product;

TRUNCATE TABLE sample_product;
SELECT * FROM sample_product;

DROP TABLE sample_product;
SELECT * 
FROM sample_product;

