/*    ==Scripting Parameters==

    Source Database Engine Edition : Microsoft Azure SQL Database Edition
    Source Database Engine Type : Microsoft Azure SQL Database

    Target Server Version : SQL Server 2008 R2
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [TimesheatDB]
GO
/****** Object:  View [dbo].[CategoriesGetAll]    Script Date: 7/1/2019 9:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CategoriesGetAll]
AS
SELECT Id, Name, Version
FROM Categories
GO
/****** Object:  View [dbo].[CompaniesGetAll]    Script Date: 7/1/2019 9:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CompaniesGetAll]
AS
SELECT *
FROM Companies
GO
/****** Object:  View [dbo].[MealsCompaniesGetAll]    Script Date: 7/1/2019 9:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[MealsCompaniesGetAll]
AS
SELECT Id, Name, Price, CategoryId, Version
FROM MealsCompanies
INNER JOIN Meals ON Meals.Id = MealsCompanies.MealId
GO
/****** Object:  View [dbo].[MealsGetAll]    Script Date: 7/1/2019 9:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MealsGetAll]
AS
SELECT *
FROM Meals
GO
/****** Object:  View [dbo].[MealsPortionsGetAll]    Script Date: 7/1/2019 9:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MealsPortionsGetAll]
AS
SELECT *
FROM MealsPortions
GO
/****** Object:  View [dbo].[OrdersGetAll]    Script Date: 7/1/2019 9:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrdersGetAll]
AS
SELECT *
FROM Orders
GO
/****** Object:  View [dbo].[PortionsGetAll]    Script Date: 7/1/2019 9:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PortionsGetAll]
AS
SELECT *
FROM Portions
GO
/****** Object:  View [dbo].[RolesGetAll]    Script Date: 7/1/2019 9:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RolesGetAll]
AS
SELECT *
FROM Portions
GO
/****** Object:  View [dbo].[UsersGetAll]    Script Date: 7/1/2019 9:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UsersGetAll]
AS
SELECT *
FROM Users
GO
/****** Object:  View [dbo].[UsersRolesGetAll]    Script Date: 7/1/2019 9:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UsersRolesGetAll]
AS
SELECT *
FROM UsersRoles
GO
