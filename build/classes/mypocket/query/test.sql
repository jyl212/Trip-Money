insert into EXPENSE values(0,sysdate,3000,'���ִ�','','','webProject/f_mypocket/img_mypocket','�ĺ�',(select budget_no from budget where schdule_no=3 and kind='�ĺ�'));
create sequence budget_seq;
select * from expense;
desc expense;
insert into BUDGET values('�ĺ�',1,(select start_date from SCHEDULE where schedule_no=4),5000,4,budget_seq.nextval)

select * from budget where schedule_no=26 and kind='�׸�' and budget_flag=0;
update budget set price = price+500 where kind='�׸�' and schedule_no=26;
select * from budget where kind='';

delete from budget where kind='�ĺ�' and schedule_no=26;

create sequence expense_seq;