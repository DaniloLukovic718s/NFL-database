use SQLProjekatNFL;
go

/* Ovaj upit se koristi kako bi u toku sezone mogli da vidimo koja ekipa je imala najveci broj Touchdowna, takodje uz to mozemo videti i ukupan broj jardi ekipe
kako odredili tj primetili kolika je efikasnost ekipe.*/

select dbo.Ekipa.NazivEkipe as [Ime Ekipe], dbo.StatistikaEkipa.UkupnoJardi as [Ukupno jardi], dbo.StatistikaEkipa.Touchdown as [Touchdown] from dbo.Ekipa
inner join dbo.StatistikaEkipa on dbo.Ekipa.EkipaID = dbo.StatistikaEkipa.EkipaID ORDER BY dbo.StatistikaEkipa.Touchdown DESC;

/***********************************************************************************************************************************************************/

/*Ovaj upit se koristi kako bi videli statisticki koji broj igraca je postigao koliki broj Touchdowna. Group by se koristi zato sto svaka pozicija ima svoju
"dobru" vrednost. Samim tim dobili smo tabelu koja je jasno odvojila igrace po pozicijama pa onda po broju touchdowna. Takodje koristi se Having > 10
zato sto treba ipak postaviti neki standard koliko igraca ima dobru kolicinu touchdowna bez obzira na to na kojoj poziciji igra*/

select dbo.Igrac.Ime as [Ime], dbo.Igrac.Prezime as [Prezime], dbo.Igrac.Pozicija as [Pozicija], dbo.Statistika.TD as [TD] from dbo.Igrac inner join dbo.Statistika
on dbo.Igrac.IgracID = dbo.Statistika.IgracID Group by Pozicija, TD, Ime, Prezime Having TD > 10;

/************************************************************************************************************************************************************/

/*Ovaj upit se koristi kako bi se videli rezultati utakmica sa brojem poena domace i gostujuce ekipa kao i broj koja u kome se odigrava utakmica*/

