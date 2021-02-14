use SQLProjekatNFL;
GO

CREATE FUNCTION dbo.IgraciPoKlubu
(@ekipaID int)
RETURNS TABLE
AS
RETURN
(Select dbo.Igrac.Ime as [Ime igraca], dbo.Igrac.Prezime as [Prezime igraca], dbo.Igrac.Pozicija as [Pozicija igraca]
from dbo.Igrac
where dbo.Igrac.EkipaID = @ekipaID);
GO

select * from dbo.IgraciPoKlubu(1);
select * from dbo.IgraciPoKlubu(2);
select * from dbo.IgraciPoKlubu(3);
select * from dbo.IgraciPoKlubu(4);
