/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2/24/2019 9:13:36 AM                         */
/*==============================================================*/
CREATE DATABASE SaigonTechs
DROP DATABASE SaigonTechs

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE') and o.name = 'FK_CANDIDAT_HAS3_EDUCATIO')
alter table CANDIDATE
   drop constraint FK_CANDIDAT_HAS3_EDUCATIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE') and o.name = 'FK_CANDIDAT_HOMETOWN__DISTRICT')
alter table CANDIDATE
   drop constraint FK_CANDIDAT_HOMETOWN__DISTRICT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE') and o.name = 'FK_CANDIDAT_LIVE_IN_DISTRICT')
alter table CANDIDATE
   drop constraint FK_CANDIDAT_LIVE_IN_DISTRICT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE') and o.name = 'FK_CANDIDAT_OF1_CANDIDAT')
alter table CANDIDATE
   drop constraint FK_CANDIDAT_OF1_CANDIDAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE') and o.name = 'FK_CANDIDAT_RELATIONS_INTAKE')
alter table CANDIDATE
   drop constraint FK_CANDIDAT_RELATIONS_INTAKE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE') and o.name = 'FK_CANDIDAT_RELATIONS_CATALOG')
alter table CANDIDATE
   drop constraint FK_CANDIDAT_RELATIONS_CATALOG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE') and o.name = 'FK_CANDIDAT_RELATIONS_YEAR')
alter table CANDIDATE
   drop constraint FK_CANDIDAT_RELATIONS_YEAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE') and o.name = 'FK_CANDIDAT_RELATIONS_SEMESTER')
alter table CANDIDATE
   drop constraint FK_CANDIDAT_RELATIONS_SEMESTER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE') and o.name = 'FK_CANDIDAT_RELATIONS_MAJOR')
alter table CANDIDATE
   drop constraint FK_CANDIDAT_RELATIONS_MAJOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATEDOCUMENT') and o.name = 'FK_CANDIDAT_HAS8_CANDIDAT')
alter table CANDIDATEDOCUMENT
   drop constraint FK_CANDIDAT_HAS8_CANDIDAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATEDOCUMENT') and o.name = 'FK_CANDIDAT_OF9_DOCUMENT')
alter table CANDIDATEDOCUMENT
   drop constraint FK_CANDIDAT_OF9_DOCUMENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DISTRICT') and o.name = 'FK_DISTRICT_OF4_PROVINCE')
alter table DISTRICT
   drop constraint FK_DISTRICT_OF4_PROVINCE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PARAMETER') and o.name = 'FK_PARAMETE_IN1_YEAR')
alter table PARAMETER
   drop constraint FK_PARAMETE_IN1_YEAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PARAMETER') and o.name = 'FK_PARAMETE_IN2_INTAKE')
alter table PARAMETER
   drop constraint FK_PARAMETE_IN2_INTAKE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PARAMETER') and o.name = 'FK_PARAMETE_IN3_SEMESTER')
alter table PARAMETER
   drop constraint FK_PARAMETE_IN3_SEMESTER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PROVINCE') and o.name = 'FK_PROVINCE_OF5_COUNTRY')
alter table PROVINCE
   drop constraint FK_PROVINCE_OF5_COUNTRY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SCORE_EXAM') and o.name = 'FK_SCORE_EX_RELATIONS_EXAMSUBJ')
alter table SCORE_EXAM
   drop constraint FK_SCORE_EX_RELATIONS_EXAMSUBJ
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SCORE_EXAM') and o.name = 'FK_SCORE_EX_RELATIONS_MAJOR')
alter table SCORE_EXAM
   drop constraint FK_SCORE_EX_RELATIONS_MAJOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STAGE') and o.name = 'FK_STAGE_RELATIONS_YEAR')
alter table STAGE
   drop constraint FK_STAGE_RELATIONS_YEAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STAGE') and o.name = 'FK_STAGE_RELATIONS_SEMESTER')
alter table STAGE
   drop constraint FK_STAGE_RELATIONS_SEMESTER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STAGEDETAILS') and o.name = 'FK_STAGEDET_RELATIONS_STAGE')
alter table STAGEDETAILS
   drop constraint FK_STAGEDET_RELATIONS_STAGE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STAGEDETAILS') and o.name = 'FK_STAGEDET_RELATIONS_CANDIDAT')
alter table STAGEDETAILS
   drop constraint FK_STAGEDET_RELATIONS_CANDIDAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STAGEDETAILS') and o.name = 'FK_STAGEDET_RELATIONS_EXAMSUBJ')
