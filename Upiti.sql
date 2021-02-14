use SQLProjekatNFL;
GO

-- visevrednosni 
-- Ovaj upit se koristi kako bi dobili sve igrace, tj vrednosti gde je pozicija igraca "QB"

select dbo.Igrac.Ime as [Ime igraca], dbo.Igrac.Prezime as [Prezime igraca] from dbo.Igrac where dbo.Igrac.IgracID IN
(select dbo.Igrac.IgracID from dbo.Igrac where Pozicija = 'QB');
GO
--skalarni
-- Ovaj upit se koristi kako bi videli koja ekipa ima najmanji kapacitet radi potencijalne bude nadogradnje stadiona
select dbo.Ekipa.NazivEkipe as [Ime ekipe], dbo.Ekipa.ImeStadiona as [Ime stadiona], dbo.Ekipa.KapacitetStadiona as [Kapacitet stadiona]
from dbo.Ekipa where dbo.Ekipa.KapacitetStadiona = (Select min(KapacitetStadiona) from dbo.Ekipa);

--korelativni
-- Ovaj upit se koristi kako bi dobili informacije o tome kakav je nastup ekipa. U ovom konkretnom slucaju analiziraju se utakmice gde je domaca ekipa
-- imala vise poena od prosecne vrednosti i onda mozemo videti da li su takvom perforamnsom uspeli da dobiju ili izgube utakmicu
select EkipaID1, PoeniPrviTim, PoeniDrugiTim from dbo.Utakmica as spoljasnji
where PoeniPrviTim > (Select avg(PoeniPrviTim) from Utakmica as unutrasnji where unutrasnji.EkipaID1 = spoljasnji.EkipaID1)
order by PoeniPrviTim desc, PoeniDrugiTim desc

--exists
-- Ovaj upit se koristi kako bi videli sve igrace koji imaju manje od 10 Touchdowna kako bi videli koji igraci trenutno nemaju optimalne performanse
-- i samim tim da se izvuce statistika kolika je kolicina igraca u pitanju
select Igrac.Ime, Igrac.Prezime from Igrac where EXISTS (select TD from Statistika where Statistika.IgracID = Igrac.IgracID and TD <10)

-- offset fetch
-- Ovaj upit se koristi kako bi videli drugu (slabiju) polovinu ekipa i njihov kapacitet stadiona. Samim tim dobijamo predstavu koliki je kapacitet ekipa na dnu
-- kao i to da se napravi buduca projekcija njihove zarade u odnosu na prodaju karata.
select dbo.Ekipa.NazivEkipe as [Ime ekipe], dbo.Ekipa.KapacitetStadiona as [Kapacitet],  dbo.Ekipa.ImeStadiona as [Naziv stadiona] from dbo.Ekipa
order by dbo.Ekipa.KapacitetStadiona DESC offset 16 rows fetch next 16 rows only;


