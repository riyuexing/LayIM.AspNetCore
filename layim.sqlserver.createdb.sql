
ALTER DATABASE [LayIM] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LayIM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LayIM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LayIM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LayIM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LayIM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LayIM] SET ARITHABORT OFF 
GO
ALTER DATABASE [LayIM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LayIM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LayIM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LayIM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LayIM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LayIM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LayIM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LayIM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LayIM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LayIM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LayIM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LayIM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LayIM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LayIM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LayIM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LayIM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LayIM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LayIM] SET RECOVERY FULL 
GO
ALTER DATABASE [LayIM] SET  MULTI_USER 
GO
ALTER DATABASE [LayIM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LayIM] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LayIM', N'ON'
GO
USE [LayIM]
GO
/****** Object:  Table [dbo].[layim_big_group]    Script Date: 2018/6/2 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_big_group](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[avatar] [varchar](200) NULL,
	[create_by] [bigint] NOT NULL,
 CONSTRAINT [PK_layim_big_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[layim_chat_record]    Script Date: 2018/6/2 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_chat_record](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[from_id] [bigint] NOT NULL,
	[to_id] [bigint] NOT NULL,
	[room_id] [varchar](50) NOT NULL,
	[ctype] [varchar](20) NULL,
	[msg] [varchar](2000) NOT NULL,
	[addtime] [bigint] NOT NULL,
 CONSTRAINT [PK_layim_chat_record] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[layim_friend_group]    Script Date: 2018/6/2 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_friend_group](
	[id] [bigint] NOT NULL,
	[name] [varchar](20) NOT NULL,
	[create_by] [bigint] NOT NULL,
 CONSTRAINT [PK_layim_friend_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[layim_friend_relation]    Script Date: 2018/6/2 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[layim_friend_relation](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid1] [bigint] NOT NULL,
	[uid2] [bigint] NOT NULL,
	[friend_group_1] [bigint] NOT NULL,
	[friend_group_2] [bigint] NOT NULL,
 CONSTRAINT [PK_layim_friend_relation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[layim_group_member]    Script Date: 2018/6/2 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[layim_group_member](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NOT NULL,
	[member_id] [bigint] NOT NULL,
	[addtime] [datetime] NOT NULL,
 CONSTRAINT [PK_layim_group_member] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[layim_user]    Script Date: 2018/6/2 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_user](
	[id] [bigint] NOT NULL,
	[name] [varchar](20) NOT NULL,
	[avatar] [varchar](200) NULL,
	[sign] [varchar](200) NULL,
 CONSTRAINT [PK_layim_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_group', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_group', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_relation', @level2type=N'COLUMN',@level2name=N'uid1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_relation', @level2type=N'COLUMN',@level2name=N'uid2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户分组1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_relation', @level2type=N'COLUMN',@level2name=N'friend_group_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户分组2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_relation', @level2type=N'COLUMN',@level2name=N'friend_group_2'
GO
USE [master]
GO
ALTER DATABASE [LayIM] SET  READ_WRITE 
GO