alter table STAGEDETAILS
   drop constraint FK_STAGEDET_RELATIONS_EXAMSUBJ
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STAGEDETAILS') and o.name = 'FK_STAGEDET_RELATIONS_MAJOR')
alter table STAGEDETAILS
   drop constraint FK_STAGEDET_RELATIONS_MAJOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE')
            and   name  = 'RELATIONSHIP_29_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE.RELATIONSHIP_29_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE')
            and   name  = 'RELATIONSHIP_28_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE.RELATIONSHIP_28_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE')
            and   name  = 'RELATIONSHIP_27_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE.RELATIONSHIP_27_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE')
            and   name  = 'RELATIONSHIP_24_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE.RELATIONSHIP_24_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE')
            and   name  = 'RELATIONSHIP_21_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE.RELATIONSHIP_21_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE')
            and   name  = 'HOMETOWN_IN_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE.HOMETOWN_IN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE')
            and   name  = 'LIVE_IN_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE.LIVE_IN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE')
            and   name  = 'HAS3_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE.HAS3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE')
            and   name  = 'OF1_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE.OF1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CANDIDATE')
            and   type = 'U')
   drop table CANDIDATE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATEDOCUMENT')
            and   name  = 'OF9_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATEDOCUMENT.OF9_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATEDOCUMENT')
            and   name  = 'HAS8_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATEDOCUMENT.HAS8_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CANDIDATEDOCUMENT')
            and   type = 'U')
   drop table CANDIDATEDOCUMENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CANDIDATETYPE')
            and   type = 'U')
   drop table CANDIDATETYPE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CATALOG')
            and   type = 'U')
   drop table CATALOG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COUNTRY')
            and   type = 'U')
   drop table COUNTRY
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DISTRICT')
            and   name  = 'OF4_FK'
            and   indid > 0
            and   indid < 255)
   drop index DISTRICT.OF4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DISTRICT')
            and   type = 'U')
   drop table DISTRICT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DOCUMENT')
            and   type = 'U')
   drop table DOCUMENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EDUCATION')
            and   type = 'U')
   drop table EDUCATION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EXAMSUBJECT')
            and   type = 'U')
   drop table EXAMSUBJECT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('INTAKE')
            and   type = 'U')
   drop table INTAKE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MAJOR')
            and   type = 'U')
   drop table MAJOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PARAMETER')
            and   name  = 'IN3_FK'
            and   indid > 0
            and   indid < 255)
   drop index PARAMETER.IN3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PARAMETER')
            and   name  = 'IN1_FK'
            and   indid > 0
            and   indid < 255)
   drop index PARAMETER.IN1_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PARAMETER')
            and   name  = 'IN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PARAMETER.IN2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PARAMETER')
            and   type = 'U')
   drop table PARAMETER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROVINCE')
            and   name  = 'OF5_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROVINCE.OF5_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROVINCE')
            and   type = 'U')
   drop table PROVINCE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SCORE_EXAM')
            and   name  = 'RELATIONSHIP_23_FK'
            and   indid > 0
            and   indid < 255)
   drop index SCORE_EXAM.RELATIONSHIP_23_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SCORE_EXAM')
            and   name  = 'RELATIONSHIP_22_FK'
            and   indid > 0
            and   indid < 255)
   drop index SCORE_EXAM.RELATIONSHIP_22_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SCORE_EXAM')
            and   type = 'U')
   drop table SCORE_EXAM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SEMESTER')
            and   type = 'U')
   drop table SEMESTER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STAGE')
            and   name  = 'RELATIONSHIP_20_FK'
            and   indid > 0
            and   indid < 255)
   drop index STAGE.RELATIONSHIP_20_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STAGE')
            and   name  = 'RELATIONSHIP_19_FK'
            and   indid > 0
            and   indid < 255)
   drop index STAGE.RELATIONSHIP_19_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STAGE')
            and   type = 'U')
   drop table STAGE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STAGEDETAILS')
            and   name  = 'RELATIONSHIP_26_FK'
            and   indid > 0
            and   indid < 255)
   drop index STAGEDETAILS.RELATIONSHIP_26_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STAGEDETAILS')
            and   name  = 'RELATIONSHIP_25_FK'
            and   indid > 0
            and   indid < 255)
   drop index STAGEDETAILS.RELATIONSHIP_25_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STAGEDETAILS')
            and   name  = 'RELATIONSHIP_18_FK'
            and   indid > 0
            and   indid < 255)
   drop index STAGEDETAILS.RELATIONSHIP_18_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STAGEDETAILS')
            and   name  = 'RELATIONSHIP_17_FK'
            and   indid > 0
            and   indid < 255)
   drop index STAGEDETAILS.RELATIONSHIP_17_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STAGEDETAILS')
            and   type = 'U')
   drop table STAGEDETAILS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YEAR')
            and   type = 'U')
   drop table YEAR
go

/*==============================================================*/
/* Table: CANDIDATE                                             */
/*==============================================================*/
create table CANDIDATE (
   C_ID                 int    IDENTITY              not null,
   STAGE_ID             int                  not null,
   MAJOR_ID             int                  not null,
   CATALOG_ID           int                  not null,
   COUNTRY_ID          int                  not null,
   EDUCATION_ID         int                  not null,
   YEAR_ID              int                  null,
   TYPE_ID              int                  not null,
   INTAKE_ID            int                  not null,
   SEM_ID               int                  null,
   --DIS_DISTRICT_ID      int                  not null,
   CANDIDATE_ID         nvarchar(50)  UNIQUE        not null,
   LASTNAME             nvarchar(100)         not null,
   FIRSTNAME            nvarchar(100)         not null,
   BIRTHDAY             datetime             not null,
   GENDER               int                  not null,
   PHONENUMBER          nvarchar(10)          not null,
   HOMEADDRESS              nvarchar(200)         null,
   COUNTRY              nvarchar(200)         null,
   PROVINCE              nvarchar(200)         null,
   DISTRICT              nvarchar(200)         null,
   PLACEOFBIRTH              nvarchar(200)         null,
   MARITALSTATUS        int                  null,
   HIGHSCHOOLNAME       nvarchar(200)         null,
   HIGHSCHOOLCITY       nvarchar(200)         null,
   GRADUATEYEAR         int                  null,
   REGISTRYDATE         datetime             not null,
   EMAIL                nvarchar(100)         not null,
   IDCARD               nvarchar(20)          not null,
   FINALRESULT          bit                  null,
   DOCUMENTCODE         nvarchar(50)          null,
   constraint PK_CANDIDATE primary key (C_ID)
)
go

/*==============================================================*/
/* Index: OF1_FK                                                */
/*==============================================================*/




create nonclustered index OF1_FK on CANDIDATE (TYPE_ID ASC)
go

/*==============================================================*/
/* Index: HAS3_FK                                               */
/*==============================================================*/




create nonclustered index HAS3_FK on CANDIDATE (EDUCATION_ID ASC)
go

/*==============================================================*/
/* Index: LIVE_IN_FK                                            */
/*==============================================================*/




--create nonclustered index STAGE_IN_FK on CANDIDATE (STAGE_ID ASC)
--go

/*==============================================================*/
/* Index: HOMETOWN_IN_FK                                        */
/*==============================================================*/




