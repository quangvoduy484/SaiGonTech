/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2/19/2019 1:41:50 PM                         */
/*==============================================================*/


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
   ID                   int                  not null,
   MAJOR_ID             int                  not null,
   CATALOG_ID           int                  not null,
   DISTRICT_ID          int                  not null,
   EDUCATION_ID         int                  not null,
   YEAR_ID              int                  null,
   TYPE_ID              int                  not null,
   INTAKE_ID            int                  not null,
   SEM_ID               int                  null,
   DIS_DISTRICT_ID      int                  not null,
   CANDIDATE_ID         varchar(50)          not null,
   LASTNAME             varchar(100)         not null,
   FIRSTNAME            varchar(100)         not null,
   BIRTHDAY             datetime             not null,
   GENDER               int                  not null,
   PHONENUMBER          varchar(10)          not null,
   ADDRESS              varchar(200)         null,
   MARITALSTATUS        int                  null,
   HIGHSCHOOLNAME       varchar(200)         null,
   HIGHSCHOOLCITY       varchar(200)         null,
   GRADUATEYEAR         int                  null,
   REGISTRYDATE         datetime             not null,
   EMAIL                varchar(100)         not null,
   IDCARD               varchar(20)          not null,
   FINALRESULT          bit                  null,
   DOCUMENTCODE         varchar(50)          null,
   constraint PK_CANDIDATE primary key nonclustered (ID)
)
go

/*==============================================================*/
/* Index: OF1_FK                                                */
/*==============================================================*/
create index OF1_FK on CANDIDATE (
TYPE_ID ASC
)
go

/*==============================================================*/
/* Index: HAS3_FK                                               */
/*==============================================================*/
create index HAS3_FK on CANDIDATE (
EDUCATION_ID ASC
)
go

/*==============================================================*/
/* Index: LIVE_IN_FK                                            */
/*==============================================================*/
create index LIVE_IN_FK on CANDIDATE (
DIS_DISTRICT_ID ASC
)
go

