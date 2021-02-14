use SQLProjekatNFL;
go

create table dbo.EventLog
(
  PostTime datetime,
  LoginName varchar(100),
  DatabaseName varchar(100),
  EventType varchar(100)
);
go

create or alter trigger tr_Create_table
on database
for create_table
as
declare @data xml = eventdata();
insert into dbo.EventLog([PostTime], [LoginName], [DatabaseName], [EventType])
values
(
  GETDATE(),
  @data.value ('(/EVENT_INSTANCE/LoginName)[1]', 'nvarchar(100)'),
  @data.value ('(/EVENT_INSTANCE/DatabaseName)[1]', 'nvarchar(100)'),
  @data.value ('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(100)')
);
go

create table dbo.test_table
(testkolona int);

select * from dbo.EventLog