create nonclustered index HOMETOWN_IN_FK on CANDIDATE (COUNTRY_ID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_21_FK on CANDIDATE (INTAKE_ID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_24_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_24_FK on CANDIDATE (CATALOG_ID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_27_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_27_FK on CANDIDATE (YEAR_ID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_28_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_28_FK on CANDIDATE (SEM_ID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_29_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_29_FK on CANDIDATE (MAJOR_ID ASC)
go

/*==============================================================*/
/* Table: CANDIDATEDOCUMENT                                     */
/*==============================================================*/
create table CANDIDATEDOCUMENT (
   NOTE                 text                 null,
   ID_NOTE              numeric(11)          identity,
   DOC_ID               int                  not null,
   C_ID                 int                  not null,
   constraint PK_CANDIDATEDOCUMENT primary key (ID_NOTE)
)
go

/*==============================================================*/
/* Index: HAS8_FK                                               */
/*==============================================================*/




create nonclustered index HAS8_FK on CANDIDATEDOCUMENT (C_ID ASC)
go

/*==============================================================*/
/* Index: OF9_FK                                                */
/*==============================================================*/




create nonclustered index OF9_FK on CANDIDATEDOCUMENT (DOC_ID ASC)
go

/*==============================================================*/
/* Table: CANDIDATETYPE                                         */
/*==============================================================*/
create table CANDIDATETYPE (
   TYPE_ID              int         IDENTITY         not null,
   TYPENAME             nvarchar(200)         not null,
   constraint PK_CANDIDATETYPE primary key (TYPE_ID)
)
go

/*==============================================================*/
/* Table: CATALOG                                               */
/*==============================================================*/
create table CATALOG (
   CATALOG_ID           int    IDENTITY              not null,
   BEGINYEAR            int                  not null,
   ENDYEAR              int                  not null,
   constraint PK_CATALOG primary key (CATALOG_ID)
)
go

/*==============================================================*/
/* Table: COUNTRY                                               */
/*==============================================================*/
create table COUNTRY (
   COUNTRY_ID           int      IDENTITY            not null,
   COUNTRYNAME          nvarchar(200)         not null,
   constraint PK_COUNTRY primary key (COUNTRY_ID)
)
go

/*==============================================================*/
/* Table: DISTRICT                                              */
/*==============================================================*/
create table DISTRICT (
   DISTRICT_ID          int          IDENTITY        not null,
   PROVINCE_ID          int                  not null,
   DISTRICTNAME         nvarchar(100)         not null,
   constraint PK_DISTRICT primary key (DISTRICT_ID)
)
go

/*==============================================================*/
/* Index: OF4_FK                                                */
/*==============================================================*/




create nonclustered index OF4_FK on DISTRICT (PROVINCE_ID ASC)
go

/*==============================================================*/
/* Table: DOCUMENT                                              */
/*==============================================================*/
create table DOCUMENT (
   DOC_ID               int      IDENTITY            not null,
   NAMEINENGLISH        nvarchar(100)         not null,
   NAMEINVIETNAMESE     nvarchar(100)         not null,
   SEQUENCENUM          int                  not null,
   INPUTTYPE            int                  not null,
   STATUS               int                  not null,
   NOTE                 text                 null,
   constraint PK_DOCUMENT primary key (DOC_ID)
)
go

/*==============================================================*/
/* Table: EDUCATION                                             */
/*==============================================================*/
create table EDUCATION (
   EDUCATION_ID         int     IDENTITY             not null,
   EDUCATIONNAME        nvarchar(200)         not null,
   constraint PK_EDUCATION primary key (EDUCATION_ID)
)
go

/*==============================================================*/
/* Table: EXAMSUBJECT                                           */
/*==============================================================*/
create table EXAMSUBJECT (
   EXAM_ID              int       IDENTITY           not null,
   EXAMNAME             nvarchar(100)         not null,
   constraint PK_EXAMSUBJECT primary key (EXAM_ID)
)
go

/*==============================================================*/
/* Table: INTAKE                                                */
/*==============================================================*/
create table INTAKE (
   INTAKE_ID            int       IDENTITY           not null,
   INTAKENAME           nvarchar(200)         not null,
   constraint PK_INTAKE primary key (INTAKE_ID)
)
go

/*==============================================================*/
/* Table: MAJOR                                                 */
/*==============================================================*/
create table MAJOR (
   MAJOR_ID             int    IDENTITY              not null,
   MAJOR_NAME           nvarchar(200)         null,
   constraint PK_MAJOR primary key (MAJOR_ID)
)
go

/*==============================================================*/
/* Table: PARAMETER                                             */
/*==============================================================*/
create table PARAMETER (
   PARAMETER_ID              int   IDENTITY  PRIMARY KEY             not null,
   YEAR_ID              int                  not NULL,
   SEM_ID               int                  not null,
   INTAKE_ID            int                  not null,
   SIGNATURENAME        nvarchar(200)         not null,
   MORECONTACT          nvarchar(200)         not null,
   DOCUMENTCODE         nvarchar(50)          not null
)
go

/*==============================================================*/
/* Index: IN2_FK                                                */
/*==============================================================*/




create nonclustered index IN2_FK on PARAMETER (INTAKE_ID ASC)
go

/*==============================================================*/
/* Index: IN1_FK                                                */
/*==============================================================*/




create nonclustered index IN1_FK on PARAMETER (YEAR_ID ASC)
go

/*==============================================================*/
/* Index: IN3_FK                                                */
/*==============================================================*/




create nonclustered index IN3_FK on PARAMETER (SEM_ID ASC)
go

/*==============================================================*/
/* Table: PROVINCE                                              */
/*==============================================================*/
create table PROVINCE (
   PROVINCE_ID          int        IDENTITY          not null,
   COUNTRY_ID           int                  not null,
   PROVINCENAME         nvarchar(200)         not null,
   constraint PK_PROVINCE primary key (PROVINCE_ID)
)
go

/*==============================================================*/
/* Index: OF5_FK                                                */
/*==============================================================*/




create nonclustered index OF5_FK on PROVINCE (COUNTRY_ID ASC)
go

/*==============================================================*/
/* Table: SCORE_EXAM                                            */
/*==============================================================*/
create table SCORE_EXAM (
   SUMSCORE             decimal              null,
   SCOREPASS            decimal              null,
   SCORE_ID             int     IDENTITY             not null,
   EXAM_ID              int                  not null,
   MAJOR_ID             int                  not null,
   constraint PK_SCORE_EXAM primary key (SCORE_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_22_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_22_FK on SCORE_EXAM (EXAM_ID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_23_FK on SCORE_EXAM (MAJOR_ID ASC)
go

/*==============================================================*/
/* Table: SEMESTER                                              */
/*==============================================================*/
create table SEMESTER (
   SEM_ID               int    IDENTITY              not null,
   SEMESTERNAME         nvarchar(200)         not null,
   constraint PK_SEMESTER primary key (SEM_ID)
)
go

/*==============================================================*/
/* Table: STAGE                                                 */
/*==============================================================*/
create table STAGE (
   STAGE_ID             int        IDENTITY          not null,
   SEM_ID               int                  not null,
   YEAR_ID              int                  not null,
   STAGENAME            nvarchar(200)         not null,
   DATETIME             datetime             not null,
   EXAMDATE             datetime             not null,
   EXAMTIME             nvarchar(50)          not null,
   ENGLISHTIMEEXAM      nvarchar(20)          null,
   constraint PK_STAGE primary key (STAGE_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_19_FK on STAGE (YEAR_ID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_20_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_20_FK on STAGE (SEM_ID ASC)
go

/*==============================================================*/
/* Table: STAGEDETAILS                                          */
/*==============================================================*/
create table STAGEDETAILS (
   STAR_TIME            nvarchar(50)          not null,
   END_TIME             nvarchar(50)          not null,
   --SCORE                decimal              not null,
   INTERVIEW            nvarchar(200)         null,
   STAGE_DETAILS_ID     int         IDENTITY         not null,
   --C_ID                 int                  not null,
   MAJOR_ID             int                  not null,
   STAGE_ID             int                  not null,
   EXAM_ID              int                  not null,
   constraint PK_STAGEDETAILS primary key (STAGE_DETAILS_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_17_FK on STAGEDETAILS (STAGE_ID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/




--create nonclustered index RELATIONSHIP_18_FK on STAGEDETAILS (C_ID ASC)
--go

/*==============================================================*/
/* Index: RELATIONSHIP_25_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_25_FK on STAGEDETAILS (EXAM_ID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_26_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_26_FK on STAGEDETAILS (MAJOR_ID ASC)
go

/*==============================================================*/
/* Table: YEAR                                                  */
/*==============================================================*/
create table YEAR (
   YEAR_ID              int     IDENTITY             not null,
   YEARNAME             int                  not null,
   constraint PK_YEAR primary key (YEAR_ID)
)
go

alter table CANDIDATE
   add constraint FK_CANDIDAT_HAS3_EDUCATIO foreign key (EDUCATION_ID)
      references EDUCATION (EDUCATION_ID)
go

alter table CANDIDATE
   add constraint FK_CANDIDAT_HOMETOWN__DISTRICT foreign key (COUNTRY_ID)
      references dbo.COUNTRY (COUNTRY_ID)
GO

alter table CANDIDATE
   add constraint FK_CANDIDAT_STAGE foreign key (STAGE_ID)
      references dbo.STAGE (STAGE_ID)
go

--alter table CANDIDATE
--   add constraint FK_CANDIDAT_LIVE_IN_DISTRICT foreign key (DIS_DISTRICT_ID)
--      references DISTRICT (DISTRICT_ID)
--go

alter table CANDIDATE
   add constraint FK_CANDIDAT_OF1_CANDIDAT foreign key (TYPE_ID)
      references CANDIDATETYPE (TYPE_ID)
go

alter table CANDIDATE
   add constraint FK_CANDIDAT_RELATIONS_INTAKE foreign key (INTAKE_ID)
      references INTAKE (INTAKE_ID)
go

alter table CANDIDATE
   add constraint FK_CANDIDAT_RELATIONS_CATALOG foreign key (CATALOG_ID)
      references CATALOG (CATALOG_ID)
go

alter table CANDIDATE
   add constraint FK_CANDIDAT_RELATIONS_YEAR foreign key (YEAR_ID)
      references YEAR (YEAR_ID)
go

alter table CANDIDATE
   add constraint FK_CANDIDAT_RELATIONS_SEMESTER foreign key (SEM_ID)
      references SEMESTER (SEM_ID)
go

alter table CANDIDATE
   add constraint FK_CANDIDAT_RELATIONS_MAJOR foreign key (MAJOR_ID)
      references MAJOR (MAJOR_ID)
go

alter table CANDIDATEDOCUMENT
   add constraint FK_CANDIDAT_HAS8_CANDIDAT foreign key (C_ID)
      references CANDIDATE (C_ID)
go

alter table CANDIDATEDOCUMENT
   add constraint FK_CANDIDAT_OF9_DOCUMENT foreign key (DOC_ID)
      references DOCUMENT (DOC_ID)
go

alter table DISTRICT
   add constraint FK_DISTRICT_OF4_PROVINCE foreign key (PROVINCE_ID)
      references PROVINCE (PROVINCE_ID)
go

alter table PARAMETER
   add constraint FK_PARAMETE_IN1_YEAR foreign key (YEAR_ID)
      references YEAR (YEAR_ID)
go

alter table PARAMETER
   add constraint FK_PARAMETE_IN2_INTAKE foreign key (INTAKE_ID)
      references INTAKE (INTAKE_ID)
go

alter table PARAMETER
   add constraint FK_PARAMETE_IN3_SEMESTER foreign key (SEM_ID)
      references SEMESTER (SEM_ID)
go

alter table PROVINCE
   add constraint FK_PROVINCE_OF5_COUNTRY foreign key (COUNTRY_ID)
      references COUNTRY (COUNTRY_ID)
go

alter table SCORE_EXAM
   add constraint FK_SCORE_EX_RELATIONS_EXAMSUBJ foreign key (EXAM_ID)
      references EXAMSUBJECT (EXAM_ID)
go

alter table SCORE_EXAM
   add constraint FK_SCORE_EX_RELATIONS_MAJOR foreign key (MAJOR_ID)
      references MAJOR (MAJOR_ID)
go

alter table STAGE
   add constraint FK_STAGE_RELATIONS_YEAR foreign key (YEAR_ID)
      references YEAR (YEAR_ID)
go

alter table STAGE
   add constraint FK_STAGE_RELATIONS_SEMESTER foreign key (SEM_ID)
      references SEMESTER (SEM_ID)
go

alter table STAGEDETAILS
   add constraint FK_STAGEDET_RELATIONS_STAGE foreign key (STAGE_ID)
      references STAGE (STAGE_ID)
go

--alter table STAGEDETAILS
--   add constraint FK_STAGEDET_RELATIONS_CANDIDAT foreign key (C_ID)
--      references CANDIDATE (C_ID)
go

alter table STAGEDETAILS
   add constraint FK_STAGEDET_RELATIONS_EXAMSUBJ foreign key (EXAM_ID)
      references EXAMSUBJECT (EXAM_ID)
go

alter table STAGEDETAILS
   add constraint FK_STAGEDET_RELATIONS_MAJOR foreign key (MAJOR_ID)
      references MAJOR (MAJOR_ID)
go

-----------------------
CREATE TABLE Users(
	Use_ID INT PRIMARY KEY IDENTITY NOT NULL,
	Name NVARCHAR(50),
	Phone INT,
	Addres NVARCHAR(100),
	Email NVARCHAR(50),
	UserName VARCHAR(20),
	PassWord VARCHAR(250) 
);

CREATE TABLE INPUTTYPE(
	Input_ID INT IDENTITY PRIMARY KEY NOT NULL,
	InputName NVARCHAR(50)
);

CREATE TABLE STATUSS(
	Status_ID INT PRIMARY KEY IDENTITY NOT NULL,
	StatusName NVARCHAR(50)
);

ALTER TABLE DOCUMENT ADD CONSTRAINT DOC_INPUT_PK FOREIGN KEY (INPUTTYPE) REFERENCES INPUTTYPE(Input_ID);
ALTER TABLE DOCUMENT ADD CONSTRAINT DOC_STATUS_PK FOREIGN KEY (STATUS) REFERENCES STATUSS(Status_ID);

GO
INSERT INTO INPUTTYPE(InputName) VALUES (N'Text Box')
INSERT INTO INPUTTYPE(InputName) VALUES (N'Check Box')
INSERT INTO INPUTTYPE(InputName) VALUES (N'Others')

INSERT INTO STATUSS(StatusName) VALUES (N'Inactive')
INSERT INTO STATUSS(StatusName) VALUES (N'Active')
INSERT INTO STATUSS(StatusName) VALUES (N'Others')

INSERT [dbo].[CANDIDATETYPE] ([TYPENAME]) VALUES (N'skipped English Exam')
INSERT [dbo].[CANDIDATETYPE] ([TYPENAME]) VALUES (N'skipped Math')
INSERT [dbo].[CANDIDATETYPE] ([TYPENAME]) VALUES (N'shipped Interview')
INSERT [dbo].[CANDIDATETYPE] ([TYPENAME]) VALUES (N'shipped Literature')
INSERT [dbo].[CANDIDATETYPE] ([TYPENAME]) VALUES (N'no need to do exam')


INSERT [dbo].[CATALOG] ([BEGINYEAR], [ENDYEAR]) VALUES (2000, 2001)
INSERT [dbo].[CATALOG] ([BEGINYEAR], [ENDYEAR]) VALUES (2004, 2005)
INSERT [dbo].[CATALOG] ([BEGINYEAR], [ENDYEAR]) VALUES (2008, 2009)
INSERT [dbo].[CATALOG] ([BEGINYEAR], [ENDYEAR]) VALUES (2012, 2013)
INSERT [dbo].[CATALOG] ([BEGINYEAR], [ENDYEAR]) VALUES (2014, 2015)
INSERT [dbo].[CATALOG] ([BEGINYEAR], [ENDYEAR]) VALUES (2017, 2018)


INSERT [dbo].[COUNTRY] ([COUNTRYNAME]) VALUES (N'VietNam')
INSERT [dbo].[COUNTRY] ([COUNTRYNAME]) VALUES (N'Laos')
INSERT [dbo].[COUNTRY] ([COUNTRYNAME]) VALUES (N'Campuchia')
INSERT [dbo].[COUNTRY] ([COUNTRYNAME]) VALUES (N'France')
INSERT [dbo].[COUNTRY] ([COUNTRYNAME]) VALUES (N'United States')

INSERT [dbo].[PROVINCE] ([COUNTRY_ID], [PROVINCENAME]) VALUES (1, N'Ha Noi')
INSERT [dbo].[PROVINCE] ([COUNTRY_ID], [PROVINCENAME]) VALUES (1, N'Ho Chi Minh City')
INSERT [dbo].[PROVINCE] ([COUNTRY_ID], [PROVINCENAME]) VALUES (1, N'Bien Hoa')
INSERT [dbo].[PROVINCE] ([COUNTRY_ID], [PROVINCENAME]) VALUES (1, N'Tay Ninh')
INSERT [dbo].[PROVINCE] ([COUNTRY_ID], [PROVINCENAME]) VALUES (1, N'Tien Giang')
INSERT [dbo].[PROVINCE] ([COUNTRY_ID], [PROVINCENAME]) VALUES (1, N'Ben Tre')
INSERT [dbo].[PROVINCE] ([COUNTRY_ID], [PROVINCENAME]) VALUES (1, N'Long An')
INSERT [dbo].[PROVINCE] ([COUNTRY_ID], [PROVINCENAME]) VALUES (1, N'Binh Duong')
INSERT [dbo].[PROVINCE] ([COUNTRY_ID], [PROVINCENAME]) VALUES (2, N'Vientiane')
INSERT [dbo].[PROVINCE] ([COUNTRY_ID], [PROVINCENAME]) VALUES (5, N'Texas')

INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (1, N'Hoan Kiem')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (1, N'Tay Ho')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (2, N'Tan Binh')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (2, N'District 12')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (2, N'Go Vap')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (2, N'Cu Chi')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (2, N'District 7')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (6, N'Chau Thanh')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (6, N'Ba Tri')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (6, N'Ben Tre City')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (3, N'Trang Boom')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (3, N'Long Khanh')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (4, N'Trang Bang')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (4, N'Go Dau')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (5, N'Cai Be')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (5, N'Cai Lay')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (7, N'Tan An')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (7, N'Ben Luc')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (8, N'Thu Dau Mot')
INSERT [dbo].[DISTRICT] ([PROVINCE_ID], [DISTRICTNAME]) VALUES (8, N'Di An')


INSERT [dbo].[EDUCATION] ([EDUCATIONNAME]) VALUES (N'Graduated High School')
INSERT [dbo].[EDUCATION] ([EDUCATIONNAME]) VALUES (N'Graduated College')
INSERT [dbo].[EDUCATION] ([EDUCATIONNAME]) VALUES (N'Graduated Univerity')
INSERT [dbo].[EDUCATION] ([EDUCATIONNAME]) VALUES (N'Master Degree')


INSERT [dbo].[EXAMSUBJECT] ([EXAMNAME]) VALUES (N'General English')
INSERT [dbo].[EXAMSUBJECT] ([EXAMNAME]) VALUES (N'Front-End')
INSERT [dbo].[EXAMSUBJECT] ([EXAMNAME]) VALUES (N'Back-End')
INSERT [dbo].[EXAMSUBJECT] ([EXAMNAME]) VALUES (N'Database')
INSERT [dbo].[EXAMSUBJECT] ([EXAMNAME]) VALUES (N'Mathematics')


INSERT [dbo].[INTAKE] ([INTAKENAME]) VALUES (N'SGT-01')
INSERT [dbo].[INTAKE] ([INTAKENAME]) VALUES (N'SGT-02')
INSERT [dbo].[INTAKE] ([INTAKENAME]) VALUES (N'SGT-03')
INSERT [dbo].[INTAKE] ([INTAKENAME]) VALUES (N'SGT-04')
INSERT [dbo].[INTAKE] ([INTAKENAME]) VALUES (N'SGT-05')
INSERT [dbo].[INTAKE] ([INTAKENAME]) VALUES (N'SGT-06')
INSERT [dbo].[INTAKE] ([INTAKENAME]) VALUES (N'ISC-01')
INSERT [dbo].[INTAKE] ([INTAKENAME]) VALUES (N'ISC-02')
INSERT [dbo].[INTAKE] ([INTAKENAME]) VALUES (N'ISC-03')
INSERT [dbo].[INTAKE] ([INTAKENAME]) VALUES (N'ISC-04')


INSERT [dbo].[MAJOR] ([MAJOR_NAME]) VALUES (N'International Business')
INSERT [dbo].[MAJOR] ([MAJOR_NAME]) VALUES (N'Marketing')
INSERT [dbo].[MAJOR] ([MAJOR_NAME]) VALUES (N'Networking')
INSERT [dbo].[MAJOR] ([MAJOR_NAME]) VALUES (N'Computer Programming')
INSERT [dbo].[MAJOR] ([MAJOR_NAME]) VALUES (N'ESL -English As A Second Language')


INSERT [dbo].[SEMESTER] ([SEMESTERNAME]) VALUES (N'Fall')
INSERT [dbo].[SEMESTER] ([SEMESTERNAME]) VALUES (N'Spring')
INSERT [dbo].[SEMESTER] ([SEMESTERNAME]) VALUES (N'Summer')

INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2000)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2001)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2002)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2004)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2005)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2006)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2007)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2008)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2009)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2010)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2011)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2012)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2013)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2014)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2015)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2016)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2017)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2018)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2019)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2020)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2021)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2022)
INSERT [dbo].[YEAR] ([YEARNAME]) VALUES (2023)


