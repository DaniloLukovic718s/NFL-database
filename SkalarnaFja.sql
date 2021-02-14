use SQLProjekatNFL;
GO

CREATE FUNCTION dbo.KonverzijaDatuma(@datum date)
returns varchar (20)
AS
BEGIN
RETURN CONVERT (varchar(20), @datum, 103)
END
GO
---- Bez koriscenja f-je---------
select dbo.Raspored.RasporedID as [Broj utakmice], dbo.Raspored.BrojKola as [Broj kola], dbo.Raspored.Datum from dbo.Raspored
Order by Raspored.BrojKola DESC;

---- Sa koriscenjem f-je---------
select dbo.Raspored.RasporedID as [Broj utakmice], dbo.Raspored.BrojKola as [Broj kola], dbo.KonverzijaDatuma(Raspored.Datum) from dbo.Raspored
Order by Raspored.BrojKola DESC;
