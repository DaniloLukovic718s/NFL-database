use SQLProjekatNFL;
go

----insert procedura

create or alter procedure dbo.DodajIgraca
(
@Ime nvarchar(30),
@Prezime nvarchar(40),
@EkipaID int,
@Pozicija nvarchar(50),
@Status bit,
@IgracID int OUTPUT
)
as
begin try
insert into dbo.Igrac
(Ime, Prezime, EkipaID, Pozicija, Status)
values
(@Ime, @Prezime, @EkipaID,@Pozicija,@Status)
SET @IgracID = SCOPE_IDENTITY();
end try
begin catch
exec ErrorHandler
end catch
go


----Delete procedura
create or alter procedure dbo.UkloniIgraca
(
@IgracID int
)
as
begin try
Delete from dbo.Igrac where dbo.Igrac.IgracID = @IgracID
end try
begin catch
exec ErrorHandler
end catch
go


---- Update procedura

create or alter procedure dbo.UpdatujIgraca
(
@Ime nvarchar(30),
@Prezime nvarchar(40),
@EkipaID int,
@Pozicija nvarchar(50),
@Status bit,
@IgracID int
)
as
begin try
Update dbo.Igrac
set Ime = @Ime,
	Prezime = @Prezime,
	EkipaID = @EkipaID,
	Pozicija = @Pozicija,
	Status = @Status
	where IgracID = @IgracID
end try
begin catch
exec ErrorHandler
end catch
go

select * from dbo.Igrac
select * from ErrorLog;