INSERT [dbo].[STAGE] ([SEM_ID], [YEAR_ID], [STAGENAME], [DATETIME], [EXAMDATE], [EXAMTIME], [ENGLISHTIMEEXAM]) VALUES (1, 18, N'Stage 1', CAST(N'2018-10-09 00:00:00.000' AS DateTime), CAST(N'2018-10-09 00:00:00.000' AS DateTime), N'8h15-9h15', N'10h-11h30')
INSERT [dbo].[STAGE] ([SEM_ID], [YEAR_ID], [STAGENAME], [DATETIME], [EXAMDATE], [EXAMTIME], [ENGLISHTIMEEXAM]) VALUES (2, 19, N'Stage 2', CAST(N'2019-02-01 00:00:00.000' AS DateTime), CAST(N'2019-02-02 00:00:00.000' AS DateTime), N'8h15-9h15', N'10h-11h30')
INSERT [dbo].[STAGE] ([SEM_ID], [YEAR_ID], [STAGENAME], [DATETIME], [EXAMDATE], [EXAMTIME], [ENGLISHTIMEEXAM]) VALUES (3, 18, N'Stage 3', CAST(N'2018-06-06 00:00:00.000' AS DateTime), CAST(N'2018-07-06 00:00:00.000' AS DateTime), N'9h-10h', N'10h30-12h')
INSERT [dbo].[STAGE] ([SEM_ID], [YEAR_ID], [STAGENAME], [DATETIME], [EXAMDATE], [EXAMTIME], [ENGLISHTIMEEXAM]) VALUES (2, 18, N'Stage 4', CAST(N'2018-01-02 00:00:00.000' AS DateTime), CAST(N'2018-02-01 00:00:00.000' AS DateTime), N'9h-10h', N'10h30-11h30')
INSERT [dbo].[STAGE] ([SEM_ID], [YEAR_ID], [STAGENAME], [DATETIME], [EXAMDATE], [EXAMTIME], [ENGLISHTIMEEXAM]) VALUES (1, 17, N'Stage 5', CAST(N'2017-10-09 00:00:00.000' AS DateTime), CAST(N'2017-10-09 00:00:00.000' AS DateTime), N'8h15-9h15', N'9h45-10h45')
INSERT [dbo].[STAGE] ([SEM_ID], [YEAR_ID], [STAGENAME], [DATETIME], [EXAMDATE], [EXAMTIME], [ENGLISHTIMEEXAM]) VALUES (2, 17, N'Stage 6', CAST(N'2017-02-22 00:00:00.000' AS DateTime), CAST(N'2017-02-23 00:00:00.000' AS DateTime), N'7h45-9h', N'9h30-10h30')
INSERT [dbo].[STAGE] ([SEM_ID], [YEAR_ID], [STAGENAME], [DATETIME], [EXAMDATE], [EXAMTIME], [ENGLISHTIMEEXAM]) VALUES (3, 17, N'Stage 7', CAST(N'2017-07-06 00:00:00.000' AS DateTime), CAST(N'2017-07-06 00:00:00.000' AS DateTime), N'9h-10h', N'10h30-11h30')
INSERT [dbo].[STAGE] ([SEM_ID], [YEAR_ID], [STAGENAME], [DATETIME], [EXAMDATE], [EXAMTIME], [ENGLISHTIMEEXAM]) VALUES (3, 17, N'Stage ISC-01', CAST(N'2017-07-06 00:00:00.000' AS DateTime), CAST(N'2017-07-06 00:00:00.000' AS DateTime), N'9h-10h', N'10h30-11h30')
INSERT [dbo].[STAGE] ([SEM_ID], [YEAR_ID], [STAGENAME], [DATETIME], [EXAMDATE], [EXAMTIME], [ENGLISHTIMEEXAM]) VALUES (1, 18, N'Stage ISC-02', CAST(N'2018-09-09 00:00:00.000' AS DateTime), CAST(N'2018-09-09 00:00:00.000' AS DateTime), N'9h-10h', N'10h30-11h30')

