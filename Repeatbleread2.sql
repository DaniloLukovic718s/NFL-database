---Korak 3
USE SQLProjekatNFL;
GO

---Korak 4
UPDATE dbo.Statistika
SET dbo.Statistika.TD += 1
where dbo.Statistika.StatistikaID = 5;

select dbo.Statistika.TD, dbo.Statistika.Pokusaji, dbo.Statistika.Jardi
from dbo.Statistika
where dbo.Statistika.StatistikaID = 5;