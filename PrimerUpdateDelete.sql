use SQLProjekatNFL;
GO
UPDATE dbo.Igrac set dbo.Igrac.Status = 1
where dbo.Igrac.IgracID = 19;

UPDATE dbo.Ugovor set dbo.Ugovor.DuzinaUgovora += 1
where dbo.Ugovor.UgovorID = 1


Delete from dbo.Ugovor
where dbo.Ugovor.VrednostUgovora < 6000000

select dbo.Ugovor.DuzinaUgovora from dbo.Ugovor where dbo.Ugovor.UgovorID = 1