INSERT [dbo].[PARAMETER] ([YEAR_ID], [SEM_ID], [INTAKE_ID], [SIGNATURENAME], [MORECONTACT], [DOCUMENTCODE]) VALUES (18, 1, 8, N'Vice Chainmain', N'Dinh Thi Lan (Mother)', N'1')
INSERT [dbo].[PARAMETER] ([YEAR_ID], [SEM_ID], [INTAKE_ID], [SIGNATURENAME], [MORECONTACT], [DOCUMENTCODE]) VALUES (19, 2, 9, N'BA Manager', N'Hoang Le Vy (Father)', N'2')
INSERT [dbo].[PARAMETER] ([YEAR_ID], [SEM_ID], [INTAKE_ID], [SIGNATURENAME], [MORECONTACT], [DOCUMENTCODE]) VALUES (18, 3, 7, N'BA Manager', N'', N'3')
INSERT [dbo].[PARAMETER] ([YEAR_ID], [SEM_ID], [INTAKE_ID], [SIGNATURENAME], [MORECONTACT], [DOCUMENTCODE]) VALUES (17, 2, 5, N'IT Manager', N'Phan Quang (Father)', N'4')
INSERT [dbo].[PARAMETER] ([YEAR_ID], [SEM_ID], [INTAKE_ID], [SIGNATURENAME], [MORECONTACT], [DOCUMENTCODE]) VALUES (17, 2, 5, N'IT Manager', N'', N'5')
INSERT [dbo].[PARAMETER] ([YEAR_ID], [SEM_ID], [INTAKE_ID], [SIGNATURENAME], [MORECONTACT], [DOCUMENTCODE]) VALUES (18, 1, 8, N'GE Manager', N'', N'6')
INSERT [dbo].[PARAMETER] ([YEAR_ID], [SEM_ID], [INTAKE_ID], [SIGNATURENAME], [MORECONTACT], [DOCUMENTCODE]) VALUES (19, 3, 9, N'GE Manager', N'', N'7')
INSERT [dbo].[PARAMETER] ([YEAR_ID], [SEM_ID], [INTAKE_ID], [SIGNATURENAME], [MORECONTACT], [DOCUMENTCODE]) VALUES (18, 2, 8, N'Vice Chainman of Education', N'Huynh Kim Phung', N'8')


