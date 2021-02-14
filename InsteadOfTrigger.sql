use SQLProjekatNFL;
GO


create table Ekipa_Log
(
EkipaID int,
NazivEkipe varchar(50),
ImeDrzave varchar(50),
ImeStadiona varchar(50),
KapacitetStadiona int,
Log_Akcija varchar(100),
Log_vreme datetime
)
go

Create trigger trgInsteadofUpdate on dbo.Ekipa
Instead of update
as
declare @EkipaID int, @ImeDrzave varchar(50), @ImeStadiona varchar (50), @KapacitetStadiona int, @Log_Akcija varchar (100);
select @EkipaID = i.EkipaID from inserted i;
select @ImeDrzave = i.ImeDrzave from inserted i;
select @ImeStadiona = i.ImeStadiona from inserted i;
select @KapacitetStadiona = i.KapacitetStadiona from inserted i;
set @Log_Akcija = 'Insertovan rekord - Instead of Update Trigger.';
begin
begin tran
if (@KapacitetStadiona>=50000)
begin
raiserror('Ne moze se raditi dalje ukoliko je stadion manji od 50000', 16,1); 
rollback;
end
else begin
insert into Dbo.Ekipa_Log(EkipaID, ImeDrzave, ImeStadiona, KapacitetStadiona, Log_Akcija, Log_vreme)
values
(@EkipaID, @ImeDrzave, @ImeStadiona, @KapacitetStadiona, @Log_Akcija, GETDATE());
commit;
PRINT 'Rekod updejtovan: Instead of Update Trigger';
end
end

select * from dbo.Ekipa;
select * from dbo.Ekipa_Log;

update dbo.Ekipa set KapacitetStadiona = '49000' where EkipaID = 29;
update dbo.Ekipa set KapacitetStadiona = '69500' where EkipaID = 29;

