use SQLProjekatNFL;
Go

create procedure UpdateBrojTD
@StatistikaEkipaID int,
@Touchdown int
as
begin try
	begin transaction
	update dbo.StatistikaEkipa
	set Touchdown = @Touchdown
	where StatistikaEkipaID = @StatistikaEkipaID
	if @@TRANCOUNT > 0
	commit
end try
begin catch
	if @@TRANCOUNT > 0
	rollback
	exec ErrorHandler
end catch
go

select * from dbo.StatistikaEkipa