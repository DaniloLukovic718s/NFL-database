use SQLProjekatNFL;
GO

create view StatistikaIgraca
as
select Ime, Prezime, Pozicija, NazivEkipe, TD, Jardi
from Igrac
inner join Ekipa on Igrac.EkipaID = Ekipa.EkipaID
inner join Statistika on Statistika.IgracID = Igrac.IgracID
group by NazivEkipe, Pozicija, TD, Jardi, Ime, Prezime
GO

select * from StatistikaIgraca