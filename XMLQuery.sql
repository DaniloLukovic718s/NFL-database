USE SQLProjekatNFL;
GO

Select
dbo.Igrac.Ime,
dbo.Igrac.Prezime,
dbo.Igrac.Pozicija,
dbo.Igrac.Status
FROM dbo.Igrac
FOR XML PATH ('Igrac'),
ROOT ('Igraci');