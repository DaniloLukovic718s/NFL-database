--- korak 3

USE SQLProjekatNFL;
GO


--- korak 4
BEGIN TRAN
UPDATE dbo.StatistikaQB
SET dbo.StatistikaQB.Interception += 1
WHERE dbo.StatistikaQB.StatistikaID = 10;

--- korak 6
Select dbo.Statistika.Pokusaji, dbo.Statistika.TD, dbo.Statistika.Jardi
from dbo.Statistika
where dbo.Statistika.StatistikaID = 10;

COMMIT TRAN
GO