USE SQLProjekatNFL;
GO

Select
dbo.Igrac.IgracID,
dbo.Igrac.Ime,
dbo.Igrac.Prezime,
dbo.Igrac.Pozicija,
dbo.Igrac.Status
FROM dbo.Igrac
FOR JSON PATH,
ROOT ('Igraci');