INSERT [dbo].[DOCUMENT] ([NAMEINENGLISH], [NAMEINVIETNAMESE], [SEQUENCENUM], [INPUTTYPE], [STATUS], [NOTE]) VALUES (N'James Bone', N'Quoc Viet', 1, 1, 1, N'')
INSERT [dbo].[DOCUMENT] ([NAMEINENGLISH], [NAMEINVIETNAMESE], [SEQUENCENUM], [INPUTTYPE], [STATUS], [NOTE]) VALUES (N'Blade Sirius', N'Huyen Tram', 2, 2, 1, N'')
INSERT [dbo].[DOCUMENT] ([NAMEINENGLISH], [NAMEINVIETNAMESE], [SEQUENCENUM], [INPUTTYPE], [STATUS], [NOTE]) VALUES (N'Jessica', N'Ngoc Thy', 1, 2, 1, NULL)
INSERT [dbo].[DOCUMENT] ([NAMEINENGLISH], [NAMEINVIETNAMESE], [SEQUENCENUM], [INPUTTYPE], [STATUS], [NOTE]) VALUES (N'Parker', N'Hong Nhung', 1, 1, 1, NULL)
INSERT [dbo].[DOCUMENT] ([NAMEINENGLISH], [NAMEINVIETNAMESE], [SEQUENCENUM], [INPUTTYPE], [STATUS], [NOTE]) VALUES (N'Bertha', N'Minh Minh', 1, 2, 2, N'graduated in 2016')
INSERT [dbo].[DOCUMENT] ([NAMEINENGLISH], [NAMEINVIETNAMESE], [SEQUENCENUM], [INPUTTYPE], [STATUS], [NOTE]) VALUES (N'Tim Jack', N'Minh Hung', 2, 1, 1, N'droped in Fall 2017')
INSERT [dbo].[DOCUMENT] ([NAMEINENGLISH], [NAMEINVIETNAMESE], [SEQUENCENUM], [INPUTTYPE], [STATUS], [NOTE]) VALUES (N'Harry Pique', N'Hoang Phuong', 1, 2, 1, N'change major from IB to Networking')
INSERT [dbo].[DOCUMENT] ([NAMEINENGLISH], [NAMEINVIETNAMESE], [SEQUENCENUM], [INPUTTYPE], [STATUS], [NOTE]) VALUES (N'Rihnana Roses', N'Thao Mai', 1, 1, 1, N'scholorship with outstanding academy in high school')
INSERT [dbo].[DOCUMENT] ([NAMEINENGLISH], [NAMEINVIETNAMESE], [SEQUENCENUM], [INPUTTYPE], [STATUS], [NOTE]) VALUES (N'Richard Leopard', N'Thanh Phong', 2, 2, 1, NULL)
INSERT [dbo].[DOCUMENT] ([NAMEINENGLISH], [NAMEINVIETNAMESE], [SEQUENCENUM], [INPUTTYPE], [STATUS], [NOTE]) VALUES (N'Elsa Gomez', N'Le Nhi', 1, 1, 1, NULL)


