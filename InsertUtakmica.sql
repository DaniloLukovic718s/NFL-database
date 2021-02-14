use SQLProjekatNFL;
GO
/*Prvo kolo utakmica */
INSERT dbo.Utakmica (EkipaID1, EkipaID2, PoeniPrviTim, PoeniDrugiTim)
VALUES (16, 13, 34, 20),
(32, 26, 27, 17),
(3, 8, 38, 6),
(15, 14, 27, 20),
(11, 6, 23, 27),
(2, 29, 25, 38),
(21, 19, 21, 11),
(5, 25, 30, 34),
(4, 24, 27, 17),
(20, 12, 34, 43),
(7, 17, 13, 16),
(28, 1, 20, 24),
(22, 30, 34, 23),
(18, 9, 20, 17),
(27, 23, 16, 26),
(10, 31, 14, 16);
SELECT * FROM dbo.Utakmica
GO
/*Drugo kolo utakmica */
INSERT dbo.Utakmica (EkipaID1, EkipaID2, PoeniPrviTim, PoeniDrugiTim)
VALUES (8, 7, 35, 30),
(6, 23, 17, 13),
(26, 18, 19, 37),
(9, 2, 40, 39),
(30, 5, 31, 17),
(24, 28, 13, 31),
(27, 10, 26, 21),
(31, 15, 33, 30),
(12, 11, 42, 21),
(19, 4, 28, 31),
(14, 20, 28, 11),
(1, 32, 30, 15),
(13, 3, 16, 33),
(17, 16, 20, 23),
(29, 21, 35, 30),
(25, 22, 34, 24);
SELECT * FROM dbo.Utakmica
GO

/*Trece kolo utakmica */
INSERT dbo.Utakmica (EkipaID1, EkipaID2, PoeniPrviTim, PoeniDrugiTim)
VALUES 
(15, 19, 13, 31),
(23, 28, 9, 36),
(8, 32, 34, 20),
(26, 7, 23, 23),
(21, 25, 36, 20),
(2, 6, 26, 30),
(4, 18, 35, 32),
(20, 31, 30, 31),
(27, 13, 28, 21),
(17, 5, 16, 21),
(14, 24, 36, 7),
(29, 9, 38, 31),
(1, 11, 23, 26),
(10, 30, 10, 28),
(22, 12, 30, 37),
(3, 16, 20, 34);
SELECT * FROM dbo.Utakmica
GO

/*Cetvrto kolo utakmica (deo) */
INSERT dbo.Utakmica (EkipaID1, EkipaID2, PoeniPrviTim, PoeniDrugiTim)
VALUES 
(24, 10, 28, 37),
(9, 8, 38, 49);
SELECT * FROM dbo.Utakmica
GO