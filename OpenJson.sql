declare @json nvarchar(max) = N'{"Igraci":[{"IgracID":1,"Ime":"Kyler","Prezime":"Murray","Pozicija":"QB","Status":true},{"IgracID":2,"Ime":"Kenyan","Prezime":"Drake","Pozicija":"RB","Status":true},{"IgracID":3,"Ime":"DeAndre","Prezime":"Hopkins","Pozicija":"WR","Status":true},{"IgracID":4,"Ime":"Matt","Prezime":"Ryan","Pozicija":"QB","Status":true},{"IgracID":5,"Ime":"Todd","Prezime":"Gurley","Pozicija":"RB","Status":true},{"IgracID":6,"Ime":"Julio","Prezime":"Jones","Pozicija":"WR","Status":true},{"IgracID":7,"Ime":"Lamar","Prezime":"Jackson","Pozicija":"QB","Status":true},{"IgracID":8,"Ime":"Gus","Prezime":"Edwards","Pozicija":"RB","Status":true}]}'
select * from openjson ( @json, '$.Igraci')
with(
igracID int '$.IgracID',
Ime varchar(30) '$.Ime',
Prezime varchar(40) '$.Prezime',
Pozicija varchar(50)'$.Pozicija',
Status bit '$.Status'
)