USE [master]
GO
/****** Object:  Database [gym_management]    Script Date: 3/11/2021 10:27:33 PM ******/
CREATE DATABASE [gym_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gym_management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\gym_management.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'gym_management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\gym_management_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [gym_management] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gym_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gym_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gym_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gym_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gym_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gym_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [gym_management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gym_management] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [gym_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gym_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gym_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gym_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gym_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gym_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gym_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gym_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gym_management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gym_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gym_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gym_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gym_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gym_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gym_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gym_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gym_management] SET RECOVERY FULL 
GO
ALTER DATABASE [gym_management] SET  MULTI_USER 
GO
ALTER DATABASE [gym_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gym_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gym_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gym_management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'gym_management', N'ON'
GO
USE [gym_management]
GO
/****** Object:  User [ziakhan1]    Script Date: 3/11/2021 10:27:33 PM ******/
CREATE USER [ziakhan1] FOR LOGIN [ziakhan1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ziakhan1]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [ziakhan1]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [ziakhan1]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [ziakhan1]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [ziakhan1]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ziakhan1]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ziakhan1]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [ziakhan1]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [ziakhan1]
GO
/****** Object:  Table [dbo].[acc_acccombination]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acc_acccombination](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[combination_no] [int] NOT NULL,
	[combination_name] [nvarchar](100) NOT NULL,
	[group1] [int] NULL,
	[group2] [int] NULL,
	[group3] [int] NULL,
	[group4] [int] NULL,
	[group5] [int] NULL,
	[remark] [nvarchar](999) NULL,
	[update_time] [datetime] NULL,
	[area_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [acc_acccombination_area_id_combination_no_619eb4f5_uniq] UNIQUE NONCLUSTERED 
(
	[area_id] ASC,
	[combination_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acc_accgroups]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acc_accgroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[group_no] [int] NOT NULL,
	[group_name] [nvarchar](100) NOT NULL,
	[verify_mode] [int] NOT NULL,
	[timezone1] [int] NULL,
	[timezone2] [int] NULL,
	[timezone3] [int] NULL,
	[is_include_holiday] [smallint] NOT NULL,
	[update_time] [datetime] NULL,
	[area_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [acc_accgroups_area_id_group_no_5130a89c_uniq] UNIQUE NONCLUSTERED 
(
	[area_id] ASC,
	[group_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acc_accholiday]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acc_accholiday](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[update_time] [datetime] NULL,
	[area_id] [int] NOT NULL,
	[holiday_id] [int] NOT NULL,
	[timezone_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [acc_accholiday_area_id_holiday_id_6630c2eb_uniq] UNIQUE NONCLUSTERED 
(
	[area_id] ASC,
	[holiday_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acc_accprivilege]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acc_accprivilege](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[is_group_timezone] [smallint] NOT NULL,
	[timezone1] [int] NULL,
	[timezone2] [int] NULL,
	[timezone3] [int] NULL,
	[is_group_verifycode] [smallint] NOT NULL,
	[verify_mode] [int] NULL,
	[update_time] [datetime] NULL,
	[area_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [acc_accprivilege_area_id_employee_id_group_id_f3b297d8_uniq] UNIQUE NONCLUSTERED 
(
	[area_id] ASC,
	[employee_id] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acc_accterminal]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acc_accterminal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[door_name] [nvarchar](50) NULL,
	[door_lock_delay] [int] NOT NULL,
	[door_sensor_delay] [int] NOT NULL,
	[door_sensor_type] [smallint] NOT NULL,
	[door_alarm_delay] [int] NOT NULL,
	[retry_times] [smallint] NOT NULL,
	[valid_holiday] [smallint] NOT NULL,
	[nc_time_period] [int] NOT NULL,
	[no_time_period] [int] NOT NULL,
	[speaker_alarm] [smallint] NOT NULL,
	[duress_fun_on] [smallint] NOT NULL,
	[alarm_1_1] [smallint] NOT NULL,
	[alarm_1_n] [smallint] NOT NULL,
	[alarm_password] [smallint] NOT NULL,
	[duress_alarm_delay] [int] NOT NULL,
	[anti_passback_mode] [smallint] NOT NULL,
	[anti_door_direction] [smallint] NOT NULL,
	[verify_mode_485] [smallint] NOT NULL,
	[push_time] [datetime] NULL,
	[terminal_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acc_acctimezone]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acc_acctimezone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[timezone_no] [int] NOT NULL,
	[timezone_name] [nvarchar](100) NOT NULL,
	[sun_start] [datetime] NOT NULL,
	[sun_end] [datetime] NOT NULL,
	[sun_on] [smallint] NULL,
	[mon_start] [datetime] NOT NULL,
	[mon_end] [datetime] NOT NULL,
	[mon_on] [smallint] NULL,
	[tue_start] [datetime] NOT NULL,
	[tue_end] [datetime] NOT NULL,
	[tue_on] [smallint] NULL,
	[wed_start] [datetime] NOT NULL,
	[wed_end] [datetime] NOT NULL,
	[wed_on] [smallint] NULL,
	[thu_start] [datetime] NOT NULL,
	[thu_end] [datetime] NOT NULL,
	[thu_on] [smallint] NULL,
	[fri_start] [datetime] NOT NULL,
	[fri_end] [datetime] NOT NULL,
	[fri_on] [smallint] NULL,
	[sat_start] [datetime] NOT NULL,
	[sat_end] [datetime] NOT NULL,
	[sat_on] [smallint] NULL,
	[remark] [nvarchar](999) NULL,
	[update_time] [datetime] NULL,
	[area_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [acc_acctimezone_area_id_timezone_no_0cb8250f_uniq] UNIQUE NONCLUSTERED 
(
	[area_id] ASC,
	[timezone_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_login]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin_login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_admin_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[att_attcalclog]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_attcalclog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dept_id] [int] NULL,
	[emp_id] [int] NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[update_time] [datetime] NOT NULL,
	[log_type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_attreportsetting]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_attreportsetting](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[resign_emp] [smallint] NOT NULL,
	[short_date] [smallint] NOT NULL,
	[short_time] [smallint] NOT NULL,
	[func_key] [nvarchar](max) NULL,
	[att_item] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_attrule]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_attrule](
	[param_name] [nvarchar](20) NOT NULL,
	[param_value] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[param_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_attschedule]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_attschedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[employee_id] [int] NOT NULL,
	[shift_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_attshift]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_attshift](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](50) NOT NULL,
	[cycle_unit] [smallint] NOT NULL,
	[shift_cycle] [int] NOT NULL,
	[work_weekend] [bit] NOT NULL,
	[weekend_type] [smallint] NOT NULL,
	[work_day_off] [bit] NOT NULL,
	[day_off_type] [smallint] NOT NULL,
	[auto_shift] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_breaktime]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_breaktime](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](50) NOT NULL,
	[period_start] [datetime] NOT NULL,
	[func_key] [smallint] NOT NULL,
	[available_interval_type] [smallint] NOT NULL,
	[available_interval] [int] NOT NULL,
	[multiple_punch] [smallint] NOT NULL,
	[calc_type] [smallint] NOT NULL,
	[minimum_duration] [int] NULL,
	[duration] [int] NOT NULL,
	[early_in] [smallint] NOT NULL,
	[end_margin] [int] NOT NULL,
	[late_in] [smallint] NOT NULL,
	[min_early_in] [int] NOT NULL,
	[min_late_in] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [att_breaktime_alias_6212d9cf_uniq] UNIQUE NONCLUSTERED 
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_changeschedule]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_changeschedule](
	[abstractexception_ptr_id] [int] NOT NULL,
	[att_date] [datetime] NOT NULL,
	[previous_timeinterval] [nvarchar](100) NULL,
	[apply_time] [datetime] NOT NULL,
	[apply_reason] [nvarchar](200) NULL,
	[audit_reason] [nvarchar](max) NULL,
	[audit_time] [datetime] NOT NULL,
	[approver] [nvarchar](50) NULL,
	[employee_id] [int] NOT NULL,
	[timeinterval_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[abstractexception_ptr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_departmentschedule]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_departmentschedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[department_id] [int] NOT NULL,
	[shift_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_deptattrule]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_deptattrule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](50) NOT NULL,
	[rule] [nvarchar](max) NULL,
	[department_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_holiday]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_holiday](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](50) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[duration_day] [smallint] NOT NULL,
	[work_type] [smallint] NOT NULL,
	[department_id] [int] NULL,
	[overtime_lv1] [smallint] NOT NULL,
	[overtime_lv2] [smallint] NOT NULL,
	[overtime_lv3] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_leave]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_leave](
	[abstractexception_ptr_id] [int] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[apply_reason] [nvarchar](max) NULL,
	[apply_time] [datetime] NOT NULL,
	[audit_reason] [nvarchar](max) NULL,
	[audit_time] [datetime] NOT NULL,
	[approval_level] [smallint] NULL,
	[audit_user_id] [int] NULL,
	[approver] [nvarchar](50) NULL,
	[category_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[abstractexception_ptr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_leavecategory]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_leavecategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
	[minimum_unit] [float] NOT NULL,
	[unit] [smallint] NOT NULL,
	[round_off] [smallint] NOT NULL,
	[report_symbol] [nvarchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_manuallog]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_manuallog](
	[abstractexception_ptr_id] [int] NOT NULL,
	[punch_time] [datetime] NOT NULL,
	[punch_state] [int] NOT NULL,
	[work_code] [nvarchar](20) NULL,
	[apply_reason] [nvarchar](max) NULL,
	[apply_time] [datetime] NOT NULL,
	[audit_reason] [nvarchar](max) NULL,
	[audit_time] [datetime] NOT NULL,
	[approval_level] [smallint] NULL,
	[audit_user_id] [int] NULL,
	[approver] [nvarchar](50) NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[abstractexception_ptr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_overtime]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_overtime](
	[abstractexception_ptr_id] [int] NOT NULL,
	[overtime_type] [smallint] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[apply_reason] [nvarchar](max) NULL,
	[apply_time] [datetime] NOT NULL,
	[audit_reason] [nvarchar](max) NULL,
	[audit_time] [datetime] NOT NULL,
	[approval_level] [smallint] NULL,
	[audit_user_id] [int] NULL,
	[approver] [nvarchar](50) NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[abstractexception_ptr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_payloadbase]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_payloadbase](
	[uuid] [nvarchar](36) NOT NULL,
	[att_date] [datetime] NULL,
	[weekday] [smallint] NULL,
	[check_in] [datetime] NULL,
	[check_out] [datetime] NULL,
	[duration] [int] NULL,
	[duty_duration] [int] NULL,
	[work_day] [float] NOT NULL,
	[clock_in] [datetime] NULL,
	[clock_out] [datetime] NULL,
	[total_time] [int] NULL,
	[duty_worked] [int] NULL,
	[actual_worked] [int] NULL,
	[unscheduled] [int] NULL,
	[remaining] [int] NULL,
	[total_worked] [int] NULL,
	[late] [int] NULL,
	[early_leave] [int] NULL,
	[short] [int] NULL,
	[absent] [int] NULL,
	[leave] [int] NULL,
	[exception] [nvarchar](50) NULL,
	[day_off] [smallint] NOT NULL,
	[break_time_id] [nvarchar](36) NULL,
	[emp_id] [int] NOT NULL,
	[overtime_id] [nvarchar](36) NULL,
	[timetable_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[break_time_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[overtime_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_payloadbreak]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_payloadbreak](
	[uuid] [nvarchar](36) NOT NULL,
	[break_out] [datetime] NULL,
	[break_in] [datetime] NULL,
	[duration] [int] NULL,
	[taken] [int] NULL,
	[actual_duration] [int] NULL,
	[early_in] [int] NULL,
	[late_in] [int] NULL,
	[late] [int] NULL,
	[early_leave] [int] NULL,
	[absent] [int] NULL,
	[work_time] [int] NULL,
	[overtime] [int] NULL,
	[weekend_ot] [int] NULL,
	[holiday_ot] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_payloadexception]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_payloadexception](
	[uuid] [nvarchar](36) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[duration] [int] NULL,
	[days] [float] NULL,
	[data_type] [smallint] NOT NULL,
	[description] [nvarchar](50) NULL,
	[item_id] [int] NULL,
	[skd_id] [nvarchar](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_payloadmulpunchset]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_payloadmulpunchset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[att_date] [datetime] NOT NULL,
	[weekday] [smallint] NULL,
	[data_index] [smallint] NOT NULL,
	[clock_in] [datetime] NULL,
	[in_id] [int] NULL,
	[clock_out] [datetime] NULL,
	[out_id] [int] NULL,
	[total_time] [int] NULL,
	[worked_time] [int] NULL,
	[data_type] [smallint] NOT NULL,
	[emp_id] [int] NOT NULL,
	[timetable_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_payloadovertime]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_payloadovertime](
	[uuid] [nvarchar](36) NOT NULL,
	[normal_wt] [int] NULL,
	[normal_ot] [int] NULL,
	[weekend_ot] [int] NULL,
	[holiday_ot] [int] NULL,
	[ot_lv1] [int] NULL,
	[ot_lv2] [int] NULL,
	[ot_lv3] [int] NULL,
	[total_ot] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_payloadpunch]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_payloadpunch](
	[uuid] [nvarchar](36) NOT NULL,
	[att_date] [datetime] NULL,
	[correct_state] [nvarchar](3) NULL,
	[emp_id] [int] NOT NULL,
	[orig_id] [int] NULL,
	[skd_id] [nvarchar](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_reportparam]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_reportparam](
	[param_name] [nvarchar](20) NOT NULL,
	[param_value] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[param_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_shiftdetail]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_shiftdetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[in_time] [datetime] NOT NULL,
	[out_time] [datetime] NOT NULL,
	[day_index] [int] NOT NULL,
	[shift_id] [int] NOT NULL,
	[time_interval_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_tempschedule]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_tempschedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[rule_flag] [smallint] NOT NULL,
	[work_type] [smallint] NOT NULL,
	[employee_id] [int] NOT NULL,
	[time_interval_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_timeinterval]    Script Date: 3/11/2021 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_timeinterval](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](50) NOT NULL,
	[use_mode] [smallint] NOT NULL,
	[in_time] [datetime] NOT NULL,
	[in_required] [smallint] NOT NULL,
	[out_required] [smallint] NOT NULL,
	[allow_late] [int] NOT NULL,
	[allow_leave_early] [int] NOT NULL,
	[work_day] [float] NOT NULL,
	[multiple_punch] [smallint] NOT NULL,
	[available_interval_type] [smallint] NOT NULL,
	[available_interval] [int] NOT NULL,
	[work_time_duration] [int] NOT NULL,
	[func_key] [smallint] NOT NULL,
	[work_type] [smallint] NOT NULL,
	[day_change] [datetime] NOT NULL,
	[duration] [int] NOT NULL,
	[early_in] [smallint] NOT NULL,
	[in_above_margin] [int] NOT NULL,
	[in_ahead_margin] [int] NOT NULL,
	[late_out] [smallint] NOT NULL,
	[min_early_in] [int] NOT NULL,
	[min_late_out] [int] NOT NULL,
	[out_above_margin] [int] NOT NULL,
	[out_ahead_margin] [int] NOT NULL,
	[overtime_lv] [smallint] NOT NULL,
	[overtime_lv1] [smallint] NOT NULL,
	[overtime_lv2] [smallint] NOT NULL,
	[overtime_lv3] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_timeinterval_break_time]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_timeinterval_break_time](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[timeinterval_id] [int] NOT NULL,
	[breaktime_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [att_timeinterval_break_time_timeinterval_id_breaktime_id_6e1bfb4e_uniq] UNIQUE NONCLUSTERED 
(
	[timeinterval_id] ASC,
	[breaktime_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_training]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_training](
	[abstractexception_ptr_id] [int] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[apply_reason] [nvarchar](max) NULL,
	[apply_time] [datetime] NOT NULL,
	[audit_reason] [nvarchar](max) NULL,
	[audit_time] [datetime] NOT NULL,
	[approval_level] [smallint] NULL,
	[audit_user_id] [int] NULL,
	[approver] [nvarchar](50) NULL,
	[category_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[abstractexception_ptr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[att_trainingcategory]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[att_trainingcategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
	[minimum_unit] [float] NOT NULL,
	[unit] [smallint] NOT NULL,
	[round_off] [smallint] NOT NULL,
	[report_symbol] [nvarchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[attendence]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[attendence](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[member_name] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[attendence_date] [date] NOT NULL,
 CONSTRAINT [PK_attendence] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[attendenceTrainer]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[attendenceTrainer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[member_name] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[attendence_date] [date] NOT NULL,
 CONSTRAINT [PK_attendenceTrainer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[attparam]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attparam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paraname] [nvarchar](30) NOT NULL,
	[paratype] [nvarchar](10) NULL,
	[paravalue] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [attparam_paraname_paratype_6f176d25_uniq] UNIQUE NONCLUSTERED 
(
	[paraname] ASC,
	[paratype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] UNIQUE NONCLUSTERED 
(
	[group_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_permission_content_type_id_codename_01ab375a_uniq] UNIQUE NONCLUSTERED 
(
	[content_type_id] ASC,
	[codename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[emp_pin] [nvarchar](30) NULL,
	[email] [nvarchar](254) NOT NULL,
	[tele_phone] [nvarchar](30) NULL,
	[auth_time_dept] [int] NULL,
	[login_id] [int] NULL,
	[login_type] [int] NULL,
	[login_count] [int] NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_superuser] [bit] NOT NULL,
	[is_public] [bit] NOT NULL,
	[can_manage_all_dept] [bit] NOT NULL,
	[del_flag] [int] NULL,
	[date_joined] [datetime] NOT NULL,
	[last_login] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_user_auth_area]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_auth_area](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[myuser_id] [int] NOT NULL,
	[area_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_user_auth_area_myuser_id_area_id_02a19d63_uniq] UNIQUE NONCLUSTERED 
(
	[myuser_id] ASC,
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_user_auth_dept]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_auth_dept](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[myuser_id] [int] NOT NULL,
	[department_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_user_auth_dept_myuser_id_department_id_61d83386_uniq] UNIQUE NONCLUSTERED 
(
	[myuser_id] ASC,
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[myuser_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_user_groups_myuser_id_group_id_664bdfc3_uniq] UNIQUE NONCLUSTERED 
(
	[myuser_id] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_user_profile]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_profile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login_name] [nvarchar](30) NOT NULL,
	[pin_tabs] [nvarchar](max) NOT NULL,
	[disabled_fields] [nvarchar](max) NOT NULL,
	[column_order] [nvarchar](max) NOT NULL,
	[preferences] [nvarchar](max) NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[myuser_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_user_user_permissions_myuser_id_permission_id_a558717f_uniq] UNIQUE NONCLUSTERED 
(
	[myuser_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[authtoken_token]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authtoken_token](
	[key] [nvarchar](40) NOT NULL,
	[created] [datetime] NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_adminlog]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_adminlog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action] [nvarchar](50) NOT NULL,
	[targets] [nvarchar](max) NULL,
	[targets_repr] [nvarchar](max) NULL,
	[action_status] [smallint] NOT NULL,
	[description] [nvarchar](max) NULL,
	[ip_address] [nvarchar](39) NULL,
	[can_routable] [bit] NOT NULL,
	[op_time] [datetime] NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_attparamdepts]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_attparamdepts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rulename] [nvarchar](40) NOT NULL,
	[deptid] [int] NOT NULL,
	[operator] [nvarchar](20) NULL,
	[optime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[rulename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_autoexporttask]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_autoexporttask](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[task_code] [nvarchar](30) NOT NULL,
	[task_name] [nvarchar](30) NOT NULL,
	[params] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[task_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_bookmark]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_bookmark](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](128) NOT NULL,
	[filters] [nvarchar](1000) NOT NULL,
	[is_share] [bit] NOT NULL,
	[time_saved] [datetime] NOT NULL,
	[content_type_id] [int] NOT NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_dbbackuplog]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_dbbackuplog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[db_type] [nvarchar](50) NOT NULL,
	[db_name] [nvarchar](50) NOT NULL,
	[operator] [nvarchar](50) NULL,
	[backup_file] [nvarchar](100) NOT NULL,
	[backup_time] [datetime] NOT NULL,
	[backup_status] [smallint] NOT NULL,
	[remark] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_dbmigrate]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_dbmigrate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_linenotifysetting]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_linenotifysetting](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[include_sub_department] [int] NULL,
	[line_notify_token] [nvarchar](200) NULL,
	[message_type] [int] NULL,
	[message_head] [nvarchar](100) NULL,
	[message_tail] [nvarchar](100) NULL,
	[push_time] [datetime] NULL,
	[is_valid] [int] NULL,
	[remark] [nvarchar](200) NULL,
	[line_notify_dept_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [base_linenotifysetting_line_notify_dept_id_line_notify_token_message_type_dd79374f_uniq] UNIQUE NONCLUSTERED 
(
	[line_notify_dept_id] ASC,
	[line_notify_token] ASC,
	[message_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_sendemail]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_sendemail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[purpose] [int] NOT NULL,
	[email_to] [nvarchar](max) NOT NULL,
	[email_cc] [nvarchar](max) NULL,
	[email_bcc] [nvarchar](max) NULL,
	[email_subject] [nvarchar](40) NOT NULL,
	[email_content] [nvarchar](max) NULL,
	[send_time] [datetime] NULL,
	[send_status] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_sftpsetting]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_sftpsetting](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[host] [nvarchar](39) NOT NULL,
	[port] [int] NOT NULL,
	[auth_method] [int] NOT NULL,
	[user_name] [nvarchar](30) NOT NULL,
	[user_password] [nvarchar](128) NULL,
	[user_key] [nvarchar](max) NULL,
	[key_password] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [base_sftpsetting_user_name_host_f95e6bd9_uniq] UNIQUE NONCLUSTERED 
(
	[user_name] ASC,
	[host] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_sysparam]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_sysparam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[para_name] [nvarchar](30) NOT NULL,
	[para_type] [nvarchar](10) NULL,
	[para_value] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [base_sysparam_para_name_para_type_3086789a_uniq] UNIQUE NONCLUSTERED 
(
	[para_name] ASC,
	[para_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_sysparamdept]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_sysparamdept](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rule_name] [nvarchar](40) NOT NULL,
	[dept_id] [int] NOT NULL,
	[operator] [nvarchar](20) NULL,
	[op_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[rule_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_systemsetting]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_systemsetting](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_taskresultlog]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_taskresultlog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[task] [nvarchar](50) NOT NULL,
	[status] [nvarchar](10) NOT NULL,
	[result] [nvarchar](500) NOT NULL,
	[time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[celery_taskmeta]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[celery_taskmeta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[task_id] [nvarchar](255) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[result] [nvarchar](max) NULL,
	[date_done] [datetime] NOT NULL,
	[traceback] [nvarchar](max) NULL,
	[hidden] [bit] NOT NULL,
	[meta] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[task_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[celery_tasksetmeta]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[celery_tasksetmeta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskset_id] [nvarchar](255) NOT NULL,
	[result] [nvarchar](max) NOT NULL,
	[date_done] [datetime] NOT NULL,
	[hidden] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[taskset_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetime] NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [django_content_type_app_label_model_76bd3d3b_uniq] UNIQUE NONCLUSTERED 
(
	[app_label] ASC,
	[model] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[django_session]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[djcelery_crontabschedule]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[djcelery_crontabschedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[minute] [nvarchar](64) NOT NULL,
	[hour] [nvarchar](64) NOT NULL,
	[day_of_week] [nvarchar](64) NOT NULL,
	[day_of_month] [nvarchar](64) NOT NULL,
	[month_of_year] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[djcelery_intervalschedule]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[djcelery_intervalschedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[every] [int] NOT NULL,
	[period] [nvarchar](24) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[djcelery_periodictask]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[djcelery_periodictask](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[task] [nvarchar](200) NOT NULL,
	[args] [nvarchar](max) NOT NULL,
	[kwargs] [nvarchar](max) NOT NULL,
	[queue] [nvarchar](200) NULL,
	[exchange] [nvarchar](200) NULL,
	[routing_key] [nvarchar](200) NULL,
	[expires] [datetime] NULL,
	[enabled] [bit] NOT NULL,
	[last_run_at] [datetime] NULL,
	[total_run_count] [int] NOT NULL,
	[date_changed] [datetime] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[crontab_id] [int] NULL,
	[interval_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[djcelery_periodictasks]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[djcelery_periodictasks](
	[ident] [smallint] NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ident] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[djcelery_taskstate]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[djcelery_taskstate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[state] [nvarchar](64) NOT NULL,
	[task_id] [nvarchar](36) NOT NULL,
	[name] [nvarchar](200) NULL,
	[tstamp] [datetime] NOT NULL,
	[args] [nvarchar](max) NULL,
	[kwargs] [nvarchar](max) NULL,
	[eta] [datetime] NULL,
	[expires] [datetime] NULL,
	[result] [nvarchar](max) NULL,
	[traceback] [nvarchar](max) NULL,
	[runtime] [float] NULL,
	[retries] [int] NOT NULL,
	[hidden] [bit] NOT NULL,
	[worker_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[task_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[djcelery_workerstate]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[djcelery_workerstate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hostname] [nvarchar](255) NOT NULL,
	[last_heartbeat] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[hostname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[expenses]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[expenses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[expense_name] [varchar](50) NOT NULL,
	[expense_price] [int] NOT NULL,
	[expense_date] [date] NOT NULL,
 CONSTRAINT [PK_expenses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[guardian_groupobjectpermission]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guardian_groupobjectpermission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[object_pk] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [guardian_groupobjectpermission_group_id_permission_id_object_pk_3f189f7c_uniq] UNIQUE NONCLUSTERED 
(
	[group_id] ASC,
	[permission_id] ASC,
	[object_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[guardian_userobjectpermission]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guardian_userobjectpermission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[object_pk] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [guardian_userobjectpermission_user_id_permission_id_object_pk_b0b3d2fc_uniq] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[permission_id] ASC,
	[object_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gym_fee]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gym_fee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[fee_status] [varchar](50) NOT NULL,
	[fee_date] [date] NOT NULL,
 CONSTRAINT [PK_gym_fee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gym_packages]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gym_packages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[package_name] [varchar](50) NOT NULL,
	[package_duration] [varchar](50) NOT NULL,
	[package_price] [int] NOT NULL,
 CONSTRAINT [PK_gym_packages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[iclock_biodata]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_biodata](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[bio_tmp] [nvarchar](max) NOT NULL,
	[bio_no] [int] NULL,
	[bio_index] [int] NULL,
	[bio_type] [int] NOT NULL,
	[major_ver] [nvarchar](30) NOT NULL,
	[minor_ver] [nvarchar](30) NULL,
	[bio_format] [int] NULL,
	[valid] [int] NOT NULL,
	[duress] [int] NOT NULL,
	[update_time] [datetime] NULL,
	[sn] [nvarchar](50) NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [iclock_biodata_employee_id_bio_no_bio_index_bio_type_bio_format_major_ver_b71b2ca9_uniq] UNIQUE NONCLUSTERED 
(
	[employee_id] ASC,
	[bio_no] ASC,
	[bio_index] ASC,
	[bio_type] ASC,
	[bio_format] ASC,
	[major_ver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_biophoto]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_biophoto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[first_name] [nvarchar](25) NULL,
	[last_name] [nvarchar](25) NULL,
	[email] [nvarchar](254) NULL,
	[enroll_sn] [nvarchar](50) NULL,
	[register_photo] [nvarchar](100) NOT NULL,
	[register_time] [datetime] NOT NULL,
	[approval_photo] [nvarchar](100) NULL,
	[approval_state] [smallint] NOT NULL,
	[approval_time] [datetime] NULL,
	[remark] [nvarchar](100) NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_deviceconfig]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_deviceconfig](
	[uuid] [nvarchar](36) NOT NULL,
	[enable_registration] [bit] NOT NULL,
	[enable_resigned_filter] [bit] NOT NULL,
	[enable_auto_add] [bit] NOT NULL,
	[enable_name_upload] [bit] NOT NULL,
	[enable_card_upload] [bit] NOT NULL,
	[transaction_retention] [int] NOT NULL,
	[command_retention] [int] NOT NULL,
	[dev_log_retention] [int] NOT NULL,
	[upload_log_retention] [int] NOT NULL,
	[edit_policy] [smallint] NOT NULL,
	[import_policy] [smallint] NOT NULL,
	[mobile_policy] [smallint] NOT NULL,
	[device_policy] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_errorcommandlog]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_errorcommandlog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[error_code] [nvarchar](16) NULL,
	[error_msg] [nvarchar](50) NULL,
	[data_origin] [nvarchar](max) NULL,
	[cmd] [nvarchar](50) NULL,
	[additional] [nvarchar](max) NULL,
	[upload_time] [datetime] NOT NULL,
	[terminal_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_privatemessage]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_privatemessage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[duration] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[last_send] [datetime] NULL,
	[employee_id] [int] NOT NULL,
	[uid] [nvarchar](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_publicmessage]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_publicmessage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[duration] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[last_send] [datetime] NULL,
	[terminal_id] [int] NOT NULL,
	[uid] [nvarchar](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_terminal]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_terminal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[sn] [nvarchar](50) NOT NULL,
	[alias] [nvarchar](50) NOT NULL,
	[ip_address] [nvarchar](39) NOT NULL,
	[real_ip] [nvarchar](39) NULL,
	[state] [int] NOT NULL,
	[terminal_tz] [smallint] NOT NULL,
	[transfer_time] [nvarchar](100) NOT NULL,
	[heartbeat] [int] NOT NULL,
	[transfer_interval] [int] NOT NULL,
	[product_type] [smallint] NULL,
	[purpose] [smallint] NULL,
	[controller_type] [smallint] NULL,
	[authentication] [smallint] NOT NULL,
	[style] [nvarchar](20) NULL,
	[upload_flag] [nvarchar](10) NULL,
	[fw_ver] [nvarchar](100) NULL,
	[push_protocol] [nvarchar](30) NOT NULL,
	[push_ver] [nvarchar](30) NULL,
	[language] [int] NULL,
	[is_tft] [bit] NOT NULL,
	[terminal_name] [nvarchar](30) NULL,
	[platform] [nvarchar](30) NULL,
	[oem_vendor] [nvarchar](50) NULL,
	[log_stamp] [nvarchar](30) NULL,
	[op_log_stamp] [nvarchar](30) NULL,
	[capture_stamp] [nvarchar](30) NULL,
	[user_count] [int] NULL,
	[user_capacity] [int] NULL,
	[photo_func_on] [bit] NOT NULL,
	[transaction_count] [int] NULL,
	[transaction_capacity] [int] NULL,
	[fp_func_on] [bit] NOT NULL,
	[fp_count] [int] NULL,
	[fp_capacity] [int] NULL,
	[fp_alg_ver] [nvarchar](10) NULL,
	[face_func_on] [bit] NOT NULL,
	[face_count] [int] NULL,
	[face_capacity] [int] NULL,
	[face_alg_ver] [nvarchar](10) NULL,
	[fv_func_on] [bit] NOT NULL,
	[fv_count] [int] NULL,
	[fv_capacity] [int] NULL,
	[fv_alg_ver] [nvarchar](10) NULL,
	[palm_func_on] [bit] NOT NULL,
	[palm_count] [int] NULL,
	[palm_capacity] [int] NULL,
	[palm_alg_ver] [nvarchar](10) NULL,
	[last_activity] [datetime] NULL,
	[upload_time] [datetime] NULL,
	[push_time] [datetime] NULL,
	[area_id] [int] NULL,
	[is_access] [smallint] NOT NULL,
	[is_registration] [smallint] NOT NULL,
	[lock_func] [smallint] NOT NULL,
	[transfer_mode] [smallint] NOT NULL,
	[is_attendance] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_terminalcommand]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_terminalcommand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[commit_time] [datetime] NOT NULL,
	[transfer_time] [datetime] NULL,
	[return_time] [datetime] NULL,
	[return_value] [int] NULL,
	[terminal_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_terminalemployee]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_terminalemployee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[terminal_sn] [nvarchar](50) NOT NULL,
	[emp_code] [nvarchar](20) NOT NULL,
	[privilege] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_terminallog]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_terminallog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[terminal_tz] [smallint] NULL,
	[admin] [nvarchar](50) NULL,
	[action_name] [smallint] NULL,
	[action_time] [datetime] NULL,
	[object] [nvarchar](50) NULL,
	[param1] [int] NULL,
	[param2] [int] NULL,
	[param3] [int] NULL,
	[upload_time] [datetime] NULL,
	[terminal_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_terminalparameter]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_terminalparameter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[param_type] [nvarchar](10) NULL,
	[param_name] [nvarchar](30) NOT NULL,
	[param_value] [nvarchar](100) NOT NULL,
	[terminal_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [iclock_terminalparameter_terminal_id_param_name_8abbb5c0_uniq] UNIQUE NONCLUSTERED 
(
	[terminal_id] ASC,
	[param_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_terminaluploadlog]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_terminaluploadlog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event] [nvarchar](80) NOT NULL,
	[content] [nvarchar](80) NOT NULL,
	[upload_count] [int] NOT NULL,
	[error_count] [int] NOT NULL,
	[upload_time] [datetime] NOT NULL,
	[terminal_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_terminalworkcode]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_terminalworkcode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[code] [nvarchar](8) NOT NULL,
	[alias] [nvarchar](24) NOT NULL,
	[last_activity] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_transaction]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_transaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[emp_code] [nvarchar](20) NOT NULL,
	[punch_time] [datetime] NOT NULL,
	[punch_state] [nvarchar](5) NOT NULL,
	[verify_type] [int] NOT NULL,
	[work_code] [nvarchar](20) NULL,
	[terminal_sn] [nvarchar](50) NULL,
	[terminal_alias] [nvarchar](50) NULL,
	[area_alias] [nvarchar](30) NULL,
	[longitude] [float] NULL,
	[latitude] [float] NULL,
	[gps_location] [nvarchar](max) NULL,
	[mobile] [nvarchar](50) NULL,
	[source] [smallint] NULL,
	[purpose] [smallint] NULL,
	[crc] [nvarchar](100) NULL,
	[is_attendance] [smallint] NULL,
	[reserved] [nvarchar](100) NULL,
	[upload_time] [datetime] NULL,
	[sync_status] [smallint] NULL,
	[sync_time] [datetime] NULL,
	[emp_id] [int] NULL,
	[terminal_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [iclock_transaction_emp_code_punch_time_ca282852_uniq] UNIQUE NONCLUSTERED 
(
	[emp_code] ASC,
	[punch_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iclock_transactionproofcmd]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iclock_transactionproofcmd](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetime] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[terminal_count] [int] NULL,
	[server_count] [int] NULL,
	[flag] [smallint] NULL,
	[reserved_init] [int] NULL,
	[reserved_float] [float] NULL,
	[reserved_char] [nvarchar](30) NULL,
	[terminal_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[member_info]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[member_info](
	[id] [int] IDENTITY(5000,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[father_name] [varchar](50) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[package] [varchar](100) NOT NULL,
	[admission_date] [varchar](50) NOT NULL,
	[admission_fee] [int] NOT NULL,
	[monthly_fee] [int] NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[cnic] [varchar](50) NOT NULL,
	[insert_date] [date] NULL,
 CONSTRAINT [PK_member_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mobile_announcement]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobile_announcement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subject] [nvarchar](100) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[category] [smallint] NOT NULL,
	[sender] [nvarchar](50) NULL,
	[system_sender] [nvarchar](50) NULL,
	[create_time] [datetime] NULL,
	[receiver_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mobile_appactionlog]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobile_appactionlog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user] [nvarchar](20) NOT NULL,
	[client] [nvarchar](50) NULL,
	[action] [nvarchar](50) NULL,
	[params] [nvarchar](max) NULL,
	[describe] [nvarchar](max) NULL,
	[request_status] [smallint] NOT NULL,
	[action_time] [datetime] NOT NULL,
	[remote_ip] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mobile_applist]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobile_applist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[login_time] [datetime] NOT NULL,
	[last_active] [datetime] NOT NULL,
	[token] [nvarchar](100) NOT NULL,
	[device_token] [nvarchar](max) NOT NULL,
	[client_id] [nvarchar](100) NOT NULL,
	[client_category] [smallint] NOT NULL,
	[active] [smallint] NULL,
	[enable] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mobile_appnotification]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobile_appnotification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sender] [nvarchar](50) NULL,
	[system_sender] [nvarchar](50) NULL,
	[category] [smallint] NOT NULL,
	[sub_category] [int] NULL,
	[content] [nvarchar](max) NULL,
	[source] [int] NULL,
	[notification_time] [datetime] NOT NULL,
	[read_status] [smallint] NOT NULL,
	[read_time] [datetime] NULL,
	[receiver_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mobile_gpsfordepartment]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobile_gpsfordepartment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[location] [nvarchar](100) NOT NULL,
	[longitude] [float] NOT NULL,
	[latitude] [float] NOT NULL,
	[distance] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[department_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mobile_gpsforemployee]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobile_gpsforemployee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[location] [nvarchar](100) NOT NULL,
	[longitude] [float] NOT NULL,
	[latitude] [float] NOT NULL,
	[distance] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_deductionformula]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_deductionformula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[formula] [nvarchar](100) NOT NULL,
	[remark] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_emploan]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_emploan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[loan_amount] [float] NOT NULL,
	[loan_time] [datetime] NOT NULL,
	[refund_cycle] [smallint] NOT NULL,
	[per_cycle_refund] [float] NOT NULL,
	[loan_clean_time] [datetime] NULL,
	[remark] [nvarchar](300) NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_emppayrollprofile]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_emppayrollprofile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[payment_mode] [smallint] NULL,
	[payment_type] [smallint] NULL,
	[bank_name] [nvarchar](30) NULL,
	[bank_account] [nvarchar](30) NULL,
	[personnel_id] [nvarchar](30) NULL,
	[agent_id] [nvarchar](30) NULL,
	[agent_account] [nvarchar](30) NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_exceptionformula]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_exceptionformula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[exception_type] [smallint] NOT NULL,
	[formula] [nvarchar](100) NOT NULL,
	[remark] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_extradeduction]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_extradeduction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[amount] [float] NOT NULL,
	[issued_time] [datetime] NOT NULL,
	[remark] [nvarchar](300) NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_extraincrease]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_extraincrease](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[amount] [float] NOT NULL,
	[issued_time] [datetime] NOT NULL,
	[remark] [nvarchar](300) NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_increasementformula]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_increasementformula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[formula] [nvarchar](100) NOT NULL,
	[remark] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_leaveformula]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_leaveformula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[formula] [nvarchar](100) NOT NULL,
	[remark] [nvarchar](max) NULL,
	[category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_monthlysalary]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_monthlysalary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[calc_time] [datetime] NULL,
	[basic_salary] [float] NULL,
	[effective_date] [datetime] NULL,
	[format_dict] [nvarchar](max) NULL,
	[ot1] [float] NULL,
	[ot2] [float] NULL,
	[ot3] [float] NULL,
	[normal_ot] [float] NULL,
	[weekend_ot] [float] NULL,
	[holiday_ot] [float] NULL,
	[late_time] [float] NULL,
	[early_leave] [float] NULL,
	[absent_time] [float] NULL,
	[increase] [float] NULL,
	[deduction] [float] NULL,
	[leave] [nvarchar](max) NULL,
	[ot1_formula] [nvarchar](max) NULL,
	[ot2_formula] [nvarchar](max) NULL,
	[ot3_formula] [nvarchar](max) NULL,
	[normal_ot_formula] [nvarchar](max) NULL,
	[weekend_ot_formula] [nvarchar](max) NULL,
	[holiday_ot_formula] [nvarchar](max) NULL,
	[late_time_formula] [nvarchar](max) NULL,
	[early_leave_formula] [nvarchar](max) NULL,
	[absent_time_formula] [nvarchar](max) NULL,
	[increase_formula] [nvarchar](max) NULL,
	[deduction_formula] [nvarchar](max) NULL,
	[leave_formula] [nvarchar](max) NULL,
	[ot1_formula_name] [nvarchar](max) NULL,
	[ot2_formula_name] [nvarchar](max) NULL,
	[ot3_formula_name] [nvarchar](max) NULL,
	[normal_ot_formula_name] [nvarchar](max) NULL,
	[weekend_ot_formula_name] [nvarchar](max) NULL,
	[holiday_ot_formula_name] [nvarchar](max) NULL,
	[late_time_formula_name] [nvarchar](max) NULL,
	[early_leave_formula_name] [nvarchar](max) NULL,
	[absent_time_formula_name] [nvarchar](max) NULL,
	[increase_formula_name] [nvarchar](max) NULL,
	[deduction_formula_name] [nvarchar](max) NULL,
	[leave_formula_name] [nvarchar](max) NULL,
	[extra_increase] [float] NULL,
	[extra_deduction] [float] NULL,
	[total_loan_amount] [float] NULL,
	[refund_loan_amount] [float] NULL,
	[unrefund_loan_amount] [float] NULL,
	[loan_deduction] [float] NULL,
	[loan_increase] [float] NULL,
	[advance_increase] [float] NULL,
	[advance_deduction] [float] NULL,
	[reimbursement] [float] NULL,
	[total_increase_formula] [nvarchar](max) NULL,
	[total_increase_formula_name] [nvarchar](max) NULL,
	[total_increase_expression] [nvarchar](max) NULL,
	[total_increase] [float] NULL,
	[total_deduction_formula] [nvarchar](max) NULL,
	[total_deduction_formula_name] [nvarchar](max) NULL,
	[total_deduction_expression] [nvarchar](max) NULL,
	[total_deduction] [float] NULL,
	[total_salary_expression] [nvarchar](max) NULL,
	[total_salary] [float] NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_overtimeformula]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_overtimeformula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[overtime_level] [smallint] NOT NULL,
	[formula] [nvarchar](100) NOT NULL,
	[remark] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_reimbursement]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_reimbursement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rmb_amount] [float] NOT NULL,
	[rmb_time] [datetime] NOT NULL,
	[rmb_file] [nvarchar](200) NULL,
	[rmb_remark] [nvarchar](300) NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_salaryadvance]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_salaryadvance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[advance_amount] [float] NOT NULL,
	[advance_time] [datetime] NOT NULL,
	[advance_remark] [nvarchar](300) NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_salarystructure]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_salarystructure](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[salary_amount] [float] NOT NULL,
	[effective_date] [datetime] NOT NULL,
	[salary_remark] [nvarchar](300) NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_salarystructure_deductionformula]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_salarystructure_deductionformula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[salarystructure_id] [int] NOT NULL,
	[deductionformula_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [payroll_salarystructure_deductionformula_salarystructure_id_deductionformula_id_794e8449_uniq] UNIQUE NONCLUSTERED 
(
	[salarystructure_id] ASC,
	[deductionformula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_salarystructure_exceptionformula]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_salarystructure_exceptionformula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[salarystructure_id] [int] NOT NULL,
	[exceptionformula_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [payroll_salarystructure_exceptionformula_salarystructure_id_exceptionformula_id_a5e869ff_uniq] UNIQUE NONCLUSTERED 
(
	[salarystructure_id] ASC,
	[exceptionformula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_salarystructure_increasementformula]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_salarystructure_increasementformula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[salarystructure_id] [int] NOT NULL,
	[increasementformula_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [payroll_salarystructure_increasementformula_salarystructure_id_increasementformula_id_749132b3_uniq] UNIQUE NONCLUSTERED 
(
	[salarystructure_id] ASC,
	[increasementformula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_salarystructure_leaveformula]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_salarystructure_leaveformula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[salarystructure_id] [int] NOT NULL,
	[leaveformula_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [payroll_salarystructure_leaveformula_salarystructure_id_leaveformula_id_4efdce30_uniq] UNIQUE NONCLUSTERED 
(
	[salarystructure_id] ASC,
	[leaveformula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payroll_salarystructure_overtimeformula]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_salarystructure_overtimeformula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[salarystructure_id] [int] NOT NULL,
	[overtimeformula_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [payroll_salarystructure_overtimeformula_salarystructure_id_overtimeformula_id_0d0a0e81_uniq] UNIQUE NONCLUSTERED 
(
	[salarystructure_id] ASC,
	[overtimeformula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personnel_area]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel_area](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[area_code] [nvarchar](30) NOT NULL,
	[area_name] [nvarchar](30) NOT NULL,
	[is_default] [bit] NOT NULL,
	[parent_area_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[area_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personnel_assignareaemployee]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel_assignareaemployee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[assigned_time] [datetime] NOT NULL,
	[area_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personnel_certification]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel_certification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cert_code] [nvarchar](20) NOT NULL,
	[cert_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cert_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cert_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personnel_department]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel_department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dept_code] [nvarchar](50) NOT NULL,
	[dept_name] [nvarchar](100) NOT NULL,
	[is_default] [bit] NOT NULL,
	[parent_dept_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dept_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personnel_employee]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel_employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_time] [datetime] NULL,
	[create_user] [nvarchar](150) NULL,
	[change_time] [datetime] NULL,
	[change_user] [nvarchar](150) NULL,
	[status] [smallint] NOT NULL,
	[emp_code] [nvarchar](20) NOT NULL,
	[first_name] [nvarchar](25) NULL,
	[last_name] [nvarchar](25) NULL,
	[nickname] [nvarchar](25) NULL,
	[passport] [nvarchar](30) NULL,
	[driver_license_automobile] [nvarchar](30) NULL,
	[driver_license_motorcycle] [nvarchar](30) NULL,
	[photo] [nvarchar](200) NULL,
	[self_password] [nvarchar](128) NULL,
	[device_password] [nvarchar](20) NULL,
	[dev_privilege] [int] NULL,
	[card_no] [nvarchar](20) NULL,
	[acc_group] [nvarchar](5) NULL,
	[acc_timezone] [nvarchar](20) NULL,
	[gender] [nvarchar](1) NULL,
	[birthday] [datetime] NULL,
	[address] [nvarchar](200) NULL,
	[postcode] [nvarchar](10) NULL,
	[office_tel] [nvarchar](20) NULL,
	[contact_tel] [nvarchar](20) NULL,
	[mobile] [nvarchar](20) NULL,
	[national] [nvarchar](50) NULL,
	[religion] [nvarchar](20) NULL,
	[title] [nvarchar](20) NULL,
	[enroll_sn] [nvarchar](20) NULL,
	[ssn] [nvarchar](20) NULL,
	[update_time] [datetime] NULL,
	[hire_date] [datetime] NULL,
	[verify_mode] [int] NULL,
	[city] [nvarchar](20) NULL,
	[is_admin] [bit] NOT NULL,
	[emp_type] [int] NULL,
	[enable_att] [bit] NOT NULL,
	[enable_overtime] [bit] NOT NULL,
	[enable_holiday] [bit] NOT NULL,
	[deleted] [bit] NOT NULL,
	[reserved] [int] NULL,
	[del_tag] [int] NULL,
	[app_status] [smallint] NULL,
	[app_role] [smallint] NULL,
	[email] [nvarchar](50) NULL,
	[last_login] [datetime] NULL,
	[is_active] [bit] NOT NULL,
	[department_id] [int] NULL,
	[position_id] [int] NULL,
	[enable_payroll] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[emp_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personnel_employee_area]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel_employee_area](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NOT NULL,
	[area_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [personnel_employee_area_employee_id_area_id_00b3d777_uniq] UNIQUE NONCLUSTERED 
(
	[employee_id] ASC,
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personnel_employee_flow_role]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel_employee_flow_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NOT NULL,
	[workflowrole_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [personnel_employee_flow_role_employee_id_workflowrole_id_46b0e5e0_uniq] UNIQUE NONCLUSTERED 
(
	[employee_id] ASC,
	[workflowrole_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personnel_employeecertification]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel_employeecertification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[expire_on] [datetime] NULL,
	[email_alert] [bit] NOT NULL,
	[before] [int] NULL,
	[certification_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [personnel_employeecertification_employee_id_certification_id_7bcf4c7d_uniq] UNIQUE NONCLUSTERED 
(
	[employee_id] ASC,
	[certification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personnel_employeeprofile]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel_employeeprofile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[column_order] [nvarchar](max) NOT NULL,
	[preferences] [nvarchar](max) NOT NULL,
	[emp_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personnel_position]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel_position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[position_code] [nvarchar](50) NOT NULL,
	[position_name] [nvarchar](100) NOT NULL,
	[is_default] [bit] NOT NULL,
	[parent_position_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[position_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personnel_resign]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel_resign](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[resign_date] [datetime] NOT NULL,
	[resign_type] [int] NULL,
	[reason] [nvarchar](200) NULL,
	[disableatt] [bit] NOT NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[staff_stafftoken]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_stafftoken](
	[key] [nvarchar](40) NOT NULL,
	[created] [datetime] NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sync_area]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sync_area](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[area_code] [nvarchar](30) NOT NULL,
	[area_name] [nvarchar](30) NOT NULL,
	[post_time] [datetime] NULL,
	[flag] [smallint] NOT NULL,
	[update_time] [datetime] NULL,
	[sync_ret] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [sync_area_area_code_area_name_200046d1_uniq] UNIQUE NONCLUSTERED 
(
	[area_code] ASC,
	[area_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sync_department]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sync_department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dept_code] [nvarchar](50) NOT NULL,
	[dept_name] [nvarchar](100) NOT NULL,
	[post_time] [datetime] NULL,
	[flag] [smallint] NOT NULL,
	[update_time] [datetime] NULL,
	[sync_ret] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [sync_department_dept_code_dept_name_93923213_uniq] UNIQUE NONCLUSTERED 
(
	[dept_code] ASC,
	[dept_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sync_employee]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sync_employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[emp_code] [nvarchar](20) NOT NULL,
	[first_name] [nvarchar](25) NULL,
	[last_name] [nvarchar](25) NULL,
	[dept_code] [nvarchar](50) NULL,
	[dept_name] [nvarchar](100) NULL,
	[job_code] [nvarchar](50) NULL,
	[job_name] [nvarchar](100) NULL,
	[area_code] [nvarchar](30) NULL,
	[area_name] [nvarchar](30) NULL,
	[card_no] [nvarchar](20) NULL,
	[multi_area] [bit] NOT NULL,
	[hire_date] [datetime] NULL,
	[gender] [nvarchar](2) NULL,
	[birthday] [datetime] NULL,
	[email] [nvarchar](100) NULL,
	[active_status] [bit] NOT NULL,
	[post_time] [datetime] NULL,
	[flag] [smallint] NOT NULL,
	[update_time] [datetime] NULL,
	[sync_ret] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [sync_employee_emp_code_521bf06d_uniq] UNIQUE NONCLUSTERED 
(
	[emp_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sync_job]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sync_job](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[job_code] [nvarchar](50) NOT NULL,
	[job_name] [nvarchar](100) NOT NULL,
	[post_time] [datetime] NULL,
	[flag] [smallint] NOT NULL,
	[update_time] [datetime] NULL,
	[sync_ret] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [sync_job_job_code_job_name_4ec5619e_uniq] UNIQUE NONCLUSTERED 
(
	[job_code] ASC,
	[job_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[trainer_info]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[trainer_info](
	[id] [int] IDENTITY(50,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[father_name] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[join_date] [varchar](50) NOT NULL,
	[salary] [int] NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[cnic] [varchar](50) NOT NULL,
 CONSTRAINT [PK_trainer_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[workflow_abstractexception]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workflow_abstractexception](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[audit_status] [smallint] NOT NULL,
	[revoke_reason] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[workflow_nodeinstance]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workflow_nodeinstance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[order] [smallint] NOT NULL,
	[is_last_node] [bit] NOT NULL,
	[is_next_node] [bit] NOT NULL,
	[remark] [nvarchar](255) NULL,
	[apply_time] [datetime] NULL,
	[approver_admin_id] [int] NULL,
	[approver_employee_id] [int] NULL,
	[departments_id] [int] NULL,
	[node_engine_id] [int] NULL,
	[state] [smallint] NOT NULL,
	[workflow_instance_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[workflow_workflowengine]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workflow_workflowengine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[workflow_code] [nvarchar](50) NOT NULL,
	[workflow_name] [nvarchar](50) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[workflow_type] [smallint] NOT NULL,
	[inform_type] [smallint] NOT NULL,
	[del_flag] [smallint] NULL,
	[applicant_position_id] [int] NULL,
	[content_type_id] [int] NULL,
	[departments_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[workflow_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[workflow_workflowengine_employee]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workflow_workflowengine_employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[workflowengine_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [workflow_workflowengine_employee_workflowengine_id_employee_id_8128deb2_uniq] UNIQUE NONCLUSTERED 
(
	[workflowengine_id] ASC,
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[workflow_workflowinstance]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workflow_workflowinstance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[workflow_code] [nvarchar](255) NOT NULL,
	[workflow_name] [nvarchar](255) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[issue_date] [datetime] NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[content_type] [int] NOT NULL,
	[inform_type] [smallint] NOT NULL,
	[del_flag] [bit] NOT NULL,
	[employee_id] [int] NOT NULL,
	[exception_id] [int] NULL,
	[workflow_engine_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[exception_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[workflow_workflownode]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workflow_workflownode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[node_code] [nvarchar](30) NOT NULL,
	[node_name] [nvarchar](30) NOT NULL,
	[order_id] [int] NOT NULL,
	[approver_type] [smallint] NULL,
	[notifier_type] [smallint] NULL,
	[approver_by_overall] [bit] NOT NULL,
	[notify_by_overall] [bit] NOT NULL,
	[workflow_engine] [int] NOT NULL,
	[workflow_engine_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[workflow_workflownode_approver]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workflow_workflownode_approver](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[workflownode_id] [int] NOT NULL,
	[workflowrole_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [workflow_workflownode_approver_workflownode_id_workflowrole_id_7543ba37_uniq] UNIQUE NONCLUSTERED 
(
	[workflownode_id] ASC,
	[workflowrole_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[workflow_workflownode_notifier]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workflow_workflownode_notifier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[workflownode_id] [int] NOT NULL,
	[workflowrole_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [workflow_workflownode_notifier_workflownode_id_workflowrole_id_cac02b37_uniq] UNIQUE NONCLUSTERED 
(
	[workflownode_id] ASC,
	[workflowrole_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[workflow_workflowrole]    Script Date: 3/11/2021 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workflow_workflowrole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_code] [nvarchar](30) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[role_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [acc_acccombination_area_id_0d22c34e]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [acc_acccombination_area_id_0d22c34e] ON [dbo].[acc_acccombination]
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [acc_accgroups_area_id_b83745c3]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [acc_accgroups_area_id_b83745c3] ON [dbo].[acc_accgroups]
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [acc_accholiday_area_id_d15c19da]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [acc_accholiday_area_id_d15c19da] ON [dbo].[acc_accholiday]
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [acc_accholiday_holiday_id_a9efe924]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [acc_accholiday_holiday_id_a9efe924] ON [dbo].[acc_accholiday]
(
	[holiday_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [acc_accholiday_timezone_id_450d2d1e]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [acc_accholiday_timezone_id_450d2d1e] ON [dbo].[acc_accholiday]
(
	[timezone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [acc_accprivilege_area_id_2123ff6f]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [acc_accprivilege_area_id_2123ff6f] ON [dbo].[acc_accprivilege]
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [acc_accprivilege_employee_id_5fc55f95]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [acc_accprivilege_employee_id_5fc55f95] ON [dbo].[acc_accprivilege]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [acc_accprivilege_group_id_c5ed7003]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [acc_accprivilege_group_id_c5ed7003] ON [dbo].[acc_accprivilege]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [acc_accterminal_terminal_id_fc92cce2]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [acc_accterminal_terminal_id_fc92cce2] ON [dbo].[acc_accterminal]
(
	[terminal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [acc_acctimezone_area_id_e9ce7a7a]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [acc_acctimezone_area_id_e9ce7a7a] ON [dbo].[acc_acctimezone]
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [primary_key]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [primary_key] ON [dbo].[admin_login]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_attschedule_employee_id_caa61686]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_attschedule_employee_id_caa61686] ON [dbo].[att_attschedule]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_attschedule_shift_id_13d2db9a]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_attschedule_shift_id_13d2db9a] ON [dbo].[att_attschedule]
(
	[shift_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_changeschedule_employee_id_7871a2b6]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_changeschedule_employee_id_7871a2b6] ON [dbo].[att_changeschedule]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_changeschedule_timeinterval_id_d41ac077]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_changeschedule_timeinterval_id_d41ac077] ON [dbo].[att_changeschedule]
(
	[timeinterval_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_departmentschedule_department_id_c68fca3d]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_departmentschedule_department_id_c68fca3d] ON [dbo].[att_departmentschedule]
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_departmentschedule_shift_id_c37d5ade]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_departmentschedule_shift_id_c37d5ade] ON [dbo].[att_departmentschedule]
(
	[shift_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_deptattrule_department_id_f333c8f0]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_deptattrule_department_id_f333c8f0] ON [dbo].[att_deptattrule]
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_holiday_department_id_fbbbd185]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_holiday_department_id_fbbbd185] ON [dbo].[att_holiday]
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_leave_category_id_bbba39ba]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_leave_category_id_bbba39ba] ON [dbo].[att_leave]
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_leave_employee_id_bb231627]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_leave_employee_id_bb231627] ON [dbo].[att_leave]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_manuallog_employee_id_dc8cc2ad]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_manuallog_employee_id_dc8cc2ad] ON [dbo].[att_manuallog]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_overtime_employee_id_0c0d39dc]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_overtime_employee_id_0c0d39dc] ON [dbo].[att_overtime]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_payloadbase_emp_id_2c0f6a7b]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_payloadbase_emp_id_2c0f6a7b] ON [dbo].[att_payloadbase]
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_payloadbase_timetable_id_a389e3d8]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_payloadbase_timetable_id_a389e3d8] ON [dbo].[att_payloadbase]
(
	[timetable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_payloadexception_item_id_a08bfe48]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_payloadexception_item_id_a08bfe48] ON [dbo].[att_payloadexception]
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [att_payloadexception_skd_id_b2e9ecaa]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_payloadexception_skd_id_b2e9ecaa] ON [dbo].[att_payloadexception]
(
	[skd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_payloadmulpunchset_emp_id_f47610c8]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_payloadmulpunchset_emp_id_f47610c8] ON [dbo].[att_payloadmulpunchset]
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_payloadmulpunchset_timetable_id_9a439a09]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_payloadmulpunchset_timetable_id_9a439a09] ON [dbo].[att_payloadmulpunchset]
(
	[timetable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_payloadpunch_emp_id_053da2f0]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_payloadpunch_emp_id_053da2f0] ON [dbo].[att_payloadpunch]
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_payloadpunch_orig_id_16b26416]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_payloadpunch_orig_id_16b26416] ON [dbo].[att_payloadpunch]
(
	[orig_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [att_payloadpunch_skd_id_17596d82]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_payloadpunch_skd_id_17596d82] ON [dbo].[att_payloadpunch]
(
	[skd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_shiftdetail_shift_id_7d694501]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_shiftdetail_shift_id_7d694501] ON [dbo].[att_shiftdetail]
(
	[shift_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_shiftdetail_time_interval_id_777dde8f]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_shiftdetail_time_interval_id_777dde8f] ON [dbo].[att_shiftdetail]
(
	[time_interval_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_tempschedule_employee_id_b89c7e54]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_tempschedule_employee_id_b89c7e54] ON [dbo].[att_tempschedule]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_tempschedule_time_interval_id_08dd8eb3]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_tempschedule_time_interval_id_08dd8eb3] ON [dbo].[att_tempschedule]
(
	[time_interval_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_timeinterval_break_time_breaktime_id_08462308]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_timeinterval_break_time_breaktime_id_08462308] ON [dbo].[att_timeinterval_break_time]
(
	[breaktime_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_timeinterval_break_time_timeinterval_id_2287017e]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_timeinterval_break_time_timeinterval_id_2287017e] ON [dbo].[att_timeinterval_break_time]
(
	[timeinterval_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_training_category_id_fb38e891]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_training_category_id_fb38e891] ON [dbo].[att_training]
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [att_training_employee_id_44af8319]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [att_training_employee_id_44af8319] ON [dbo].[att_training]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_auth_area_area_id_d1e54c70]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_auth_area_area_id_d1e54c70] ON [dbo].[auth_user_auth_area]
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_auth_area_myuser_id_5fb9a803]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_auth_area_myuser_id_5fb9a803] ON [dbo].[auth_user_auth_area]
(
	[myuser_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_auth_dept_department_id_5866c514]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_auth_dept_department_id_5866c514] ON [dbo].[auth_user_auth_dept]
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_auth_dept_myuser_id_18a51b27]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_auth_dept_myuser_id_18a51b27] ON [dbo].[auth_user_auth_dept]
(
	[myuser_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_group_id_97559544]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_myuser_id_d03e8dcc]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_myuser_id_d03e8dcc] ON [dbo].[auth_user_groups]
(
	[myuser_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_myuser_id_679b1527]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_myuser_id_679b1527] ON [dbo].[auth_user_user_permissions]
(
	[myuser_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_permission_id_1fbb5f2c]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [base_adminlog_content_type_id_3e553c30]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [base_adminlog_content_type_id_3e553c30] ON [dbo].[base_adminlog]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [base_adminlog_user_id_ecf659f8]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [base_adminlog_user_id_ecf659f8] ON [dbo].[base_adminlog]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [base_bookmark_content_type_id_b6a0e799]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [base_bookmark_content_type_id_b6a0e799] ON [dbo].[base_bookmark]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [base_bookmark_user_id_5f2d5ca2]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [base_bookmark_user_id_5f2d5ca2] ON [dbo].[base_bookmark]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [base_linenotifysetting_line_notify_dept_id_0643a5ed]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [base_linenotifysetting_line_notify_dept_id_0643a5ed] ON [dbo].[base_linenotifysetting]
(
	[line_notify_dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [celery_taskmeta_hidden_23fd02dc]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [celery_taskmeta_hidden_23fd02dc] ON [dbo].[celery_taskmeta]
(
	[hidden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [celery_tasksetmeta_hidden_593cfc24]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [celery_tasksetmeta_hidden_593cfc24] ON [dbo].[celery_tasksetmeta]
(
	[hidden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [djcelery_periodictask_crontab_id_75609bab]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [djcelery_periodictask_crontab_id_75609bab] ON [dbo].[djcelery_periodictask]
(
	[crontab_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [djcelery_periodictask_interval_id_b426ab02]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [djcelery_periodictask_interval_id_b426ab02] ON [dbo].[djcelery_periodictask]
(
	[interval_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [djcelery_taskstate_hidden_c3905e57]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [djcelery_taskstate_hidden_c3905e57] ON [dbo].[djcelery_taskstate]
(
	[hidden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [djcelery_taskstate_name_8af9eded]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [djcelery_taskstate_name_8af9eded] ON [dbo].[djcelery_taskstate]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [djcelery_taskstate_state_53543be4]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [djcelery_taskstate_state_53543be4] ON [dbo].[djcelery_taskstate]
(
	[state] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [djcelery_taskstate_tstamp_4c3f93a1]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [djcelery_taskstate_tstamp_4c3f93a1] ON [dbo].[djcelery_taskstate]
(
	[tstamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [djcelery_taskstate_worker_id_f7f57a05]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [djcelery_taskstate_worker_id_f7f57a05] ON [dbo].[djcelery_taskstate]
(
	[worker_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [djcelery_workerstate_last_heartbeat_4539b544]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [djcelery_workerstate_last_heartbeat_4539b544] ON [dbo].[djcelery_workerstate]
(
	[last_heartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [guardian_groupobjectpermission_content_type_id_7ade36b8]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [guardian_groupobjectpermission_content_type_id_7ade36b8] ON [dbo].[guardian_groupobjectpermission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [guardian_groupobjectpermission_group_id_4bbbfb62]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [guardian_groupobjectpermission_group_id_4bbbfb62] ON [dbo].[guardian_groupobjectpermission]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [guardian_groupobjectpermission_permission_id_36572738]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [guardian_groupobjectpermission_permission_id_36572738] ON [dbo].[guardian_groupobjectpermission]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [guardian_userobjectpermission_content_type_id_2e892405]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [guardian_userobjectpermission_content_type_id_2e892405] ON [dbo].[guardian_userobjectpermission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [guardian_userobjectpermission_permission_id_71807bfc]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [guardian_userobjectpermission_permission_id_71807bfc] ON [dbo].[guardian_userobjectpermission]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [guardian_userobjectpermission_user_id_d5c1e964]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [guardian_userobjectpermission_user_id_d5c1e964] ON [dbo].[guardian_userobjectpermission]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_biodata_employee_id_ff748ea7]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_biodata_employee_id_ff748ea7] ON [dbo].[iclock_biodata]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_biophoto_employee_id_3dba5819]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_biophoto_employee_id_3dba5819] ON [dbo].[iclock_biophoto]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_errorcommandlog_terminal_id_3b2d7cbd]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_errorcommandlog_terminal_id_3b2d7cbd] ON [dbo].[iclock_errorcommandlog]
(
	[terminal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_privatemessage_employee_id_e84a34c0]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_privatemessage_employee_id_e84a34c0] ON [dbo].[iclock_privatemessage]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_publicmessage_terminal_id_c3b5e4cf]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_publicmessage_terminal_id_c3b5e4cf] ON [dbo].[iclock_publicmessage]
(
	[terminal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_terminal_area_id_c019c6f0]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_terminal_area_id_c019c6f0] ON [dbo].[iclock_terminal]
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_terminalcommand_terminal_id_3dcf836f]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_terminalcommand_terminal_id_3dcf836f] ON [dbo].[iclock_terminalcommand]
(
	[terminal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_terminallog_terminal_id_667b3ea7]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_terminallog_terminal_id_667b3ea7] ON [dbo].[iclock_terminallog]
(
	[terminal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_terminalparameter_terminal_id_443872e3]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_terminalparameter_terminal_id_443872e3] ON [dbo].[iclock_terminalparameter]
(
	[terminal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_terminaluploadlog_terminal_id_9c9a7664]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_terminaluploadlog_terminal_id_9c9a7664] ON [dbo].[iclock_terminaluploadlog]
(
	[terminal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_transaction_emp_id_60fa3521]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_transaction_emp_id_60fa3521] ON [dbo].[iclock_transaction]
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_transaction_terminal_id_451c81c2]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_transaction_terminal_id_451c81c2] ON [dbo].[iclock_transaction]
(
	[terminal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iclock_transactionproofcmd_terminal_id_08b81e1e]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [iclock_transactionproofcmd_terminal_id_08b81e1e] ON [dbo].[iclock_transactionproofcmd]
(
	[terminal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [mobile_announcement_receiver_id_ddf2a860]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [mobile_announcement_receiver_id_ddf2a860] ON [dbo].[mobile_announcement]
(
	[receiver_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [mobile_appnotification_receiver_id_90c4a355]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [mobile_appnotification_receiver_id_90c4a355] ON [dbo].[mobile_appnotification]
(
	[receiver_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [mobile_gpsfordepartment_department_id_988ccf22]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [mobile_gpsfordepartment_department_id_988ccf22] ON [dbo].[mobile_gpsfordepartment]
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [mobile_gpsforemployee_employee_id_982b7cef]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [mobile_gpsforemployee_employee_id_982b7cef] ON [dbo].[mobile_gpsforemployee]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_emploan_employee_id_97a251ef]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_emploan_employee_id_97a251ef] ON [dbo].[payroll_emploan]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_extradeduction_employee_id_53072441]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_extradeduction_employee_id_53072441] ON [dbo].[payroll_extradeduction]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_extraincrease_employee_id_f902e6bb]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_extraincrease_employee_id_f902e6bb] ON [dbo].[payroll_extraincrease]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_leaveformula_category_id_945b2054]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_leaveformula_category_id_945b2054] ON [dbo].[payroll_leaveformula]
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_monthlysalary_employee_id_97fdc6a9]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_monthlysalary_employee_id_97fdc6a9] ON [dbo].[payroll_monthlysalary]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_reimbursement_employee_id_c4bbde36]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_reimbursement_employee_id_c4bbde36] ON [dbo].[payroll_reimbursement]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salaryadvance_employee_id_2abd43e5]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salaryadvance_employee_id_2abd43e5] ON [dbo].[payroll_salaryadvance]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salarystructure_employee_id_98996e15]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salarystructure_employee_id_98996e15] ON [dbo].[payroll_salarystructure]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salarystructure_deductionformula_deductionformula_id_b174d5b6]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salarystructure_deductionformula_deductionformula_id_b174d5b6] ON [dbo].[payroll_salarystructure_deductionformula]
(
	[deductionformula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salarystructure_deductionformula_salarystructure_id_5ca7cdb5]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salarystructure_deductionformula_salarystructure_id_5ca7cdb5] ON [dbo].[payroll_salarystructure_deductionformula]
(
	[salarystructure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salarystructure_exceptionformula_exceptionformula_id_8f6dadb3]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salarystructure_exceptionformula_exceptionformula_id_8f6dadb3] ON [dbo].[payroll_salarystructure_exceptionformula]
(
	[exceptionformula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salarystructure_exceptionformula_salarystructure_id_3c087208]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salarystructure_exceptionformula_salarystructure_id_3c087208] ON [dbo].[payroll_salarystructure_exceptionformula]
(
	[salarystructure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salarystructure_increasementformula_increasementformula_id_3cd77082]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salarystructure_increasementformula_increasementformula_id_3cd77082] ON [dbo].[payroll_salarystructure_increasementformula]
(
	[increasementformula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salarystructure_increasementformula_salarystructure_id_8752401c]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salarystructure_increasementformula_salarystructure_id_8752401c] ON [dbo].[payroll_salarystructure_increasementformula]
(
	[salarystructure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salarystructure_leaveformula_leaveformula_id_049f9024]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salarystructure_leaveformula_leaveformula_id_049f9024] ON [dbo].[payroll_salarystructure_leaveformula]
(
	[leaveformula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salarystructure_leaveformula_salarystructure_id_cf98fdd7]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salarystructure_leaveformula_salarystructure_id_cf98fdd7] ON [dbo].[payroll_salarystructure_leaveformula]
(
	[salarystructure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salarystructure_overtimeformula_overtimeformula_id_40ad89ef]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salarystructure_overtimeformula_overtimeformula_id_40ad89ef] ON [dbo].[payroll_salarystructure_overtimeformula]
(
	[overtimeformula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [payroll_salarystructure_overtimeformula_salarystructure_id_64f75042]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [payroll_salarystructure_overtimeformula_salarystructure_id_64f75042] ON [dbo].[payroll_salarystructure_overtimeformula]
(
	[salarystructure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_area_parent_area_id_39028fda]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_area_parent_area_id_39028fda] ON [dbo].[personnel_area]
(
	[parent_area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_assignareaemployee_area_id_6f049d6a]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_assignareaemployee_area_id_6f049d6a] ON [dbo].[personnel_assignareaemployee]
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_assignareaemployee_employee_id_a3d4dd25]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_assignareaemployee_employee_id_a3d4dd25] ON [dbo].[personnel_assignareaemployee]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_department_parent_dept_id_d0b44024]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_department_parent_dept_id_d0b44024] ON [dbo].[personnel_department]
(
	[parent_dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_employee_department_id_068bbd08]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_employee_department_id_068bbd08] ON [dbo].[personnel_employee]
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_employee_position_id_c9321343]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_employee_position_id_c9321343] ON [dbo].[personnel_employee]
(
	[position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_employee_area_area_id_64c21925]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_employee_area_area_id_64c21925] ON [dbo].[personnel_employee_area]
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_employee_area_employee_id_8e5cec21]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_employee_area_employee_id_8e5cec21] ON [dbo].[personnel_employee_area]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_employee_flow_role_employee_id_c27f8a56]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_employee_flow_role_employee_id_c27f8a56] ON [dbo].[personnel_employee_flow_role]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_employee_flow_role_workflowrole_id_4704db32]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_employee_flow_role_workflowrole_id_4704db32] ON [dbo].[personnel_employee_flow_role]
(
	[workflowrole_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_employeecertification_certification_id_faabed40]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_employeecertification_certification_id_faabed40] ON [dbo].[personnel_employeecertification]
(
	[certification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_employeecertification_employee_id_b7bd3867]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_employeecertification_employee_id_b7bd3867] ON [dbo].[personnel_employeecertification]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [personnel_position_parent_position_id_a496a36b]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [personnel_position_parent_position_id_a496a36b] ON [dbo].[personnel_position]
(
	[parent_position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_nodeinstance_approver_admin_id_dff58806]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_nodeinstance_approver_admin_id_dff58806] ON [dbo].[workflow_nodeinstance]
(
	[approver_admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_nodeinstance_approver_employee_id_d36cd45d]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_nodeinstance_approver_employee_id_d36cd45d] ON [dbo].[workflow_nodeinstance]
(
	[approver_employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_nodeinstance_departments_id_b0dc2bdb]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_nodeinstance_departments_id_b0dc2bdb] ON [dbo].[workflow_nodeinstance]
(
	[departments_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_nodeinstance_node_engine_id_4533f12d]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_nodeinstance_node_engine_id_4533f12d] ON [dbo].[workflow_nodeinstance]
(
	[node_engine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_nodeinstance_workflow_instance_id_afe84fe4]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_nodeinstance_workflow_instance_id_afe84fe4] ON [dbo].[workflow_nodeinstance]
(
	[workflow_instance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_workflowengine_applicant_position_id_8a65e03a]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_workflowengine_applicant_position_id_8a65e03a] ON [dbo].[workflow_workflowengine]
(
	[applicant_position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_workflowengine_content_type_id_f7345c20]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_workflowengine_content_type_id_f7345c20] ON [dbo].[workflow_workflowengine]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_workflowengine_departments_id_0f06d4c7]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_workflowengine_departments_id_0f06d4c7] ON [dbo].[workflow_workflowengine]
(
	[departments_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_workflowengine_employee_employee_id_803a409e]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_workflowengine_employee_employee_id_803a409e] ON [dbo].[workflow_workflowengine_employee]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_workflowengine_employee_workflowengine_id_6ebcc5f2]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_workflowengine_employee_workflowengine_id_6ebcc5f2] ON [dbo].[workflow_workflowengine_employee]
(
	[workflowengine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_workflowinstance_employee_id_c7cff08e]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_workflowinstance_employee_id_c7cff08e] ON [dbo].[workflow_workflowinstance]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_workflowinstance_workflow_engine_id_1e6ac40f]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_workflowinstance_workflow_engine_id_1e6ac40f] ON [dbo].[workflow_workflowinstance]
(
	[workflow_engine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_workflownode_approver_workflownode_id_d814c941]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_workflownode_approver_workflownode_id_d814c941] ON [dbo].[workflow_workflownode_approver]
(
	[workflownode_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_workflownode_approver_workflowrole_id_c8e00d42]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_workflownode_approver_workflowrole_id_c8e00d42] ON [dbo].[workflow_workflownode_approver]
(
	[workflowrole_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_workflownode_notifier_workflownode_id_57298016]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_workflownode_notifier_workflownode_id_57298016] ON [dbo].[workflow_workflownode_notifier]
(
	[workflownode_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [workflow_workflownode_notifier_workflowrole_id_73de7fc2]    Script Date: 3/11/2021 10:27:34 PM ******/
