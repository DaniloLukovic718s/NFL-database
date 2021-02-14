use SQLProjekatNFL;
go

CREATE PROCEDURE IgracPading
(
 @brojstrane int = 1,
 @brojlinija int = 5
)
AS
BEGIN DECLARE @preskociti int = (@brojstrane - 1) * @brojlinija
SELECT * FROM Igrac
ORDER BY IgracID
OFFSET @preskociti ROW FETCH FIRST @brojlinija ROWS ONLY
END;
GO
EXEC IgracPading 1, 7

