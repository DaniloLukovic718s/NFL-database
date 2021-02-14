--- korak 1

USE SQLProjekatNFL;
GO

--- korak 2
BEGIN TRAN
UPDATE dbo.Statistika
SET dbo.Statistika.TD += 1
WHERE dbo.Statistika.StatistikaID = 10;



--- korak 5
Select dbo.StatistikaQB.StatistikaQBID, dbo.StatistikaQB.StatistikaID, dbo.StatistikaQB.Interception
from dbo.StatistikaQB
where dbo.StatistikaQB.StatistikaID = 10;

COMMIT TRAN
GO