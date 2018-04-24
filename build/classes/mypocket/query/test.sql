insert into EXPENSE values(0,sysdate,3000,'맛있다','','','webProject/f_mypocket/img_mypocket','식비',(select budget_no from budget where schdule_no=3 and kind='식비'));
create sequence budget_seq;
select * from expense;
desc expense;
insert into BUDGET values('식비',1,(select start_date from SCHEDULE where schedule_no=4),5000,4,budget_seq.nextval)

select * from budget where schedule_no=26 and kind='항목' and budget_flag=0;
update budget set price = price+500 where kind='항목' and schedule_no=26;
select * from budget where kind='';

delete from budget where kind='식비' and schedule_no=26;

create sequence expense_seq;