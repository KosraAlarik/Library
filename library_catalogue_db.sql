USE [master]
GO
/****** Object:  Database [LibraryCatalogueDB]    Script Date: 25.11.2019 23:06:00 ******/
CREATE DATABASE [LibraryCatalogueDB]
 CONTAINMENT = NONE
 ON  PRIMARY 

 LOG ON 

GO
ALTER DATABASE [LibraryCatalogueDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryCatalogueDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryCatalogueDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryCatalogueDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryCatalogueDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryCatalogueDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryCatalogueDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryCatalogueDB] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryCatalogueDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryCatalogueDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryCatalogueDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryCatalogueDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryCatalogueDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryCatalogueDB] SET QUERY_STORE = OFF
GO
USE [LibraryCatalogueDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [LibraryCatalogueDB]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 25.11.2019 23:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](200) NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[add_author]    Script Date: 25.11.2019 23:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[add_author] 
	@name nvarchar(50),
	@surname nvarchar(200),
	@id int OUTPUT
AS
BEGIN

	SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM dbo.authors WHERE name = @name AND surname = @surname)
	INSERT INTO dbo.authors ([name], surname)
	VALUES (@name, @surname)

	SET @id = @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[delete_author]    Script Date: 25.11.2019 23:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[delete_author]
	@id int
AS
BEGIN

	SET NOCOUNT ON;

	IF EXISTS(SELECT 1 FROM dbo.authors a WHERE a.id = @id)	
	DELETE FROM dbo.authors WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[edite_author]    Script Date: 25.11.2019 23:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[edite_author] 
	@name nvarchar(50),
	@surname nvarchar(200),
	@id int
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE dbo.authors SET name = @Name, surname = @Surname WHERE id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[get_all_authors]    Script Date: 25.11.2019 23:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[get_all_authors] 
	
AS
BEGIN
	SET NOCOUNT ON;

    SELECT id, name, surname FROM dbo.authors
END
GO
/****** Object:  StoredProcedure [dbo].[get_by_id]    Script Date: 25.11.2019 23:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[get_by_id] 
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP 1 id, name, surname FROM dbo.authors WHERE id=@Id
END
GO
USE [master]
GO
ALTER DATABASE [LibraryCatalogueDB] SET  READ_WRITE 
GO