select Domacin.NazivEkipe as [Domacin], Gost.NazivEkipe as [Gost], dbo.Raspored.BrojKola [#Kola], dbo.Utakmica.PoeniDrugiTim [Poen gosti], dbo.Utakmica.PoeniPrviTim [Poen domacin] from dbo.Utakmica
inner join dbo.Ekipa Domacin on Domacin.EkipaID = dbo.Utakmica.EkipaID1
inner join dbo.Ekipa Gost on Gost.EkipaID = dbo.Utakmica.EkipaID2
inner join dbo.Raspored on dbo.Utakmica.UtakmicaID = dbo.Raspored.UtakmicaID

/******************************************************************************************************************************************************/

/*Ovaj upit se koristi kako bi videli koji igraci iz kojih ekipa trenutno nisu aktivni zbog povreda */

select dbo.Igrac.Ime as [Ime], dbo.Igrac.Prezime as [Prezime], dbo.Igrac.Status as [Aktivan], dbo.Ekipa.NazivEkipe as [Naziv Ekipe] from dbo.Igrac
inner join dbo.Ekipa on dbo.Ekipa.EkipaID = dbo.Igrac.EkipaID where dbo.Igrac.Status = 0 order by NazivEkipe;

/******************************************************************************************************************************************************/
/*Ovaj upit se koristi kako bi videli vrednost igraca, tj. da li igrac osigurava odgovarajuci broj jardi u odnosu na ugovor koji trenutno imaju. Upit
je poredjan po opadajucoj vrednosti broja jardi kako bi imali laksi uvid u performansu igraca kao i to koji igraci mozda vrede vise od onoga sto
trenutno primaju, tako i obrtno. */

select dbo.Igrac.Ime as [Ime], dbo.Igrac.Prezime as [Prezime],dbo.Igrac.Pozicija as [Pozicija], dbo.Statistika.Jardi as [Broj Jardi], dbo.Ugovor.VrednostUgovora as [Vrednost ugovora]
from dbo.Igrac inner join dbo.Statistika on dbo.Statistika.IgracID = dbo.Igrac.IgracID
inner join dbo.Ugovor on dbo.Ugovor.IgracID = dbo.Igrac.IgracID
order by dbo.Statistika.Jardi DESC

/***********************************************************************************************************************************************************/
/*Ovaj upit se koristi kako bi videli celokupnu statistiku svih igraca na poziciji 'RB'. Poredjani su po opadajucem broju osvojenih jardi kako bi videli
koji igrac je najefikasniji*/
select dbo.Igrac.Ime as [Ime], dbo.Igrac.Prezime as [Prezime], dbo.Igrac.Pozicija as [Pozicija], dbo.Statistika.Jardi as [Broj Jardi], 
dbo.Statistika.TD as [Touchdown], dbo.Statistika.Pokusaji as [Broj trcanja], dbo.Statistika.Preko20 as [Preko 20 jardi] ,dbo.StatistikaRB.Fumble as [Fumble]
from 
dbo.Statistika inner join dbo.StatistikaRB on dbo.Statistika.StatistikaID = dbo.StatistikaRB.StatistikaID
inner join dbo.Igrac on dbo.Igrac.IgracID = dbo.Statistika.IgracID
order by Jardi desc;

/*************************************************************************************************************************************************************/
/*Ovaj upit se koristi kako bi videli celokupnu statistiku svih igraca na poziciji 'QB'. Poredjani su po opadajucem broju procenta uspesnosti kako bi videli
koji igrac je najefikasniji*/

select dbo.Igrac.Ime as [Ime], dbo.Igrac.Prezime as [Prezime], dbo.Igrac.Pozicija as [Pozicija], dbo.Statistika.Jardi as [Broj Jardi], 
dbo.Statistika.TD as [Touchdown], dbo.Statistika.Pokusaji as [Broj bacanja], dbo.Statistika.Preko40 as [Preko 20 jardi] ,dbo.StatistikaQB.Interception as [Interception],
dbo.StatistikaQB.Sack as [Broj sackova], dbo.StatistikaQB.ProcenatUspesnosti as [% uspesnosti]
from dbo.Statistika 
inner join dbo.StatistikaQB on dbo.Statistika.StatistikaID = dbo.StatistikaQB.StatistikaID
inner join dbo.Igrac on dbo.Igrac.IgracID = dbo.Statistika.IgracID
order by ProcenatUspesnosti desc;

/**************************************************************************************************************************************/

/*Ovaj upit se koristi kako bi videli celokupnu statistiku svih igraca na poziciji 'WR'. Poredjani su po opadajucem broju Touchdowna kako bi videli
koji igrac je najefikasniji*/

select dbo.Igrac.Ime as [Ime], dbo.Igrac.Prezime as [Prezime], dbo.Igrac.Pozicija as [Pozicija], dbo.Statistika.Jardi as [Broj Jardi], 
dbo.Statistika.TD as [Touchdown], dbo.Statistika.Pokusaji as [Broj hvatanja], dbo.StatistikaWR.Meta as [# meta], dbo.Statistika.Preko40 as [Preko 20 jardi] ,
dbo.StatistikaWR.Uspesnost as [% uspesnosti 1. downa]
from dbo.Statistika 
inner join dbo.StatistikaWR on dbo.Statistika.StatistikaID = dbo.StatistikaWR.StatistikaID
inner join dbo.Igrac on dbo.Igrac.IgracID = dbo.Statistika.IgracID
order by Touchdown desc;

/*************************************************************************************************************************************************/
/* Ovaj upit se koristi kako bi videli sve igrace kao i ekipe kojima pripadaju, uz to se vidi i u kojoj drzavi (state) se nalazi koja ekipa */

select dbo.Igrac.Ime as [Ime], dbo.Igrac.Prezime as [Prezime], dbo.Igrac.Pozicija as [Pozicija], dbo.Ekipa.NazivEkipe, dbo.Ekipa.ImeDrzave [Drzava]
from dbo.Igrac inner join dbo.Ekipa on dbo.Ekipa.EkipaID = dbo.Igrac.EkipaID order by dbo.IGrac.Ime;

/********************************************************************************************************************************************/
/* Ovaj upit se koristi kako bi pronasli sve igrace koji trenutno nemaju ugovor sa njihovim ekipama */
select dbo.Igrac.Ime as [Ime], dbo.Igrac.Prezime as [Prezime], dbo.Ugovor.VrednostUgovora as [Vrednost ugovora] from dbo.Igrac left outer join dbo.Ugovor on dbo.Igrac.IgracID = dbo.Ugovor.IgracID
where dbo.Ugovor.VrednostUgovora is NULL;