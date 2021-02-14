use SQLProjekatNFL;
go

create or alter trigger dbo.InsertUtakmica
on dbo.Utakmica
after insert
as
begin
set nocount on;
if EXISTS( select * from inserted as i
where
i.EkipaID1 NOT BETWEEN 1 AND 32 OR
i.EkipaID2 NOT BETWEEN 1 AND 32 OR
i.PoeniPrviTim < 0 OR
i.PoeniDrugiTim < 0
)
begin
print 'Podaci koje ste uneli nisu validni';
if @@TRANCOUNT > 0
rollback transaction;
end;
end;
go

INSERT dbo.Utakmica (EkipaID1, EkipaID2, PoeniPrviTim,PoeniDrugiTim)
VALUES (1,2,-1,-2)
select * from Utakmica;