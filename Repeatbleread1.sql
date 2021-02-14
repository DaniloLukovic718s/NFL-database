---Korak 1
USE SQLProjekatNFL;
GO

---Korak 2 
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

BEGIN TRAN

select dbo.Statistika.TD, dbo.Statistika.Pokusaji, dbo.Statistika.Jardi
from dbo.Statistika
where dbo.Statistika.StatistikaID = 5;



-- Korak 5

select dbo.Statistika.TD, dbo.Statistika.Pokusaji, dbo.Statistika.Jardi
from dbo.Statistika
where dbo.Statistika.StatistikaID = 5;

COMMIT TRAN