/*==============================================================*/
/* Index: HOMETOWN_IN_FK                                        */
/*==============================================================*/
create index HOMETOWN_IN_FK on CANDIDATE (
DISTRICT_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_21_FK on CANDIDATE (
INTAKE_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_24_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_24_FK on CANDIDATE (
CATALOG_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_27_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_27_FK on CANDIDATE (
YEAR_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_28_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_28_FK on CANDIDATE (
SEM_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_29_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_29_FK on CANDIDATE (
MAJOR_ID ASC
)
go

/*==============================================================*/
/* Table: CANDIDATEDOCUMENT                                     */
/*==============================================================*/
create table CANDIDATEDOCUMENT (
   NOTE                 text                 null,
   ID_NOTE              numeric(11)          identity,
   DOC_ID               int                  not null,
   ID                   int                  not null,
   constraint PK_CANDIDATEDOCUMENT primary key nonclustered (ID_NOTE)
)
go

/*==============================================================*/
/* Index: HAS8_FK                                               */
/*==============================================================*/
create index HAS8_FK on CANDIDATEDOCUMENT (
ID ASC
)
go

/*==============================================================*/
/* Index: OF9_FK                                                */
/*==============================================================*/
create index OF9_FK on CANDIDATEDOCUMENT (
DOC_ID ASC
)
go

/*==============================================================*/
/* Table: CANDIDATETYPE                                         */
/*==============================================================*/
create table CANDIDATETYPE (
   TYPE_ID              int                  not null,
   TYPENAME             varchar(200)         not null,
   constraint PK_CANDIDATETYPE primary key nonclustered (TYPE_ID)
)
go

/*==============================================================*/
/* Table: CATALOG                                               */
/*==============================================================*/
create table CATALOG (
   CATALOG_ID           int                  not null,
   BEGINYEAR            int                  not null,
   ENDYEAR              int                  not null,
   constraint PK_CATALOG primary key nonclustered (CATALOG_ID)
)
go

/*==============================================================*/
/* Table: COUNTRY                                               */
/*==============================================================*/
create table COUNTRY (
   COUNTRY_ID           int                  not null,
   COUNTRYNAME          varchar(200)         not null,
   constraint PK_COUNTRY primary key nonclustered (COUNTRY_ID)
)
go

/*==============================================================*/
/* Table: DISTRICT                                              */
/*==============================================================*/
create table DISTRICT (
   DISTRICT_ID          int                  not null,
   PROVINCE_ID          int                  not null,
   DISTRICTNAME         varchar(100)         not null,
   constraint PK_DISTRICT primary key nonclustered (DISTRICT_ID)
)
go

/*==============================================================*/
/* Index: OF4_FK                                                */
/*==============================================================*/
create index OF4_FK on DISTRICT (
PROVINCE_ID ASC
)
go

/*==============================================================*/
/* Table: DOCUMENT                                              */
/*==============================================================*/
create table DOCUMENT (
   DOC_ID               int                  not null,
   NAMEINENGLISH        varchar(100)         not null,
   NAMEINVIETNAMESE     varchar(100)         not null,
   SEQUENCENUM          int                  not null,
   INPUTTYPE            int                  not null,
   STATUS               int                  not null,
   NOTE                 text                 null,
   constraint PK_DOCUMENT primary key nonclustered (DOC_ID)
)
go

/*==============================================================*/
/* Table: EDUCATION                                             */
/*==============================================================*/
create table EDUCATION (
   EDUCATION_ID         int                  not null,
   EDUCATIONNAME        varchar(200)         not null,
   constraint PK_EDUCATION primary key nonclustered (EDUCATION_ID)
)
go

/*==============================================================*/
/* Table: EXAMSUBJECT                                           */
/*==============================================================*/
create table EXAMSUBJECT (
   EXAM_ID              int                  not null,
   EXAMNAME             varchar(100)         not null,
   constraint PK_EXAMSUBJECT primary key nonclustered (EXAM_ID)
)
go

/*==============================================================*/
/* Table: INTAKE                                                */
/*==============================================================*/
create table INTAKE (
   INTAKE_ID            int                  not null,
   INTAKENAME           varchar(200)         not null,
   constraint PK_INTAKE primary key nonclustered (INTAKE_ID)
)
go

/*==============================================================*/
/* Table: MAJOR                                                 */
/*==============================================================*/
create table MAJOR (
   MAJOR_ID             int                  not null,
   MAJOR_NAME           varchar(200)         null,
   constraint PK_MAJOR primary key nonclustered (MAJOR_ID)
)
go

/*==============================================================*/
/* Table: PARAMETER                                             */
/*==============================================================*/
create table PARAMETER (
   YEAR_ID              int                  not null,
   SEM_ID               int                  not null,
   INTAKE_ID            int                  not null,
   SIGNATURENAME        varchar(200)         not null,
   MORECONTACT          varchar(200)         not null,
   DOCUMENTCODE         varchar(50)          not null
)
go

/*==============================================================*/
/* Index: IN2_FK                                                */
/*==============================================================*/
create index IN2_FK on PARAMETER (
INTAKE_ID ASC
)
go

/*==============================================================*/
/* Index: IN1_FK                                                */
/*==============================================================*/
create index IN1_FK on PARAMETER (
YEAR_ID ASC
)
go

/*==============================================================*/
/* Index: IN3_FK                                                */
/*==============================================================*/
create index IN3_FK on PARAMETER (
SEM_ID ASC
)
go

/*==============================================================*/
/* Table: PROVINCE                                              */
/*==============================================================*/
create table PROVINCE (
   PROVINCE_ID          int                  not null,
   COUNTRY_ID           int                  not null,
   PROVINCENAME         varchar(200)         not null,
   constraint PK_PROVINCE primary key nonclustered (PROVINCE_ID)
)
go

/*==============================================================*/
/* Index: OF5_FK                                                */
/*==============================================================*/
create index OF5_FK on PROVINCE (
COUNTRY_ID ASC
)
go

/*==============================================================*/
/* Table: SCORE_EXAM                                            */
/*==============================================================*/
create table SCORE_EXAM (
   SUMSCORE             decimal              null,
   SCOREPASS            decimal              null,
   SCORE_ID             int                  not null,
   EXAM_ID              int                  not null,
   MAJOR_ID             int                  not null,
   constraint PK_SCORE_EXAM primary key nonclustered (SCORE_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_22_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_22_FK on SCORE_EXAM (
EXAM_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_23_FK on SCORE_EXAM (
MAJOR_ID ASC
)
go

/*==============================================================*/
/* Table: SEMESTER                                              */
/*==============================================================*/
create table SEMESTER (
   SEM_ID               int                  not null,
   SEMESTERNAME         varchar(200)         not null,
   constraint PK_SEMESTER primary key nonclustered (SEM_ID)
)
go

/*==============================================================*/
/* Table: STAGE                                                 */
/*==============================================================*/
create table STAGE (
   STAGE_ID             int                  not null,
   SEM_ID               int                  not null,
   YEAR_ID              int                  not null,
   STAGENAME            varchar(200)         not null,
   DATETIME             datetime             not null,
   EXAMDATE             datetime             not null,
   EXAMTIME             varchar(50)          not null,
   ENGLISHTIMEEXAM      varchar(20)          null,
   constraint PK_STAGE primary key nonclustered (STAGE_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_19_FK on STAGE (
YEAR_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_20_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_20_FK on STAGE (
SEM_ID ASC
)
go

/*==============================================================*/
/* Table: STAGEDETAILS                                          */
/*==============================================================*/
create table STAGEDETAILS (
   STAR_TIME            varchar(50)          not null,
   END_TIME             varchar(50)          not null,
   SCORE                decimal              not null,
   INTERVIEW            varchar(200)         null,
   SUBJECT              varchar(200)         not null,
   STAGE_DETAILS_ID     int                  not null,
   ID                   int                  not null,
   MAJOR_ID             int                  not null,
   STAGE_ID             int                  not null,
   EXAM_ID              int                  not null,
   constraint PK_STAGEDETAILS primary key nonclustered (STAGE_DETAILS_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_17_FK on STAGEDETAILS (
STAGE_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_18_FK on STAGEDETAILS (
ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_25_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_25_FK on STAGEDETAILS (
EXAM_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_26_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_26_FK on STAGEDETAILS (
MAJOR_ID ASC
)
go

/*==============================================================*/
/* Table: YEAR                                                  */
/*==============================================================*/
create table YEAR (
   YEAR_ID              int                  not null,
   YEARNAME             int                  not null,
   constraint PK_YEAR primary key nonclustered (YEAR_ID)
)
go

alter table CANDIDATE
   add constraint FK_CANDIDAT_HAS3_EDUCATIO foreign key (EDUCATION_ID)
      references EDUCATION (EDUCATION_ID)
go

alter table CANDIDATE
   add constraint FK_CANDIDAT_HOMETOWN__DISTRICT foreign key (DISTRICT_ID)
      references DISTRICT (DISTRICT_ID)
go

alter table CANDIDATE
   add constraint FK_CANDIDAT_LIVE_IN_DISTRICT foreign key (DIS_DISTRICT_ID)
      references DISTRICT (DISTRICT_ID)
go

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
   add constraint FK_CANDIDAT_HAS8_CANDIDAT foreign key (ID)
      references CANDIDATE (ID)
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

alter table STAGEDETAILS
   add constraint FK_STAGEDET_RELATIONS_CANDIDAT foreign key (ID)
      references CANDIDATE (ID)
go

alter table STAGEDETAILS
   add constraint FK_STAGEDET_RELATIONS_EXAMSUBJ foreign key (EXAM_ID)
      references EXAMSUBJECT (EXAM_ID)
go

alter table STAGEDETAILS
   add constraint FK_STAGEDET_RELATIONS_MAJOR foreign key (MAJOR_ID)
      references MAJOR (MAJOR_ID)
go