CREATE NONCLUSTERED INDEX [workflow_workflownode_notifier_workflowrole_id_73de7fc2] ON [dbo].[workflow_workflownode_notifier]
(
	[workflowrole_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[member_info] ADD  CONSTRAINT [DF_member_info_insert_date]  DEFAULT (getdate()) FOR [insert_date]
GO
ALTER TABLE [dbo].[acc_acccombination]  WITH CHECK ADD  CONSTRAINT [acc_acccombination_area_id_0d22c34e_fk_personnel_area_id] FOREIGN KEY([area_id])
REFERENCES [dbo].[personnel_area] ([id])
GO
ALTER TABLE [dbo].[acc_acccombination] CHECK CONSTRAINT [acc_acccombination_area_id_0d22c34e_fk_personnel_area_id]
GO
ALTER TABLE [dbo].[acc_accgroups]  WITH CHECK ADD  CONSTRAINT [acc_accgroups_area_id_b83745c3_fk_personnel_area_id] FOREIGN KEY([area_id])
REFERENCES [dbo].[personnel_area] ([id])
GO
ALTER TABLE [dbo].[acc_accgroups] CHECK CONSTRAINT [acc_accgroups_area_id_b83745c3_fk_personnel_area_id]
GO
ALTER TABLE [dbo].[acc_accholiday]  WITH CHECK ADD  CONSTRAINT [acc_accholiday_area_id_d15c19da_fk_personnel_area_id] FOREIGN KEY([area_id])
REFERENCES [dbo].[personnel_area] ([id])
GO
ALTER TABLE [dbo].[acc_accholiday] CHECK CONSTRAINT [acc_accholiday_area_id_d15c19da_fk_personnel_area_id]
GO
ALTER TABLE [dbo].[acc_accholiday]  WITH CHECK ADD  CONSTRAINT [acc_accholiday_holiday_id_a9efe924_fk_att_holiday_id] FOREIGN KEY([holiday_id])
REFERENCES [dbo].[att_holiday] ([id])
GO
ALTER TABLE [dbo].[acc_accholiday] CHECK CONSTRAINT [acc_accholiday_holiday_id_a9efe924_fk_att_holiday_id]
GO
ALTER TABLE [dbo].[acc_accholiday]  WITH CHECK ADD  CONSTRAINT [acc_accholiday_timezone_id_450d2d1e_fk_acc_acctimezone_id] FOREIGN KEY([timezone_id])
REFERENCES [dbo].[acc_acctimezone] ([id])
GO
ALTER TABLE [dbo].[acc_accholiday] CHECK CONSTRAINT [acc_accholiday_timezone_id_450d2d1e_fk_acc_acctimezone_id]
GO
ALTER TABLE [dbo].[acc_accprivilege]  WITH CHECK ADD  CONSTRAINT [acc_accprivilege_area_id_2123ff6f_fk_personnel_area_id] FOREIGN KEY([area_id])
REFERENCES [dbo].[personnel_area] ([id])
GO
ALTER TABLE [dbo].[acc_accprivilege] CHECK CONSTRAINT [acc_accprivilege_area_id_2123ff6f_fk_personnel_area_id]
GO
ALTER TABLE [dbo].[acc_accprivilege]  WITH CHECK ADD  CONSTRAINT [acc_accprivilege_employee_id_5fc55f95_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[acc_accprivilege] CHECK CONSTRAINT [acc_accprivilege_employee_id_5fc55f95_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[acc_accprivilege]  WITH CHECK ADD  CONSTRAINT [acc_accprivilege_group_id_c5ed7003_fk_acc_accgroups_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[acc_accgroups] ([id])
GO
ALTER TABLE [dbo].[acc_accprivilege] CHECK CONSTRAINT [acc_accprivilege_group_id_c5ed7003_fk_acc_accgroups_id]
GO
ALTER TABLE [dbo].[acc_accterminal]  WITH CHECK ADD  CONSTRAINT [acc_accterminal_terminal_id_fc92cce2_fk_iclock_terminal_id] FOREIGN KEY([terminal_id])
REFERENCES [dbo].[iclock_terminal] ([id])
GO
ALTER TABLE [dbo].[acc_accterminal] CHECK CONSTRAINT [acc_accterminal_terminal_id_fc92cce2_fk_iclock_terminal_id]
GO
ALTER TABLE [dbo].[acc_acctimezone]  WITH CHECK ADD  CONSTRAINT [acc_acctimezone_area_id_e9ce7a7a_fk_personnel_area_id] FOREIGN KEY([area_id])
REFERENCES [dbo].[personnel_area] ([id])
GO
ALTER TABLE [dbo].[acc_acctimezone] CHECK CONSTRAINT [acc_acctimezone_area_id_e9ce7a7a_fk_personnel_area_id]
GO
ALTER TABLE [dbo].[att_attschedule]  WITH CHECK ADD  CONSTRAINT [att_attschedule_employee_id_caa61686_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[att_attschedule] CHECK CONSTRAINT [att_attschedule_employee_id_caa61686_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[att_attschedule]  WITH CHECK ADD  CONSTRAINT [att_attschedule_shift_id_13d2db9a_fk_att_attshift_id] FOREIGN KEY([shift_id])
REFERENCES [dbo].[att_attshift] ([id])
GO
ALTER TABLE [dbo].[att_attschedule] CHECK CONSTRAINT [att_attschedule_shift_id_13d2db9a_fk_att_attshift_id]
GO
ALTER TABLE [dbo].[att_changeschedule]  WITH CHECK ADD  CONSTRAINT [att_changeschedule_abstractexception_ptr_id_6bf48cd8_fk_workflow_abstractexception_id] FOREIGN KEY([abstractexception_ptr_id])
REFERENCES [dbo].[workflow_abstractexception] ([id])
GO
ALTER TABLE [dbo].[att_changeschedule] CHECK CONSTRAINT [att_changeschedule_abstractexception_ptr_id_6bf48cd8_fk_workflow_abstractexception_id]
GO
ALTER TABLE [dbo].[att_changeschedule]  WITH CHECK ADD  CONSTRAINT [att_changeschedule_employee_id_7871a2b6_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[att_changeschedule] CHECK CONSTRAINT [att_changeschedule_employee_id_7871a2b6_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[att_changeschedule]  WITH CHECK ADD  CONSTRAINT [att_changeschedule_timeinterval_id_d41ac077_fk_att_timeinterval_id] FOREIGN KEY([timeinterval_id])
REFERENCES [dbo].[att_timeinterval] ([id])
GO
ALTER TABLE [dbo].[att_changeschedule] CHECK CONSTRAINT [att_changeschedule_timeinterval_id_d41ac077_fk_att_timeinterval_id]
GO
ALTER TABLE [dbo].[att_departmentschedule]  WITH CHECK ADD  CONSTRAINT [att_departmentschedule_department_id_c68fca3d_fk_personnel_department_id] FOREIGN KEY([department_id])
REFERENCES [dbo].[personnel_department] ([id])
GO
ALTER TABLE [dbo].[att_departmentschedule] CHECK CONSTRAINT [att_departmentschedule_department_id_c68fca3d_fk_personnel_department_id]
GO
ALTER TABLE [dbo].[att_departmentschedule]  WITH CHECK ADD  CONSTRAINT [att_departmentschedule_shift_id_c37d5ade_fk_att_attshift_id] FOREIGN KEY([shift_id])
REFERENCES [dbo].[att_attshift] ([id])
GO
ALTER TABLE [dbo].[att_departmentschedule] CHECK CONSTRAINT [att_departmentschedule_shift_id_c37d5ade_fk_att_attshift_id]
GO
ALTER TABLE [dbo].[att_deptattrule]  WITH CHECK ADD  CONSTRAINT [att_deptattrule_department_id_f333c8f0_fk_personnel_department_id] FOREIGN KEY([department_id])
REFERENCES [dbo].[personnel_department] ([id])
GO
ALTER TABLE [dbo].[att_deptattrule] CHECK CONSTRAINT [att_deptattrule_department_id_f333c8f0_fk_personnel_department_id]
GO
ALTER TABLE [dbo].[att_holiday]  WITH CHECK ADD  CONSTRAINT [att_holiday_department_id_fbbbd185_fk_personnel_department_id] FOREIGN KEY([department_id])
REFERENCES [dbo].[personnel_department] ([id])
GO
ALTER TABLE [dbo].[att_holiday] CHECK CONSTRAINT [att_holiday_department_id_fbbbd185_fk_personnel_department_id]
GO
ALTER TABLE [dbo].[att_leave]  WITH CHECK ADD  CONSTRAINT [att_leave_abstractexception_ptr_id_7d182abd_fk_workflow_abstractexception_id] FOREIGN KEY([abstractexception_ptr_id])
REFERENCES [dbo].[workflow_abstractexception] ([id])
GO
ALTER TABLE [dbo].[att_leave] CHECK CONSTRAINT [att_leave_abstractexception_ptr_id_7d182abd_fk_workflow_abstractexception_id]
GO
ALTER TABLE [dbo].[att_leave]  WITH CHECK ADD  CONSTRAINT [att_leave_category_id_bbba39ba_fk_att_leavecategory_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[att_leavecategory] ([id])
GO
ALTER TABLE [dbo].[att_leave] CHECK CONSTRAINT [att_leave_category_id_bbba39ba_fk_att_leavecategory_id]
GO
ALTER TABLE [dbo].[att_leave]  WITH CHECK ADD  CONSTRAINT [att_leave_employee_id_bb231627_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[att_leave] CHECK CONSTRAINT [att_leave_employee_id_bb231627_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[att_manuallog]  WITH CHECK ADD  CONSTRAINT [att_manuallog_abstractexception_ptr_id_f1e1b292_fk_workflow_abstractexception_id] FOREIGN KEY([abstractexception_ptr_id])
REFERENCES [dbo].[workflow_abstractexception] ([id])
GO
ALTER TABLE [dbo].[att_manuallog] CHECK CONSTRAINT [att_manuallog_abstractexception_ptr_id_f1e1b292_fk_workflow_abstractexception_id]
GO
ALTER TABLE [dbo].[att_manuallog]  WITH CHECK ADD  CONSTRAINT [att_manuallog_employee_id_dc8cc2ad_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[att_manuallog] CHECK CONSTRAINT [att_manuallog_employee_id_dc8cc2ad_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[att_overtime]  WITH CHECK ADD  CONSTRAINT [att_overtime_abstractexception_ptr_id_94834697_fk_workflow_abstractexception_id] FOREIGN KEY([abstractexception_ptr_id])
REFERENCES [dbo].[workflow_abstractexception] ([id])
GO
ALTER TABLE [dbo].[att_overtime] CHECK CONSTRAINT [att_overtime_abstractexception_ptr_id_94834697_fk_workflow_abstractexception_id]
GO
ALTER TABLE [dbo].[att_overtime]  WITH CHECK ADD  CONSTRAINT [att_overtime_employee_id_0c0d39dc_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[att_overtime] CHECK CONSTRAINT [att_overtime_employee_id_0c0d39dc_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[att_payloadbase]  WITH CHECK ADD  CONSTRAINT [att_payloadbase_emp_id_2c0f6a7b_fk_personnel_employee_id] FOREIGN KEY([emp_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[att_payloadbase] CHECK CONSTRAINT [att_payloadbase_emp_id_2c0f6a7b_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[att_payloadbase]  WITH CHECK ADD  CONSTRAINT [att_payloadbase_timetable_id_a389e3d8_fk_att_timeinterval_id] FOREIGN KEY([timetable_id])
REFERENCES [dbo].[att_timeinterval] ([id])
GO
ALTER TABLE [dbo].[att_payloadbase] CHECK CONSTRAINT [att_payloadbase_timetable_id_a389e3d8_fk_att_timeinterval_id]
GO
ALTER TABLE [dbo].[att_payloadexception]  WITH CHECK ADD  CONSTRAINT [att_payloadexception_item_id_a08bfe48_fk_att_leave_abstractexception_ptr_id] FOREIGN KEY([item_id])
REFERENCES [dbo].[att_leave] ([abstractexception_ptr_id])
GO
ALTER TABLE [dbo].[att_payloadexception] CHECK CONSTRAINT [att_payloadexception_item_id_a08bfe48_fk_att_leave_abstractexception_ptr_id]
GO
ALTER TABLE [dbo].[att_payloadmulpunchset]  WITH CHECK ADD  CONSTRAINT [att_payloadmulpunchset_emp_id_f47610c8_fk_personnel_employee_id] FOREIGN KEY([emp_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[att_payloadmulpunchset] CHECK CONSTRAINT [att_payloadmulpunchset_emp_id_f47610c8_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[att_payloadpunch]  WITH CHECK ADD  CONSTRAINT [att_payloadpunch_emp_id_053da2f0_fk_personnel_employee_id] FOREIGN KEY([emp_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[att_payloadpunch] CHECK CONSTRAINT [att_payloadpunch_emp_id_053da2f0_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[att_payloadpunch]  WITH CHECK ADD  CONSTRAINT [att_payloadpunch_orig_id_16b26416_fk_iclock_transaction_id] FOREIGN KEY([orig_id])
REFERENCES [dbo].[iclock_transaction] ([id])
GO
ALTER TABLE [dbo].[att_payloadpunch] CHECK CONSTRAINT [att_payloadpunch_orig_id_16b26416_fk_iclock_transaction_id]
GO
ALTER TABLE [dbo].[att_shiftdetail]  WITH CHECK ADD  CONSTRAINT [att_shiftdetail_shift_id_7d694501_fk_att_attshift_id] FOREIGN KEY([shift_id])
REFERENCES [dbo].[att_attshift] ([id])
GO
ALTER TABLE [dbo].[att_shiftdetail] CHECK CONSTRAINT [att_shiftdetail_shift_id_7d694501_fk_att_attshift_id]
GO
ALTER TABLE [dbo].[att_shiftdetail]  WITH CHECK ADD  CONSTRAINT [att_shiftdetail_time_interval_id_777dde8f_fk_att_timeinterval_id] FOREIGN KEY([time_interval_id])
REFERENCES [dbo].[att_timeinterval] ([id])
GO
ALTER TABLE [dbo].[att_shiftdetail] CHECK CONSTRAINT [att_shiftdetail_time_interval_id_777dde8f_fk_att_timeinterval_id]
GO
ALTER TABLE [dbo].[att_tempschedule]  WITH CHECK ADD  CONSTRAINT [att_tempschedule_employee_id_b89c7e54_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[att_tempschedule] CHECK CONSTRAINT [att_tempschedule_employee_id_b89c7e54_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[att_timeinterval_break_time]  WITH CHECK ADD  CONSTRAINT [att_timeinterval_break_time_breaktime_id_08462308_fk_att_breaktime_id] FOREIGN KEY([breaktime_id])
REFERENCES [dbo].[att_breaktime] ([id])
GO
ALTER TABLE [dbo].[att_timeinterval_break_time] CHECK CONSTRAINT [att_timeinterval_break_time_breaktime_id_08462308_fk_att_breaktime_id]
GO
ALTER TABLE [dbo].[att_timeinterval_break_time]  WITH CHECK ADD  CONSTRAINT [att_timeinterval_break_time_timeinterval_id_2287017e_fk_att_timeinterval_id] FOREIGN KEY([timeinterval_id])
REFERENCES [dbo].[att_timeinterval] ([id])
GO
ALTER TABLE [dbo].[att_timeinterval_break_time] CHECK CONSTRAINT [att_timeinterval_break_time_timeinterval_id_2287017e_fk_att_timeinterval_id]
GO
ALTER TABLE [dbo].[att_training]  WITH CHECK ADD  CONSTRAINT [att_training_abstractexception_ptr_id_60a3e8f3_fk_workflow_abstractexception_id] FOREIGN KEY([abstractexception_ptr_id])
REFERENCES [dbo].[workflow_abstractexception] ([id])
GO
ALTER TABLE [dbo].[att_training] CHECK CONSTRAINT [att_training_abstractexception_ptr_id_60a3e8f3_fk_workflow_abstractexception_id]
GO
ALTER TABLE [dbo].[att_training]  WITH CHECK ADD  CONSTRAINT [att_training_category_id_fb38e891_fk_att_trainingcategory_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[att_trainingcategory] ([id])
GO
ALTER TABLE [dbo].[att_training] CHECK CONSTRAINT [att_training_category_id_fb38e891_fk_att_trainingcategory_id]
GO
ALTER TABLE [dbo].[att_training]  WITH CHECK ADD  CONSTRAINT [att_training_employee_id_44af8319_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[att_training] CHECK CONSTRAINT [att_training_employee_id_44af8319_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[auth_user_auth_area]  WITH CHECK ADD  CONSTRAINT [auth_user_auth_area_area_id_d1e54c70_fk_personnel_area_id] FOREIGN KEY([area_id])
REFERENCES [dbo].[personnel_area] ([id])
GO
ALTER TABLE [dbo].[auth_user_auth_area] CHECK CONSTRAINT [auth_user_auth_area_area_id_d1e54c70_fk_personnel_area_id]
GO
ALTER TABLE [dbo].[auth_user_auth_area]  WITH CHECK ADD  CONSTRAINT [auth_user_auth_area_myuser_id_5fb9a803_fk_auth_user_id] FOREIGN KEY([myuser_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_auth_area] CHECK CONSTRAINT [auth_user_auth_area_myuser_id_5fb9a803_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_auth_dept]  WITH CHECK ADD  CONSTRAINT [auth_user_auth_dept_department_id_5866c514_fk_personnel_department_id] FOREIGN KEY([department_id])
REFERENCES [dbo].[personnel_department] ([id])
GO
ALTER TABLE [dbo].[auth_user_auth_dept] CHECK CONSTRAINT [auth_user_auth_dept_department_id_5866c514_fk_personnel_department_id]
GO
ALTER TABLE [dbo].[auth_user_auth_dept]  WITH CHECK ADD  CONSTRAINT [auth_user_auth_dept_myuser_id_18a51b27_fk_auth_user_id] FOREIGN KEY([myuser_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_auth_dept] CHECK CONSTRAINT [auth_user_auth_dept_myuser_id_18a51b27_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_myuser_id_d03e8dcc_fk_auth_user_id] FOREIGN KEY([myuser_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_myuser_id_d03e8dcc_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_profile]  WITH CHECK ADD  CONSTRAINT [auth_user_profile_user_id_f9aded29_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_profile] CHECK CONSTRAINT [auth_user_profile_user_id_f9aded29_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_myuser_id_679b1527_fk_auth_user_id] FOREIGN KEY([myuser_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_myuser_id_679b1527_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[authtoken_token]  WITH CHECK ADD  CONSTRAINT [authtoken_token_user_id_35299eff_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[authtoken_token] CHECK CONSTRAINT [authtoken_token_user_id_35299eff_fk_auth_user_id]
GO
ALTER TABLE [dbo].[base_adminlog]  WITH CHECK ADD  CONSTRAINT [base_adminlog_content_type_id_3e553c30_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[base_adminlog] CHECK CONSTRAINT [base_adminlog_content_type_id_3e553c30_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[base_adminlog]  WITH CHECK ADD  CONSTRAINT [base_adminlog_user_id_ecf659f8_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[base_adminlog] CHECK CONSTRAINT [base_adminlog_user_id_ecf659f8_fk_auth_user_id]
GO
ALTER TABLE [dbo].[base_bookmark]  WITH CHECK ADD  CONSTRAINT [base_bookmark_content_type_id_b6a0e799_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[base_bookmark] CHECK CONSTRAINT [base_bookmark_content_type_id_b6a0e799_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[base_bookmark]  WITH CHECK ADD  CONSTRAINT [base_bookmark_user_id_5f2d5ca2_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[base_bookmark] CHECK CONSTRAINT [base_bookmark_user_id_5f2d5ca2_fk_auth_user_id]
GO
ALTER TABLE [dbo].[base_linenotifysetting]  WITH CHECK ADD  CONSTRAINT [base_linenotifysetting_line_notify_dept_id_0643a5ed_fk_personnel_department_id] FOREIGN KEY([line_notify_dept_id])
REFERENCES [dbo].[personnel_department] ([id])
GO
ALTER TABLE [dbo].[base_linenotifysetting] CHECK CONSTRAINT [base_linenotifysetting_line_notify_dept_id_0643a5ed_fk_personnel_department_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id]
GO
ALTER TABLE [dbo].[djcelery_periodictask]  WITH CHECK ADD  CONSTRAINT [djcelery_periodictask_crontab_id_75609bab_fk_djcelery_crontabschedule_id] FOREIGN KEY([crontab_id])
REFERENCES [dbo].[djcelery_crontabschedule] ([id])
GO
ALTER TABLE [dbo].[djcelery_periodictask] CHECK CONSTRAINT [djcelery_periodictask_crontab_id_75609bab_fk_djcelery_crontabschedule_id]
GO
ALTER TABLE [dbo].[djcelery_periodictask]  WITH CHECK ADD  CONSTRAINT [djcelery_periodictask_interval_id_b426ab02_fk_djcelery_intervalschedule_id] FOREIGN KEY([interval_id])
REFERENCES [dbo].[djcelery_intervalschedule] ([id])
GO
ALTER TABLE [dbo].[djcelery_periodictask] CHECK CONSTRAINT [djcelery_periodictask_interval_id_b426ab02_fk_djcelery_intervalschedule_id]
GO
ALTER TABLE [dbo].[djcelery_taskstate]  WITH CHECK ADD  CONSTRAINT [djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id] FOREIGN KEY([worker_id])
REFERENCES [dbo].[djcelery_workerstate] ([id])
GO
ALTER TABLE [dbo].[djcelery_taskstate] CHECK CONSTRAINT [djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id]
GO
ALTER TABLE [dbo].[guardian_groupobjectpermission]  WITH CHECK ADD  CONSTRAINT [guardian_groupobjectpermission_content_type_id_7ade36b8_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[guardian_groupobjectpermission] CHECK CONSTRAINT [guardian_groupobjectpermission_content_type_id_7ade36b8_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[guardian_groupobjectpermission]  WITH CHECK ADD  CONSTRAINT [guardian_groupobjectpermission_group_id_4bbbfb62_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[guardian_groupobjectpermission] CHECK CONSTRAINT [guardian_groupobjectpermission_group_id_4bbbfb62_fk_auth_group_id]
GO
ALTER TABLE [dbo].[guardian_groupobjectpermission]  WITH CHECK ADD  CONSTRAINT [guardian_groupobjectpermission_permission_id_36572738_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[guardian_groupobjectpermission] CHECK CONSTRAINT [guardian_groupobjectpermission_permission_id_36572738_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[guardian_userobjectpermission]  WITH CHECK ADD  CONSTRAINT [guardian_userobjectpermission_content_type_id_2e892405_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[guardian_userobjectpermission] CHECK CONSTRAINT [guardian_userobjectpermission_content_type_id_2e892405_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[guardian_userobjectpermission]  WITH CHECK ADD  CONSTRAINT [guardian_userobjectpermission_permission_id_71807bfc_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[guardian_userobjectpermission] CHECK CONSTRAINT [guardian_userobjectpermission_permission_id_71807bfc_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[guardian_userobjectpermission]  WITH CHECK ADD  CONSTRAINT [guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[guardian_userobjectpermission] CHECK CONSTRAINT [guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id]
GO
ALTER TABLE [dbo].[iclock_biodata]  WITH CHECK ADD  CONSTRAINT [iclock_biodata_employee_id_ff748ea7_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[iclock_biodata] CHECK CONSTRAINT [iclock_biodata_employee_id_ff748ea7_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[iclock_biophoto]  WITH CHECK ADD  CONSTRAINT [iclock_biophoto_employee_id_3dba5819_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[iclock_biophoto] CHECK CONSTRAINT [iclock_biophoto_employee_id_3dba5819_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[iclock_errorcommandlog]  WITH CHECK ADD  CONSTRAINT [iclock_errorcommandlog_terminal_id_3b2d7cbd_fk_iclock_terminal_id] FOREIGN KEY([terminal_id])
REFERENCES [dbo].[iclock_terminal] ([id])
GO
ALTER TABLE [dbo].[iclock_errorcommandlog] CHECK CONSTRAINT [iclock_errorcommandlog_terminal_id_3b2d7cbd_fk_iclock_terminal_id]
GO
ALTER TABLE [dbo].[iclock_privatemessage]  WITH CHECK ADD  CONSTRAINT [iclock_privatemessage_employee_id_e84a34c0_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[iclock_privatemessage] CHECK CONSTRAINT [iclock_privatemessage_employee_id_e84a34c0_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[iclock_publicmessage]  WITH CHECK ADD  CONSTRAINT [iclock_publicmessage_terminal_id_c3b5e4cf_fk_iclock_terminal_id] FOREIGN KEY([terminal_id])
REFERENCES [dbo].[iclock_terminal] ([id])
GO
ALTER TABLE [dbo].[iclock_publicmessage] CHECK CONSTRAINT [iclock_publicmessage_terminal_id_c3b5e4cf_fk_iclock_terminal_id]
GO
ALTER TABLE [dbo].[iclock_terminal]  WITH CHECK ADD  CONSTRAINT [iclock_terminal_area_id_c019c6f0_fk_personnel_area_id] FOREIGN KEY([area_id])
REFERENCES [dbo].[personnel_area] ([id])
GO
ALTER TABLE [dbo].[iclock_terminal] CHECK CONSTRAINT [iclock_terminal_area_id_c019c6f0_fk_personnel_area_id]
GO
ALTER TABLE [dbo].[iclock_terminalcommand]  WITH CHECK ADD  CONSTRAINT [iclock_terminalcommand_terminal_id_3dcf836f_fk_iclock_terminal_id] FOREIGN KEY([terminal_id])
REFERENCES [dbo].[iclock_terminal] ([id])
GO
ALTER TABLE [dbo].[iclock_terminalcommand] CHECK CONSTRAINT [iclock_terminalcommand_terminal_id_3dcf836f_fk_iclock_terminal_id]
GO
ALTER TABLE [dbo].[iclock_terminallog]  WITH CHECK ADD  CONSTRAINT [iclock_terminallog_terminal_id_667b3ea7_fk_iclock_terminal_id] FOREIGN KEY([terminal_id])
REFERENCES [dbo].[iclock_terminal] ([id])
GO
ALTER TABLE [dbo].[iclock_terminallog] CHECK CONSTRAINT [iclock_terminallog_terminal_id_667b3ea7_fk_iclock_terminal_id]
GO
ALTER TABLE [dbo].[iclock_terminalparameter]  WITH CHECK ADD  CONSTRAINT [iclock_terminalparameter_terminal_id_443872e3_fk_iclock_terminal_id] FOREIGN KEY([terminal_id])
REFERENCES [dbo].[iclock_terminal] ([id])
GO
ALTER TABLE [dbo].[iclock_terminalparameter] CHECK CONSTRAINT [iclock_terminalparameter_terminal_id_443872e3_fk_iclock_terminal_id]
GO
ALTER TABLE [dbo].[iclock_terminaluploadlog]  WITH CHECK ADD  CONSTRAINT [iclock_terminaluploadlog_terminal_id_9c9a7664_fk_iclock_terminal_id] FOREIGN KEY([terminal_id])
REFERENCES [dbo].[iclock_terminal] ([id])
GO
ALTER TABLE [dbo].[iclock_terminaluploadlog] CHECK CONSTRAINT [iclock_terminaluploadlog_terminal_id_9c9a7664_fk_iclock_terminal_id]
GO
ALTER TABLE [dbo].[iclock_transaction]  WITH CHECK ADD  CONSTRAINT [iclock_transaction_emp_id_60fa3521_fk_personnel_employee_id] FOREIGN KEY([emp_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[iclock_transaction] CHECK CONSTRAINT [iclock_transaction_emp_id_60fa3521_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[iclock_transaction]  WITH CHECK ADD  CONSTRAINT [iclock_transaction_terminal_id_451c81c2_fk_iclock_terminal_id] FOREIGN KEY([terminal_id])
REFERENCES [dbo].[iclock_terminal] ([id])
GO
ALTER TABLE [dbo].[iclock_transaction] CHECK CONSTRAINT [iclock_transaction_terminal_id_451c81c2_fk_iclock_terminal_id]
GO
ALTER TABLE [dbo].[iclock_transactionproofcmd]  WITH CHECK ADD  CONSTRAINT [iclock_transactionproofcmd_terminal_id_08b81e1e_fk_iclock_terminal_id] FOREIGN KEY([terminal_id])
REFERENCES [dbo].[iclock_terminal] ([id])
GO
ALTER TABLE [dbo].[iclock_transactionproofcmd] CHECK CONSTRAINT [iclock_transactionproofcmd_terminal_id_08b81e1e_fk_iclock_terminal_id]
GO
ALTER TABLE [dbo].[mobile_announcement]  WITH CHECK ADD  CONSTRAINT [mobile_announcement_receiver_id_ddf2a860_fk_personnel_employee_id] FOREIGN KEY([receiver_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[mobile_announcement] CHECK CONSTRAINT [mobile_announcement_receiver_id_ddf2a860_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[mobile_appnotification]  WITH CHECK ADD  CONSTRAINT [mobile_appnotification_receiver_id_90c4a355_fk_personnel_employee_id] FOREIGN KEY([receiver_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[mobile_appnotification] CHECK CONSTRAINT [mobile_appnotification_receiver_id_90c4a355_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[mobile_gpsfordepartment]  WITH CHECK ADD  CONSTRAINT [mobile_gpsfordepartment_department_id_988ccf22_fk_personnel_department_id] FOREIGN KEY([department_id])
REFERENCES [dbo].[personnel_department] ([id])
GO
ALTER TABLE [dbo].[mobile_gpsfordepartment] CHECK CONSTRAINT [mobile_gpsfordepartment_department_id_988ccf22_fk_personnel_department_id]
GO
ALTER TABLE [dbo].[mobile_gpsforemployee]  WITH CHECK ADD  CONSTRAINT [mobile_gpsforemployee_employee_id_982b7cef_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[mobile_gpsforemployee] CHECK CONSTRAINT [mobile_gpsforemployee_employee_id_982b7cef_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[payroll_emploan]  WITH CHECK ADD  CONSTRAINT [payroll_emploan_employee_id_97a251ef_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[payroll_emploan] CHECK CONSTRAINT [payroll_emploan_employee_id_97a251ef_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[payroll_emppayrollprofile]  WITH CHECK ADD  CONSTRAINT [payroll_emppayrollprofile_employee_id_6c97078c_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[payroll_emppayrollprofile] CHECK CONSTRAINT [payroll_emppayrollprofile_employee_id_6c97078c_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[payroll_extradeduction]  WITH CHECK ADD  CONSTRAINT [payroll_extradeduction_employee_id_53072441_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[payroll_extradeduction] CHECK CONSTRAINT [payroll_extradeduction_employee_id_53072441_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[payroll_extraincrease]  WITH CHECK ADD  CONSTRAINT [payroll_extraincrease_employee_id_f902e6bb_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[payroll_extraincrease] CHECK CONSTRAINT [payroll_extraincrease_employee_id_f902e6bb_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[payroll_leaveformula]  WITH CHECK ADD  CONSTRAINT [payroll_leaveformula_category_id_945b2054_fk_att_leavecategory_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[att_leavecategory] ([id])
GO
ALTER TABLE [dbo].[payroll_leaveformula] CHECK CONSTRAINT [payroll_leaveformula_category_id_945b2054_fk_att_leavecategory_id]
GO
ALTER TABLE [dbo].[payroll_monthlysalary]  WITH CHECK ADD  CONSTRAINT [payroll_monthlysalary_employee_id_97fdc6a9_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[payroll_monthlysalary] CHECK CONSTRAINT [payroll_monthlysalary_employee_id_97fdc6a9_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[payroll_reimbursement]  WITH CHECK ADD  CONSTRAINT [payroll_reimbursement_employee_id_c4bbde36_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[payroll_reimbursement] CHECK CONSTRAINT [payroll_reimbursement_employee_id_c4bbde36_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[payroll_salaryadvance]  WITH CHECK ADD  CONSTRAINT [payroll_salaryadvance_employee_id_2abd43e5_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[payroll_salaryadvance] CHECK CONSTRAINT [payroll_salaryadvance_employee_id_2abd43e5_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[payroll_salarystructure]  WITH CHECK ADD  CONSTRAINT [payroll_salarystructure_employee_id_98996e15_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[payroll_salarystructure] CHECK CONSTRAINT [payroll_salarystructure_employee_id_98996e15_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[payroll_salarystructure_deductionformula]  WITH CHECK ADD  CONSTRAINT [payroll_salarystructure_deductionformula_deductionformula_id_b174d5b6_fk_payroll_deductionformula_id] FOREIGN KEY([deductionformula_id])
REFERENCES [dbo].[payroll_deductionformula] ([id])
GO
ALTER TABLE [dbo].[payroll_salarystructure_deductionformula] CHECK CONSTRAINT [payroll_salarystructure_deductionformula_deductionformula_id_b174d5b6_fk_payroll_deductionformula_id]
GO
ALTER TABLE [dbo].[payroll_salarystructure_deductionformula]  WITH CHECK ADD  CONSTRAINT [payroll_salarystructure_deductionformula_salarystructure_id_5ca7cdb5_fk_payroll_salarystructure_id] FOREIGN KEY([salarystructure_id])
REFERENCES [dbo].[payroll_salarystructure] ([id])
GO
ALTER TABLE [dbo].[payroll_salarystructure_deductionformula] CHECK CONSTRAINT [payroll_salarystructure_deductionformula_salarystructure_id_5ca7cdb5_fk_payroll_salarystructure_id]
GO
ALTER TABLE [dbo].[payroll_salarystructure_exceptionformula]  WITH CHECK ADD  CONSTRAINT [payroll_salarystructure_exceptionformula_exceptionformula_id_8f6dadb3_fk_payroll_exceptionformula_id] FOREIGN KEY([exceptionformula_id])
REFERENCES [dbo].[payroll_exceptionformula] ([id])
GO
ALTER TABLE [dbo].[payroll_salarystructure_exceptionformula] CHECK CONSTRAINT [payroll_salarystructure_exceptionformula_exceptionformula_id_8f6dadb3_fk_payroll_exceptionformula_id]
GO
ALTER TABLE [dbo].[payroll_salarystructure_exceptionformula]  WITH CHECK ADD  CONSTRAINT [payroll_salarystructure_exceptionformula_salarystructure_id_3c087208_fk_payroll_salarystructure_id] FOREIGN KEY([salarystructure_id])
REFERENCES [dbo].[payroll_salarystructure] ([id])
GO
ALTER TABLE [dbo].[payroll_salarystructure_exceptionformula] CHECK CONSTRAINT [payroll_salarystructure_exceptionformula_salarystructure_id_3c087208_fk_payroll_salarystructure_id]
GO
ALTER TABLE [dbo].[payroll_salarystructure_increasementformula]  WITH CHECK ADD  CONSTRAINT [payroll_salarystructure_increasementformula_increasementformula_id_3cd77082_fk_payroll_increasementformula_id] FOREIGN KEY([increasementformula_id])
REFERENCES [dbo].[payroll_increasementformula] ([id])
GO
ALTER TABLE [dbo].[payroll_salarystructure_increasementformula] CHECK CONSTRAINT [payroll_salarystructure_increasementformula_increasementformula_id_3cd77082_fk_payroll_increasementformula_id]
GO
ALTER TABLE [dbo].[payroll_salarystructure_increasementformula]  WITH CHECK ADD  CONSTRAINT [payroll_salarystructure_increasementformula_salarystructure_id_8752401c_fk_payroll_salarystructure_id] FOREIGN KEY([salarystructure_id])
REFERENCES [dbo].[payroll_salarystructure] ([id])
GO
ALTER TABLE [dbo].[payroll_salarystructure_increasementformula] CHECK CONSTRAINT [payroll_salarystructure_increasementformula_salarystructure_id_8752401c_fk_payroll_salarystructure_id]
GO
ALTER TABLE [dbo].[payroll_salarystructure_leaveformula]  WITH CHECK ADD  CONSTRAINT [payroll_salarystructure_leaveformula_leaveformula_id_049f9024_fk_payroll_leaveformula_id] FOREIGN KEY([leaveformula_id])
REFERENCES [dbo].[payroll_leaveformula] ([id])
GO
ALTER TABLE [dbo].[payroll_salarystructure_leaveformula] CHECK CONSTRAINT [payroll_salarystructure_leaveformula_leaveformula_id_049f9024_fk_payroll_leaveformula_id]
GO
ALTER TABLE [dbo].[payroll_salarystructure_leaveformula]  WITH CHECK ADD  CONSTRAINT [payroll_salarystructure_leaveformula_salarystructure_id_cf98fdd7_fk_payroll_salarystructure_id] FOREIGN KEY([salarystructure_id])
REFERENCES [dbo].[payroll_salarystructure] ([id])
GO
ALTER TABLE [dbo].[payroll_salarystructure_leaveformula] CHECK CONSTRAINT [payroll_salarystructure_leaveformula_salarystructure_id_cf98fdd7_fk_payroll_salarystructure_id]
GO
ALTER TABLE [dbo].[payroll_salarystructure_overtimeformula]  WITH CHECK ADD  CONSTRAINT [payroll_salarystructure_overtimeformula_overtimeformula_id_40ad89ef_fk_payroll_overtimeformula_id] FOREIGN KEY([overtimeformula_id])
REFERENCES [dbo].[payroll_overtimeformula] ([id])
GO
ALTER TABLE [dbo].[payroll_salarystructure_overtimeformula] CHECK CONSTRAINT [payroll_salarystructure_overtimeformula_overtimeformula_id_40ad89ef_fk_payroll_overtimeformula_id]
GO
ALTER TABLE [dbo].[payroll_salarystructure_overtimeformula]  WITH CHECK ADD  CONSTRAINT [payroll_salarystructure_overtimeformula_salarystructure_id_64f75042_fk_payroll_salarystructure_id] FOREIGN KEY([salarystructure_id])
REFERENCES [dbo].[payroll_salarystructure] ([id])
GO
ALTER TABLE [dbo].[payroll_salarystructure_overtimeformula] CHECK CONSTRAINT [payroll_salarystructure_overtimeformula_salarystructure_id_64f75042_fk_payroll_salarystructure_id]
GO
ALTER TABLE [dbo].[personnel_area]  WITH CHECK ADD  CONSTRAINT [personnel_area_parent_area_id_39028fda_fk_personnel_area_id] FOREIGN KEY([parent_area_id])
REFERENCES [dbo].[personnel_area] ([id])
GO
ALTER TABLE [dbo].[personnel_area] CHECK CONSTRAINT [personnel_area_parent_area_id_39028fda_fk_personnel_area_id]
GO
ALTER TABLE [dbo].[personnel_assignareaemployee]  WITH CHECK ADD  CONSTRAINT [personnel_assignareaemployee_area_id_6f049d6a_fk_personnel_area_id] FOREIGN KEY([area_id])
REFERENCES [dbo].[personnel_area] ([id])
GO
ALTER TABLE [dbo].[personnel_assignareaemployee] CHECK CONSTRAINT [personnel_assignareaemployee_area_id_6f049d6a_fk_personnel_area_id]
GO
ALTER TABLE [dbo].[personnel_assignareaemployee]  WITH CHECK ADD  CONSTRAINT [personnel_assignareaemployee_employee_id_a3d4dd25_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[personnel_assignareaemployee] CHECK CONSTRAINT [personnel_assignareaemployee_employee_id_a3d4dd25_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[personnel_department]  WITH CHECK ADD  CONSTRAINT [personnel_department_parent_dept_id_d0b44024_fk_personnel_department_id] FOREIGN KEY([parent_dept_id])
REFERENCES [dbo].[personnel_department] ([id])
GO
ALTER TABLE [dbo].[personnel_department] CHECK CONSTRAINT [personnel_department_parent_dept_id_d0b44024_fk_personnel_department_id]
GO
ALTER TABLE [dbo].[personnel_employee]  WITH CHECK ADD  CONSTRAINT [personnel_employee_department_id_068bbd08_fk_personnel_department_id] FOREIGN KEY([department_id])
REFERENCES [dbo].[personnel_department] ([id])
GO
ALTER TABLE [dbo].[personnel_employee] CHECK CONSTRAINT [personnel_employee_department_id_068bbd08_fk_personnel_department_id]
GO
ALTER TABLE [dbo].[personnel_employee]  WITH CHECK ADD  CONSTRAINT [personnel_employee_position_id_c9321343_fk_personnel_position_id] FOREIGN KEY([position_id])
REFERENCES [dbo].[personnel_position] ([id])
GO
ALTER TABLE [dbo].[personnel_employee] CHECK CONSTRAINT [personnel_employee_position_id_c9321343_fk_personnel_position_id]
GO
ALTER TABLE [dbo].[personnel_employee_area]  WITH CHECK ADD  CONSTRAINT [personnel_employee_area_area_id_64c21925_fk_personnel_area_id] FOREIGN KEY([area_id])
REFERENCES [dbo].[personnel_area] ([id])
GO
ALTER TABLE [dbo].[personnel_employee_area] CHECK CONSTRAINT [personnel_employee_area_area_id_64c21925_fk_personnel_area_id]
GO
ALTER TABLE [dbo].[personnel_employee_area]  WITH CHECK ADD  CONSTRAINT [personnel_employee_area_employee_id_8e5cec21_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[personnel_employee_area] CHECK CONSTRAINT [personnel_employee_area_employee_id_8e5cec21_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[personnel_employee_flow_role]  WITH CHECK ADD  CONSTRAINT [personnel_employee_flow_role_employee_id_c27f8a56_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[personnel_employee_flow_role] CHECK CONSTRAINT [personnel_employee_flow_role_employee_id_c27f8a56_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[personnel_employee_flow_role]  WITH CHECK ADD  CONSTRAINT [personnel_employee_flow_role_workflowrole_id_4704db32_fk_workflow_workflowrole_id] FOREIGN KEY([workflowrole_id])
REFERENCES [dbo].[workflow_workflowrole] ([id])
GO
ALTER TABLE [dbo].[personnel_employee_flow_role] CHECK CONSTRAINT [personnel_employee_flow_role_workflowrole_id_4704db32_fk_workflow_workflowrole_id]
GO
ALTER TABLE [dbo].[personnel_employeecertification]  WITH CHECK ADD  CONSTRAINT [personnel_employeecertification_certification_id_faabed40_fk_personnel_certification_id] FOREIGN KEY([certification_id])
REFERENCES [dbo].[personnel_certification] ([id])
GO
ALTER TABLE [dbo].[personnel_employeecertification] CHECK CONSTRAINT [personnel_employeecertification_certification_id_faabed40_fk_personnel_certification_id]
GO
ALTER TABLE [dbo].[personnel_employeecertification]  WITH CHECK ADD  CONSTRAINT [personnel_employeecertification_employee_id_b7bd3867_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[personnel_employeecertification] CHECK CONSTRAINT [personnel_employeecertification_employee_id_b7bd3867_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[personnel_employeeprofile]  WITH CHECK ADD  CONSTRAINT [personnel_employeeprofile_emp_id_3a69c313_fk_personnel_employee_id] FOREIGN KEY([emp_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[personnel_employeeprofile] CHECK CONSTRAINT [personnel_employeeprofile_emp_id_3a69c313_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[personnel_position]  WITH CHECK ADD  CONSTRAINT [personnel_position_parent_position_id_a496a36b_fk_personnel_position_id] FOREIGN KEY([parent_position_id])
REFERENCES [dbo].[personnel_position] ([id])
GO
ALTER TABLE [dbo].[personnel_position] CHECK CONSTRAINT [personnel_position_parent_position_id_a496a36b_fk_personnel_position_id]
GO
ALTER TABLE [dbo].[personnel_resign]  WITH CHECK ADD  CONSTRAINT [personnel_resign_employee_id_dd9b7e08_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[personnel_resign] CHECK CONSTRAINT [personnel_resign_employee_id_dd9b7e08_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[staff_stafftoken]  WITH CHECK ADD  CONSTRAINT [staff_stafftoken_user_id_39c937fa_fk_personnel_employee_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[staff_stafftoken] CHECK CONSTRAINT [staff_stafftoken_user_id_39c937fa_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[workflow_nodeinstance]  WITH CHECK ADD  CONSTRAINT [workflow_nodeinstance_approver_admin_id_dff58806_fk_auth_user_id] FOREIGN KEY([approver_admin_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[workflow_nodeinstance] CHECK CONSTRAINT [workflow_nodeinstance_approver_admin_id_dff58806_fk_auth_user_id]
GO
ALTER TABLE [dbo].[workflow_nodeinstance]  WITH CHECK ADD  CONSTRAINT [workflow_nodeinstance_approver_employee_id_d36cd45d_fk_personnel_employee_id] FOREIGN KEY([approver_employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[workflow_nodeinstance] CHECK CONSTRAINT [workflow_nodeinstance_approver_employee_id_d36cd45d_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[workflow_nodeinstance]  WITH CHECK ADD  CONSTRAINT [workflow_nodeinstance_departments_id_b0dc2bdb_fk_personnel_department_id] FOREIGN KEY([departments_id])
REFERENCES [dbo].[personnel_department] ([id])
GO
ALTER TABLE [dbo].[workflow_nodeinstance] CHECK CONSTRAINT [workflow_nodeinstance_departments_id_b0dc2bdb_fk_personnel_department_id]
GO
ALTER TABLE [dbo].[workflow_nodeinstance]  WITH CHECK ADD  CONSTRAINT [workflow_nodeinstance_node_engine_id_4533f12d_fk_workflow_workflownode_id] FOREIGN KEY([node_engine_id])
REFERENCES [dbo].[workflow_workflownode] ([id])
GO
ALTER TABLE [dbo].[workflow_nodeinstance] CHECK CONSTRAINT [workflow_nodeinstance_node_engine_id_4533f12d_fk_workflow_workflownode_id]
GO
ALTER TABLE [dbo].[workflow_nodeinstance]  WITH CHECK ADD  CONSTRAINT [workflow_nodeinstance_workflow_instance_id_afe84fe4_fk_workflow_workflowinstance_id] FOREIGN KEY([workflow_instance_id])
REFERENCES [dbo].[workflow_workflowinstance] ([id])
GO
ALTER TABLE [dbo].[workflow_nodeinstance] CHECK CONSTRAINT [workflow_nodeinstance_workflow_instance_id_afe84fe4_fk_workflow_workflowinstance_id]
GO
ALTER TABLE [dbo].[workflow_workflowengine]  WITH CHECK ADD  CONSTRAINT [workflow_workflowengine_applicant_position_id_8a65e03a_fk_personnel_position_id] FOREIGN KEY([applicant_position_id])
REFERENCES [dbo].[personnel_position] ([id])
GO
ALTER TABLE [dbo].[workflow_workflowengine] CHECK CONSTRAINT [workflow_workflowengine_applicant_position_id_8a65e03a_fk_personnel_position_id]
GO
ALTER TABLE [dbo].[workflow_workflowengine]  WITH CHECK ADD  CONSTRAINT [workflow_workflowengine_content_type_id_f7345c20_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[workflow_workflowengine] CHECK CONSTRAINT [workflow_workflowengine_content_type_id_f7345c20_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[workflow_workflowengine]  WITH CHECK ADD  CONSTRAINT [workflow_workflowengine_departments_id_0f06d4c7_fk_personnel_department_id] FOREIGN KEY([departments_id])
REFERENCES [dbo].[personnel_department] ([id])
GO
ALTER TABLE [dbo].[workflow_workflowengine] CHECK CONSTRAINT [workflow_workflowengine_departments_id_0f06d4c7_fk_personnel_department_id]
GO
ALTER TABLE [dbo].[workflow_workflowengine_employee]  WITH CHECK ADD  CONSTRAINT [workflow_workflowengine_employee_employee_id_803a409e_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[workflow_workflowengine_employee] CHECK CONSTRAINT [workflow_workflowengine_employee_employee_id_803a409e_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[workflow_workflowengine_employee]  WITH CHECK ADD  CONSTRAINT [workflow_workflowengine_employee_workflowengine_id_6ebcc5f2_fk_workflow_workflowengine_id] FOREIGN KEY([workflowengine_id])
REFERENCES [dbo].[workflow_workflowengine] ([id])
GO
ALTER TABLE [dbo].[workflow_workflowengine_employee] CHECK CONSTRAINT [workflow_workflowengine_employee_workflowengine_id_6ebcc5f2_fk_workflow_workflowengine_id]
GO
ALTER TABLE [dbo].[workflow_workflowinstance]  WITH CHECK ADD  CONSTRAINT [workflow_workflowinstance_employee_id_c7cff08e_fk_personnel_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[personnel_employee] ([id])
GO
ALTER TABLE [dbo].[workflow_workflowinstance] CHECK CONSTRAINT [workflow_workflowinstance_employee_id_c7cff08e_fk_personnel_employee_id]
GO
ALTER TABLE [dbo].[workflow_workflowinstance]  WITH CHECK ADD  CONSTRAINT [workflow_workflowinstance_exception_id_6c82a5d8_fk_workflow_abstractexception_id] FOREIGN KEY([exception_id])
REFERENCES [dbo].[workflow_abstractexception] ([id])
GO
ALTER TABLE [dbo].[workflow_workflowinstance] CHECK CONSTRAINT [workflow_workflowinstance_exception_id_6c82a5d8_fk_workflow_abstractexception_id]
GO
ALTER TABLE [dbo].[workflow_workflowinstance]  WITH CHECK ADD  CONSTRAINT [workflow_workflowinstance_workflow_engine_id_1e6ac40f_fk_workflow_workflowengine_id] FOREIGN KEY([workflow_engine_id])
REFERENCES [dbo].[workflow_workflowengine] ([id])
GO
ALTER TABLE [dbo].[workflow_workflowinstance] CHECK CONSTRAINT [workflow_workflowinstance_workflow_engine_id_1e6ac40f_fk_workflow_workflowengine_id]
GO
ALTER TABLE [dbo].[workflow_workflownode_approver]  WITH CHECK ADD  CONSTRAINT [workflow_workflownode_approver_workflownode_id_d814c941_fk_workflow_workflownode_id] FOREIGN KEY([workflownode_id])
REFERENCES [dbo].[workflow_workflownode] ([id])
GO
ALTER TABLE [dbo].[workflow_workflownode_approver] CHECK CONSTRAINT [workflow_workflownode_approver_workflownode_id_d814c941_fk_workflow_workflownode_id]
GO
ALTER TABLE [dbo].[workflow_workflownode_approver]  WITH CHECK ADD  CONSTRAINT [workflow_workflownode_approver_workflowrole_id_c8e00d42_fk_workflow_workflowrole_id] FOREIGN KEY([workflowrole_id])
REFERENCES [dbo].[workflow_workflowrole] ([id])
GO
ALTER TABLE [dbo].[workflow_workflownode_approver] CHECK CONSTRAINT [workflow_workflownode_approver_workflowrole_id_c8e00d42_fk_workflow_workflowrole_id]
GO
ALTER TABLE [dbo].[workflow_workflownode_notifier]  WITH CHECK ADD  CONSTRAINT [workflow_workflownode_notifier_workflownode_id_57298016_fk_workflow_workflownode_id] FOREIGN KEY([workflownode_id])
REFERENCES [dbo].[workflow_workflownode] ([id])
GO
ALTER TABLE [dbo].[workflow_workflownode_notifier] CHECK CONSTRAINT [workflow_workflownode_notifier_workflownode_id_57298016_fk_workflow_workflownode_id]
GO
ALTER TABLE [dbo].[workflow_workflownode_notifier]  WITH CHECK ADD  CONSTRAINT [workflow_workflownode_notifier_workflowrole_id_73de7fc2_fk_workflow_workflowrole_id] FOREIGN KEY([workflowrole_id])
REFERENCES [dbo].[workflow_workflowrole] ([id])
GO
ALTER TABLE [dbo].[workflow_workflownode_notifier] CHECK CONSTRAINT [workflow_workflownode_notifier_workflowrole_id_73de7fc2_fk_workflow_workflowrole_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
ALTER TABLE [dbo].[djcelery_periodictask]  WITH CHECK ADD  CONSTRAINT [djcelery_periodictask_total_run_count_8049951f_check] CHECK  (([total_run_count]>=(0)))
GO
ALTER TABLE [dbo].[djcelery_periodictask] CHECK CONSTRAINT [djcelery_periodictask_total_run_count_8049951f_check]
GO
USE [master]
GO
ALTER DATABASE [gym_management] SET  READ_WRITE 
GO
