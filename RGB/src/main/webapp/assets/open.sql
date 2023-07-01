select * from account where id='junyeo';

select name from users @JI where id = (select id from account @JI where account_no='3338427073808592');

select * from BANK_USERS @YJ;
select * from TRANSACTION_HISTORY@JI;
select * from account@YJ;
select * from TRANSACTION ORDER BY TRANS_NO DESC;

insert into BANK_USERS @YJ(id, password, name, birthdate, phone, email, address)
       values ('nayeon', '1234', '이나연', '1993-03-25', '01084907607', 'qw@erty.uiop', '집');

SELECT replace(PHONE_NO, '-', '') FROM BANK_USER ;

SELECT ID FROM users @JI WHERE NAME='이나연' AND BIRTH='1993-03-25' AND PHONE='01084907607'
UNION ALL
SELECT ID FROM BANK_USERS @YJ WHERE NAME='이나연' AND BIRTHDATE='1993-03-25' AND PHONE='01084907607';

select account_no, id, bank_code, product_id, account_pw, ac_op_date, account_balance, member_name, account_name  
from account @JI where id = (SELECT ID FROM users @JI WHERE NAME='김지은' AND BIRTH='1993-07-21' AND PHONE='01040909045');

select account_no, id, account_code, account_pw, account_date, account_balance, member_name
from account@YJ where id = (SELECT ID FROM bank_users@YJ WHERE NAME='김여준' AND BIRTHdate='1993-01-27' AND PHONE='01072734519' and id='jun');

insert into account vlues(select account_no, id, bank_code, 'Y', account_pw, ac_op_date, account_balance, '1', member_name, account_name  
from account @JI where id = (SELECT ID FROM users @JI WHERE NAME='김지은' AND BIRTH='1993-07-21' AND PHONE='01040909045') and product_id = '5');
insert into account values(select account_no, id, bank_code, 'Z', account_pw, ac_op_date, account_balance, '1', member_name, account_name  
from account @JI where id = (SELECT ID FROM users @JI WHERE NAME='김지은' AND BIRTH='1993-07-21' AND PHONE='01040909045') and product_id != '5');

--지은이 계좌 가져오기
SELECT to_char(account_no), id, bank_code, 
  CASE WHEN product_id = '5' THEN 'Y' ELSE 'Z' END as pd_cd,
  to_char(account_pw), ac_op_date as account_date, account_balance, '1' as status_cd, member_name, account_name
FROM account @JI
WHERE id = (SELECT ID FROM users @JI WHERE NAME='김지은' AND BIRTH='1993-07-21' AND PHONE='01040909045')
union all
--여준이 계좌 가져오기
SELECT account_no, id, to_char(account_code) as bank_code,
  CASE WHEN account_type = 'I' THEN 'Y' ELSE 'Z' END as pd_cd,
  account_pw, account_date, account_balance, '1' as status_cd, member_name, ' ' as account_name
FROM account @YJ
WHERE id = (SELECT ID FROM BANK_USERS @YJ WHERE NAME='이나연' AND BIRTHDATE='1993-03-25' AND PHONE='01084907607') AND account_type != 'L' AND ACCOUNT_CODE = '777';



insert into account values(select account_no, id, account_code, '' account_pw, account_date, account_balance, member_name
from account@YJ where id = (SELECT ID FROM bank_users@YJ WHERE NAME='김여준' AND BIRTHdate='1993-01-27' AND PHONE='01072734519' and id='jun'));

commit;

select * from account;
select * from transaction;

delete from account where bank_code='333';

select * from product;
insert into product (product_cd, product_name, interest_rate, status_cd)values('D', '하이테크 특별 입출금통장', 3.4, 1);
insert into product values('Z', '타행적금',null,null,1);


select * from account;

SELECT '999' AS BANK_CD, USER_ID AS ID, USER_NAME NAME FROM BANK_USER WHERE USER_NAME='이나연' AND USER_BIRTHDAY='1993-03-25' AND replace(PHONE_NO, '-', '')='01084907607';

commit;

rollback;

SELECT *
FROM TRANSACTION@YJ
WHERE trans_account='777116392274'
ORDER BY TRANS_DATE DESC;

SELECT *  FROM TRANSACTION WHERE TRANS_ACCOUNT=777116392274 ORDER BY TRANS_DATE DESC

SELECT account_balance
FROM account@JI
WHERE account_no='3337878513011598';

select *
from bank_user;

update bank_user set user_id='test' where user_id='dunhigh@naver.comK';

insert into account@YJ(account_code, id, account_pw, account_balance, member_name, account_no, account_type)
values(777, 'nayeon', 1234, 1000000, '이나연', '777024055612', 'L');

delete from bank_user where user_id='test';
commit;


--지은이 거래내역  
WITH temp AS (
  SELECT
    TRANSACTION_DATE as Trans_date,
    TRANSACTION_TYPE as Trans_type,
    SENDER_NAME as Trans_name,
    AMOUNT as Trans_amount,
    LAG(AMOUNT) OVER (ORDER BY TRANSACTION_DATE DESC) AS PREV_AMOUNT,
    a.ACCOUNT_BALANCE
  FROM
    ACCOUNT@JI a
    JOIN TRANSACTION_HISTORY@JI th ON a.ACCOUNT_NO = th.TRANSACTION_ID
  WHERE
    a.ACCOUNT_NO = '3337878513011598'
)
SELECT
  Trans_date,
  Trans_type,
  Trans_name,
  Trans_amount,
  CASE
    WHEN ROW_NUMBER() OVER (ORDER BY Trans_date DESC) = 1 THEN ACCOUNT_BALANCE
    ELSE ACCOUNT_BALANCE - SUM(CASE 
                             WHEN Trans_type = '출금' THEN -PREV_AMOUNT 
                             ELSE PREV_AMOUNT 
                           END) OVER (ORDER BY Trans_date DESC) END AS Trans_balance
FROM
  temp
ORDER BY
  Trans_date DESC;
