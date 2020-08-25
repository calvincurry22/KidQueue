SET IDENTITY_INSERT [User] ON
INSERT INTO [User] ([Id], [FirstName], [LastName], [Email], [Password], [FirebaseUserId], [UserTypeId])
VALUES 
(1, 'Calvin', 'Curry', 'calvin@me.com', '123456', 'DttpgfZFdxWSoY4GSlbZATDxPl72' , 1),
(2, 'Aleshia', 'Curry', 'aleshia@me.com', '!@#$%^', '9ZM32AbK3HQAJw1eAfCj2rq3mKI3', 1),
(3, 'Admin', 'Admin', 'admin@test.com', '123456', '8XBxu95MlgbHz3jCMHmo1nybBFB3', 2),
(4, 'Charles', 'Xavier', 'charlesxavier@me.com', '123456', 'DGEoTU0AEqZXcZIzxx3MVuHlPFz2', 2);
SET IDENTITY_INSERT [User] OFF


SET IDENTITY_INSERT [Daycare] ON
INSERT INTO [Daycare] ([Id], [Name], [Address], [City], [State], [ZipCode], [AdminUserId])
VALUES
(1, 'Umbrella Academy', '123 Foyer Rd', 'Old Hickory', 'TN', 37123, 3),
(2, 'Charle''s Xavier''s School for the Gifted', '789 Nowhere Lane', 'Mt. Juliet', 'TN', 37122, 4);
SET IDENTITY_INSERT [Daycare] OFF


SET IDENTITY_INSERT [UserType] ON
INSERT INTO [UserType] ([Id], [Name])
VALUES (1, 'Parent'), (2, 'Admin')
SET IDENTITY_INSERT [UserType] OFF

SET IDENTITY_INSERT [Child] ON
INSERT INTO [Child] ([Id], [FirstName], [LastName], [Birthdate], [ListAddDate], [DaycareId], [WaitListId])
VALUES 
(1, 'Allison', 'Hargreeves', '10-20-2018', '08-21-2020', 1, 3),
(2, 'Jean', 'Gray', '9-12-2021', '08-21-2020', 2, 4)
SET IDENTITY_INSERT [Child] OFF


SET IDENTITY_INSERT [Parent] ON
INSERT INTO [Parent] ([Id], [FirstName], [LastName], [ChildId], [Email], [Phone], [DaycareId], [WaitListId])
VALUES
(1, 'Calvin', 'Curry', 1, 'calvin@me.com', 1234567890, 1, 3),
(2, 'Dane', 'Whitman', 2, 'danewhitman@me.com', 1324569340, 2, 4)
SET IDENTITY_INSERT [Parent] OFF 


SET IDENTITY_INSERT [Waitlist] ON
INSERT INTO [Waitlist] ([Id], [Name], [DaycareId])
VALUES 
(1, '0-11Mos', 1),
(2, '1yr Old', 1),
(3, '2yr Old', 1),
(4, '0-11Mos', 2),
(5, '1yr Old', 2)
SET IDENTITY_INSERT [Waitlist] OFF
