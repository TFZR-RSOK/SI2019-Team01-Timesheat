USE [TimesheatDB]
GO
/****** Object:  View [dbo].[CategoriesGetAll]    Script Date: 2.6.2019. 18.44.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CategoriesGetAll]
AS
SELECT Id, Name, Version
FROM Categories
GO
/****** Object:  View [dbo].[CompaniesGetAll]    Script Date: 2.6.2019. 18.44.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CompaniesGetAll]
AS
SELECT *
FROM Companies
GO
/****** Object:  View [dbo].[MealsGetAll]    Script Date: 2.6.2019. 18.44.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MealsGetAll]
AS
SELECT *
FROM Meals
GO
/****** Object:  View [dbo].[MealsPortionsGetAll]    Script Date: 2.6.2019. 18.44.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MealsPortionsGetAll]
AS
SELECT *
FROM MealsPortions
GO
/****** Object:  View [dbo].[OrdersGetAll]    Script Date: 2.6.2019. 18.44.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrdersGetAll]
AS
SELECT *
FROM Orders
GO
/****** Object:  View [dbo].[PortionsGetAll]    Script Date: 2.6.2019. 18.44.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PortionsGetAll]
AS
SELECT *
FROM Portions
GO
/****** Object:  View [dbo].[RolesGetAll]    Script Date: 2.6.2019. 18.44.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RolesGetAll]
AS
SELECT *
FROM Portions
GO
/****** Object:  View [dbo].[UsersGetAll]    Script Date: 2.6.2019. 18.44.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UsersGetAll]
AS
SELECT *
FROM Users
GO
/****** Object:  View [dbo].[UsersRolesGetAll]    Script Date: 2.6.2019. 18.44.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UsersRolesGetAll]
AS
SELECT *
FROM UsersRoles
GO
