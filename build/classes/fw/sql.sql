select * from member;

select * from SCHEDULE;
insert into SCHEDULE values(schedule_no_seq.nextval,'title','20122313','20122314',3,'20180126',,'asd213');
update schedule set schedule_share='Y' where schedule_no=23
select * from schedule where schedule_no = 23
delete
select schedule_title, start_date, end_date, person, update_date, schedule_share, mem_id from schedule where mem_id ='asd213' order by schedule_no desc


insert into SCHEDULE_DAYS values((SELECT schedule_no FROM schedule WHERE ROWNUM = 1 ORDER BY schedule_no DESC), '123');

insert into SCHEDULE_DAYS values((SELECT schedule_no_seq.currval from dual), '123');
SELECT schedule_no FROM schedule WHERE ROWNUM = 1 ORDER BY schedule_no DESC;