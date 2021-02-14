use SQLProjekatNFL;
go

CREATE TABLE dbo.ErrorLog
(
	ErrorID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ErrorTime datetime NOT NULL DEFAULT (GETDATE()),
	ErrorNumber int NOT NULL,
	ErrorSeverity int NOT NULL,
	ErrorState int NULL,
	ErrorProcedure nvarchar(126) NULL,
	ErrorLine int NULL,
	ErrorMessage nvarchar(1000) NULL,
	UserName nvarchar(50) NULL DEFAULT (SUSER_NAME()),
	Resolved bit NULL
)
GO

create procedure dbo.ErrorHandler
as
begin
begin try
insert into dbo.ErrorLog
(ErrorNumber, ErrorSeverity, ErrorState, ErrorProcedure, ErrorLine, ErrorMessage)
values
(
	ERROR_NUMBER(),
	ERROR_SEVERITY(),
	ERROR_STATE(),
	ERROR_PROCEDURE(),
	ERROR_LINE(),
	ERROR_MESSAGE()

)
end try
begin catch
print 'Desila se greska prilikom unosa u tabelu dbo.ErrorLog';
end catch
END;