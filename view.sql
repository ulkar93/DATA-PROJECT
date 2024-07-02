create or replace view calendar_vw as
SELECT a.*,TO_NUMBER (TO_CHAR (calen_date, 'D'))    AS day_of_week,
       CASE
           WHEN TO_NUMBER (TO_CHAR (calen_date, 'D')) IN (6, 7)
           THEN
               'weekend'
           ELSE
               'weekday'
       END                                      AS weekend,
       TO_CHAR (calen_date, 'DY')               day_name,
       TO_CHAR (calen_date, 'Month')            AS full_month_name,
       TO_CHAR (calen_date, 'Mon')              AS short_month_name
  FROM calendar a

create or replace view customers_adw_vw as
SELECT a.*, EXTRACT (YEAR FROM birthdate) AS birthyear,
       EXTRACT (YEAR FROM SYSDATE) - EXTRACT (YEAR FROM birthdate)     AS age,
       CASE
               WHEN totalchildren > 0 THEN 'Yes'
               ELSE 'No'
             END as Parent
  FROM customers_adw a  

create or replace view products_vw as
select a.*, CASE
                    WHEN PRODUCTPRICE > 500 THEN 'High'
                    WHEN PRODUCTPRICE > 100 AND PRODUCTPRICE <= 500 THEN 'Mid-Range'
                    ELSE 'Low'
                  END as priority
                  from products a