INSERT [dbo].[SCORE_EXAM] ([SUMSCORE], [SCOREPASS], [EXAM_ID], [MAJOR_ID]) VALUES (CAST(100 AS Decimal(18, 0)), CAST(60 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[SCORE_EXAM] ([SUMSCORE], [SCOREPASS], [EXAM_ID], [MAJOR_ID]) VALUES (CAST(100 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), 2, 3)
INSERT [dbo].[SCORE_EXAM] ([SUMSCORE], [SCOREPASS], [EXAM_ID], [MAJOR_ID]) VALUES (CAST(100 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), 3, 4)
INSERT [dbo].[SCORE_EXAM] ([SUMSCORE], [SCOREPASS], [EXAM_ID], [MAJOR_ID]) VALUES (CAST(100 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), 4, 4)
INSERT [dbo].[SCORE_EXAM] ([SUMSCORE], [SCOREPASS], [EXAM_ID], [MAJOR_ID]) VALUES (CAST(100 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)), 1, 5)
INSERT [dbo].[SCORE_EXAM] ([SUMSCORE], [SCOREPASS], [EXAM_ID], [MAJOR_ID]) VALUES (CAST(100 AS Decimal(18, 0)), CAST(60 AS Decimal(18, 0)), 5, 2)

--INSERT [dbo].[CANDIDATE] ([MAJOR_ID], [CATALOG_ID], [COUNTRY_ID], [EDUCATION_ID], [YEAR_ID], [TYPE_ID], [INTAKE_ID], [SEM_ID],  [CANDIDATE_ID], [LASTNAME], [FIRSTNAME], [BIRTHDAY], [GENDER], [PHONENUMBER], [HOMEADDRESS], [MARITALSTATUS], [HIGHSCHOOLNAME], [HIGHSCHOOLCITY], [GRADUATEYEAR], [REGISTRYDATE], [EMAIL], [IDCARD], [FINALRESULT], [DOCUMENTCODE]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1,  N'Phan', N'Trong Thoai', GETDATE(), 1,  N'090678541', N'123 Le Van Tho Go Vap', 1, N'Truong Chinh High School', N'HoChiMinh City', 2009, GETDATE(), N'trongthoaiphan@gmail.com', N'01-14-0-00017', 1, N'1')
--INSERT [dbo].[CANDIDATE] ([MAJOR_ID], [CATALOG_ID], [COUNTRY_ID], [EDUCATION_ID], [YEAR_ID], [TYPE_ID], [INTAKE_ID], [SEM_ID],  [CANDIDATE_ID], [LASTNAME], [FIRSTNAME], [BIRTHDAY], [GENDER], [PHONENUMBER], [HOMEADDRESS], [MARITALSTATUS], [HIGHSCHOOLNAME], [HIGHSCHOOLCITY], [GRADUATEYEAR], [REGISTRYDATE], [EMAIL], [IDCARD], [FINALRESULT], [DOCUMENTCODE]) VALUES (2, 6, 2, 1, 17, 1, 5, 2, 4, N'La', N'Thanh Hong', GETDATE(), 0,  N'089768908', N'12A/3 Song Hành qu?n 12', 1, N'Truong CHinh High School', N'HoChiMinh City', 2015, GETDATE(), N'lathanhhong@gmail.com', N'01-15-1-00019', 1, N'2')
--INSERT [dbo].[CANDIDATE] ([MAJOR_ID], [CATALOG_ID], [COUNTRY_ID], [EDUCATION_ID], [YEAR_ID], [TYPE_ID], [INTAKE_ID], [SEM_ID],  [CANDIDATE_ID], [LASTNAME], [FIRSTNAME], [BIRTHDAY], [GENDER], [PHONENUMBER], [HOMEADDRESS], [MARITALSTATUS], [HIGHSCHOOLNAME], [HIGHSCHOOLCITY], [GRADUATEYEAR], [REGISTRYDATE], [EMAIL], [IDCARD], [FINALRESULT], [DOCUMENTCODE]) VALUES (5, 6, 3, 1, 18, 1, 5, 2, 5, N'Le', N'Minh Tam', GETDATE(), 0,  N'079809802', N'789 Phan Huy Ich, Go Vap', 1, N'Nguyen Huu Tri High School', N'HochiMinh city', 2017, GETDATE(), N'koolboy@gmail.com', N'09-16-0-00029', 1, N'2')
--INSERT [dbo].[CANDIDATE] ([MAJOR_ID], [CATALOG_ID], [COUNTRY_ID], [EDUCATION_ID], [YEAR_ID], [TYPE_ID], [INTAKE_ID], [SEM_ID],  [CANDIDATE_ID], [LASTNAME], [FIRSTNAME], [BIRTHDAY], [GENDER], [PHONENUMBER], [HOMEADDRESS], [MARITALSTATUS], [HIGHSCHOOLNAME], [HIGHSCHOOLCITY], [GRADUATEYEAR], [REGISTRYDATE], [EMAIL], [IDCARD], [FINALRESULT], [DOCUMENTCODE]) VALUES (5, 6, 4, 1, 18, 1, 6, 1, 10, N'Tran', N'Ngoc Tram', GETDATE(), 1,  N'098789019', N'12/7A Xom Cho, Ben Tre ', 1, N'Nguyen Dinh Chieu High School', N'Ben Tre', 2018, GETDATE(), N'koolgirl@gmail.com', N'01-17-1-00091', 1, N'3')
--INSERT [dbo].[CANDIDATE] ([MAJOR_ID], [CATALOG_ID], [COUNTRY_ID], [EDUCATION_ID], [YEAR_ID], [TYPE_ID], [INTAKE_ID], [SEM_ID],  [CANDIDATE_ID], [LASTNAME], [FIRSTNAME], [BIRTHDAY], [GENDER], [PHONENUMBER], [HOMEADDRESS], [MARITALSTATUS], [HIGHSCHOOLNAME], [HIGHSCHOOLCITY], [GRADUATEYEAR], [REGISTRYDATE], [EMAIL], [IDCARD], [FINALRESULT], [DOCUMENTCODE]) VALUES (3, 6, 5, 2, 16, 5, 3, 3, 19, N'Huynh', N'Ngoc Diep', GETDATE(), 1,  N'090789718', N'45 Che Lan Vien, Thu Dau Mot, Binh Duong', 2, N'Thu Dau Mot High School', N'Binh Duong', 2002, GETDATE(), N'huynhngocdiep@yahoo.com', N'01-16-1-00019', 1, N'4')

INSERT dbo.CANDIDATE
        ( STAGE_ID ,
          MAJOR_ID ,
          CATALOG_ID ,
          COUNTRY_ID ,
          EDUCATION_ID ,
          YEAR_ID ,
          TYPE_ID ,
          INTAKE_ID ,
          SEM_ID ,
          CANDIDATE_ID ,
          LASTNAME ,
          FIRSTNAME ,
          BIRTHDAY ,
          GENDER ,
          PHONENUMBER ,
          HOMEADDRESS ,
          COUNTRY ,
          PROVINCE ,
          DISTRICT ,
          PLACEOFBIRTH ,
          MARITALSTATUS ,
          HIGHSCHOOLNAME ,
          HIGHSCHOOLCITY ,
          GRADUATEYEAR ,
          REGISTRYDATE ,
          EMAIL ,
          IDCARD ,
          FINALRESULT ,
          DOCUMENTCODE
        )
VALUES  ( 1 , -- STAGE_ID - int
          1 , -- MAJOR_ID - int
          2 , -- CATALOG_ID - int
          1 , -- COUNTRY_ID - int
          1 , -- EDUCATION_ID - int
          18 , -- YEAR_ID - int
          1 , -- TYPE_ID - int
          2 , -- INTAKE_ID - int
          1 , -- SEM_ID - int
          N'1524801040127' , -- CANDIDATE_ID - nvarchar(50)
          N'QUOC' , -- LASTNAME - nvarchar(100)
          N'DO' , -- FIRSTNAME - nvarchar(100)
          GETDATE() , -- BIRTHDAY - datetime
          1 , -- GENDER - int
          N'0367047155' , -- PHONENUMBER - nvarchar(10)
          N'HUYNH VAN NGHE' , -- HOMEADDRESS - nvarchar(200)
          N'VIET NAM' , -- COUNTRY - nvarchar(200)
          N'BINH DUONG' , -- PROVINCE - nvarchar(200)
          N'PHU LOI' , -- DISTRICT - nvarchar(200)
          N'BINH DUONG' , -- PLACEOFBIRTH - nvarchar(200)
          0 , -- MARITALSTATUS - int
          N'PHUOC VINH' , -- HIGHSCHOOLNAME - nvarchar(200)
          N'BINH DUONG' , -- HIGHSCHOOLCITY - nvarchar(200)
          2019 , -- GRADUATEYEAR - int
          GETDATE() , -- REGISTRYDATE - datetime
          N'QUOCQUOC736@GMAIL.COM' , -- EMAIL - nvarchar(100)
          N'281160489' , -- IDCARD - nvarchar(20)
          0 , -- FINALRESULT - bit
          N'1'  -- DOCUMENTCODE - nvarchar(50)
        )

INSERT [dbo].[CANDIDATEDOCUMENT] ([NOTE], [DOC_ID], [C_ID]) VALUES (N'sholarship', 1, 1)
INSERT [dbo].[CANDIDATEDOCUMENT] ([NOTE], [DOC_ID], [C_ID]) VALUES (N'pass English test, but apply to study Foudation of GE level', 2, 1)
INSERT [dbo].[CANDIDATEDOCUMENT] ([NOTE], [DOC_ID], [C_ID]) VALUES (NULL, 3, 1)
INSERT [dbo].[CANDIDATEDOCUMENT] ([NOTE], [DOC_ID], [C_ID]) VALUES (NULL, 4, 1)

INSERT [dbo].[STAGEDETAILS] ([STAR_TIME], [END_TIME],  [INTERVIEW],   [MAJOR_ID], [STAGE_ID], [EXAM_ID]) VALUES (N'8h', N'9h15',  N'90',  1, 3, 1)
INSERT [dbo].[STAGEDETAILS] ([STAR_TIME], [END_TIME],  [INTERVIEW],   [MAJOR_ID], [STAGE_ID], [EXAM_ID]) VALUES (N'9h', N'9h30',  N'95',  5, 5, 5)
INSERT [dbo].[STAGEDETAILS] ([STAR_TIME], [END_TIME],  [INTERVIEW],   [MAJOR_ID], [STAGE_ID], [EXAM_ID]) VALUES (N'3h15', N'4h',  N'78',  4, 7, 4)
INSERT [dbo].[STAGEDETAILS] ([STAR_TIME], [END_TIME],  [INTERVIEW],   [MAJOR_ID], [STAGE_ID], [EXAM_ID]) VALUES (N'9h', N'9h50',  N'98',  2, 9, 4)
INSERT [dbo].[STAGEDETAILS] ([STAR_TIME], [END_TIME],  [INTERVIEW],   [MAJOR_ID], [STAGE_ID], [EXAM_ID]) VALUES (N'8h30', N'9h15',  N'98',  3, 3, 2)



































