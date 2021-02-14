DECLARE @idoc INT, @doc VARCHAR(1000);  
SET @doc ='  
<Igraci>
  <Igrac>
    <Ime>Kyler</Ime>
    <Prezime>Murray</Prezime>
    <Pozicija>QB</Pozicija>
    <Status>1</Status>
  </Igrac>
  <Igrac>
    <Ime>Kenyan</Ime>
    <Prezime>Drake</Prezime>
    <Pozicija>RB</Pozicija>
    <Status>1</Status>
  </Igrac>
  <Igrac>
    <Ime>DeAndre</Ime>
    <Prezime>Hopkins</Prezime>
    <Pozicija>WR</Pozicija>
    <Status>1</Status>
  </Igrac>
 </Igraci>
 ';

 exec sp_xml_preparedocument @idoc output, @doc;

 select * from openxml(@idoc, '/Igraci/Igrac' , 1)
 with(
Ime varchar(30) 'Ime',
Prezime varchar(40) 'Prezime',
Pozicija varchar(50) 'Pozicija',
Status bit 'Status'
);