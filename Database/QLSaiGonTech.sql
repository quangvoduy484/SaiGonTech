/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     17/2/2019 1:43:15 PM                         */
/*==============================================================*/

create database  QL_HocVien
use QL_HocVien

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
   where r.fkeyid = object_id('CANDIDATE_SINHVIEN') and o.name = 'FK_CANDIDAT_HAS3_EDUCATIO')
alter table CANDIDATE_SINHVIEN
   drop constraint FK_CANDIDAT_HAS3_EDUCATIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE_SINHVIEN') and o.name = 'FK_CANDIDAT_HOMETOWN__DISTRICT')
alter table CANDIDATE_SINHVIEN
   drop constraint FK_CANDIDAT_HOMETOWN__DISTRICT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE_SINHVIEN') and o.name = 'FK_CANDIDAT_LIVE_IN_DISTRICT')
alter table CANDIDATE_SINHVIEN
   drop constraint FK_CANDIDAT_LIVE_IN_DISTRICT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE_SINHVIEN') and o.name = 'FK_CANDIDAT_OF1_CANDIDAT')
alter table CANDIDATE_SINHVIEN
   drop constraint FK_CANDIDAT_OF1_CANDIDAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE_SINHVIEN') and o.name = 'FK_CANDIDAT_RELATIONS_INTAKE_K')
alter table CANDIDATE_SINHVIEN
   drop constraint FK_CANDIDAT_RELATIONS_INTAKE_K
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE_SINHVIEN') and o.name = 'FK_CANDIDAT_RELATIONS_CATALOG_')
alter table CANDIDATE_SINHVIEN
   drop constraint FK_CANDIDAT_RELATIONS_CATALOG_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE_SINHVIEN') and o.name = 'FK_CANDIDAT_RELATIONS_YEAR_NAM')
alter table CANDIDATE_SINHVIEN
   drop constraint FK_CANDIDAT_RELATIONS_YEAR_NAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANDIDATE_SINHVIEN') and o.name = 'FK_CANDIDAT_RELATIONS_SEMESTER')
alter table CANDIDATE_SINHVIEN
   drop constraint FK_CANDIDAT_RELATIONS_SEMESTER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETDOTTUYENSINH') and o.name = 'FK_CHITIETD_RELATIONS_STAGE_DO')
alter table CHITIETDOTTUYENSINH
   drop constraint FK_CHITIETD_RELATIONS_STAGE_DO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETDOTTUYENSINH') and o.name = 'FK_CHITIETD_RELATIONS_CANDIDAT')
alter table CHITIETDOTTUYENSINH
   drop constraint FK_CHITIETD_RELATIONS_CANDIDAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETDOTTUYENSINH') and o.name = 'FK_CHITIETD_RELATIONS_EXAMNAME')
alter table CHITIETDOTTUYENSINH
   drop constraint FK_CHITIETD_RELATIONS_EXAMNAME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETDOTTUYENSINH') and o.name = 'FK_CHITIETD_RELATIONS_MAJOR')
alter table CHITIETDOTTUYENSINH
   drop constraint FK_CHITIETD_RELATIONS_MAJOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DISTRICT') and o.name = 'FK_DISTRICT_OF4_PROVINCE')
alter table DISTRICT
   drop constraint FK_DISTRICT_OF4_PROVINCE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MAJOR') and o.name = 'FK_MAJOR_RELATIONS_CANDIDAT')
alter table MAJOR
   drop constraint FK_MAJOR_RELATIONS_CANDIDAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PARAMETER_MAUNHAPLIEU') and o.name = 'FK_PARAMETE_IN1_YEAR_NAM')
alter table PARAMETER_MAUNHAPLIEU
   drop constraint FK_PARAMETE_IN1_YEAR_NAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PARAMETER_MAUNHAPLIEU') and o.name = 'FK_PARAMETE_IN2_INTAKE_K')
alter table PARAMETER_MAUNHAPLIEU
   drop constraint FK_PARAMETE_IN2_INTAKE_K
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PARAMETER_MAUNHAPLIEU') and o.name = 'FK_PARAMETE_IN3_SEMESTER')
alter table PARAMETER_MAUNHAPLIEU
   drop constraint FK_PARAMETE_IN3_SEMESTER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PROVINCE') and o.name = 'FK_PROVINCE_OF5_NATION')
alter table PROVINCE
   drop constraint FK_PROVINCE_OF5_NATION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SCORE_EXAM') and o.name = 'FK_SCORE_EX_RELATIONS_EXAMNAME')
alter table SCORE_EXAM
   drop constraint FK_SCORE_EX_RELATIONS_EXAMNAME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SCORE_EXAM') and o.name = 'FK_SCORE_EX_RELATIONS_MAJOR')
alter table SCORE_EXAM
   drop constraint FK_SCORE_EX_RELATIONS_MAJOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STAGE_DOTTUYENSINH') and o.name = 'FK_STAGE_DO_RELATIONS_YEAR_NAM')
alter table STAGE_DOTTUYENSINH
   drop constraint FK_STAGE_DO_RELATIONS_YEAR_NAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STAGE_DOTTUYENSINH') and o.name = 'FK_STAGE_DO_RELATIONS_SEMESTER')
alter table STAGE_DOTTUYENSINH
   drop constraint FK_STAGE_DO_RELATIONS_SEMESTER
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
            from  sysindexes
           where  id    = object_id('CANDIDATE_SINHVIEN')
            and   name  = 'RELATIONSHIP_28_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE_SINHVIEN.RELATIONSHIP_28_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE_SINHVIEN')
            and   name  = 'RELATIONSHIP_27_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE_SINHVIEN.RELATIONSHIP_27_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE_SINHVIEN')
            and   name  = 'RELATIONSHIP_24_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE_SINHVIEN.RELATIONSHIP_24_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE_SINHVIEN')
            and   name  = 'RELATIONSHIP_21_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE_SINHVIEN.RELATIONSHIP_21_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE_SINHVIEN')
            and   name  = 'HOMETOWN_IN_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE_SINHVIEN.HOMETOWN_IN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE_SINHVIEN')
            and   name  = 'LIVE_IN_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE_SINHVIEN.LIVE_IN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE_SINHVIEN')
            and   name  = 'HAS3_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE_SINHVIEN.HAS3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANDIDATE_SINHVIEN')
            and   name  = 'OF1_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANDIDATE_SINHVIEN.OF1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CANDIDATE_SINHVIEN')
            and   type = 'U')
   drop table CANDIDATE_SINHVIEN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CATALOG_NIENKHOA')
            and   type = 'U')
   drop table CATALOG_NIENKHOA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETDOTTUYENSINH')
            and   name  = 'RELATIONSHIP_29_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETDOTTUYENSINH.RELATIONSHIP_29_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETDOTTUYENSINH')
            and   name  = 'RELATIONSHIP_25_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETDOTTUYENSINH.RELATIONSHIP_25_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETDOTTUYENSINH')
            and   name  = 'RELATIONSHIP_18_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETDOTTUYENSINH.RELATIONSHIP_18_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETDOTTUYENSINH')
            and   name  = 'RELATIONSHIP_17_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETDOTTUYENSINH.RELATIONSHIP_17_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETDOTTUYENSINH')
            and   type = 'U')
   drop table CHITIETDOTTUYENSINH
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
           where  id = object_id('EXAMNAME_MONTHI')
            and   type = 'U')
   drop table EXAMNAME_MONTHI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('INTAKE_KHOAHOC')
            and   type = 'U')
   drop table INTAKE_KHOAHOC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MAJOR')
            and   name  = 'RELATIONSHIP_26_FK'
            and   indid > 0
            and   indid < 255)
   drop index MAJOR.RELATIONSHIP_26_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MAJOR')
            and   type = 'U')
   drop table MAJOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NATION')
            and   type = 'U')
   drop table NATION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PARAMETER_MAUNHAPLIEU')
            and   name  = 'IN3_FK'
            and   indid > 0
            and   indid < 255)
   drop index PARAMETER_MAUNHAPLIEU.IN3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PARAMETER_MAUNHAPLIEU')
            and   name  = 'IN1_FK'
            and   indid > 0
            and   indid < 255)
   drop index PARAMETER_MAUNHAPLIEU.IN1_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PARAMETER_MAUNHAPLIEU')
            and   name  = 'IN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PARAMETER_MAUNHAPLIEU.IN2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PARAMETER_MAUNHAPLIEU')
            and   type = 'U')
   drop table PARAMETER_MAUNHAPLIEU
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
           where  id = object_id('SEMESTER_HOCKY')
            and   type = 'U')
   drop table SEMESTER_HOCKY
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STAGE_DOTTUYENSINH')
            and   name  = 'RELATIONSHIP_20_FK'
            and   indid > 0
            and   indid < 255)
   drop index STAGE_DOTTUYENSINH.RELATIONSHIP_20_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STAGE_DOTTUYENSINH')
            and   name  = 'RELATIONSHIP_19_FK'
            and   indid > 0
            and   indid < 255)
   drop index STAGE_DOTTUYENSINH.RELATIONSHIP_19_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STAGE_DOTTUYENSINH')
            and   type = 'U')
   drop table STAGE_DOTTUYENSINH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YEAR_NAMHOC')
            and   type = 'U')
   drop table YEAR_NAMHOC
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
   TYPENAME             varchar(20)          not null,
   constraint PK_CANDIDATETYPE primary key nonclustered (TYPE_ID)
)
go

/*==============================================================*/
/* Table: CANDIDATE_SINHVIEN                                    */
/*==============================================================*/
create table CANDIDATE_SINHVIEN (
   ID                   int                  not null,
   CATALOG_ID           int                  not null,
   DISTRICT_ID          int                  not null,
   EDUCATION_ID         int                  not null,
   YEAR_ID              int                  null,
   TYPE_ID              int                  not null,
   INTAKE_ID            int                  not null,
   SEM_ID               int                  null,
   DIS_DISTRICT_ID      int                  not null,
   CANDIDATE_ID         varchar(20)          not null,
   LASTNAME             varchar(20)          not null,
   FIRSTNAME            varchar(20)          not null,
   BIRTHDAY             datetime             not null,
   GENDER               int                  not null,
   PHONENUMBER          varchar(10)          not null,
   ADDRESS              varchar(20)          null,
   MARITALSTATUS        int                  null,
   HIGHSCHOOLNAME       varchar(50)          null,
   HIGHSCHOOLCITY       varchar(40)          null,
   GRADUATEYEAR         int                  null,
   REGISTRYDATE         datetime             not null,
   EMAIL                varchar(50)          not null,
   IDCARD               varchar(9)           not null,
   FINALRESULT          bit                  null,
   DOCUMENTCODE         varchar(20)          null,
   constraint PK_CANDIDATE_SINHVIEN primary key nonclustered (ID)
)
go

/*==============================================================*/
/* Index: OF1_FK                                                */
/*==============================================================*/
create index OF1_FK on CANDIDATE_SINHVIEN (
TYPE_ID ASC
)
go

/*==============================================================*/
/* Index: HAS3_FK                                               */
/*==============================================================*/
create index HAS3_FK on CANDIDATE_SINHVIEN (
EDUCATION_ID ASC
)
go

/*==============================================================*/
/* Index: LIVE_IN_FK                                            */
/*==============================================================*/
create index LIVE_IN_FK on CANDIDATE_SINHVIEN (
DIS_DISTRICT_ID ASC
)
go

/*==============================================================*/
/* Index: HOMETOWN_IN_FK                                        */
/*==============================================================*/
create index HOMETOWN_IN_FK on CANDIDATE_SINHVIEN (
DISTRICT_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_21_FK on CANDIDATE_SINHVIEN (
INTAKE_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_24_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_24_FK on CANDIDATE_SINHVIEN (
CATALOG_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_27_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_27_FK on CANDIDATE_SINHVIEN (
YEAR_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_28_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_28_FK on CANDIDATE_SINHVIEN (
SEM_ID ASC
)
go

/*==============================================================*/
/* Table: CATALOG_NIENKHOA                                      */
/*==============================================================*/
create table CATALOG_NIENKHOA (
   CATALOG_ID           int                  not null,
   BEGINYEAR            int                  not null,
   ENDYEAR              int                  not null,
   constraint PK_CATALOG_NIENKHOA primary key nonclustered (CATALOG_ID)
)
go

/*==============================================================*/
/* Table: CHITIETDOTTUYENSINH                                   */
/*==============================================================*/
create table CHITIETDOTTUYENSINH (
   STAGE_ID             int                  not null,
   ID                   int                  not null,
   EXAM_ID              int                  not null,
   MAJOR_ID2            varchar(20)          not null,
   STAR_TIME            datetime             null,
   END_TIME             datetime             null,
   SCORE                decimal              null,
   INTERVIEW            varchar(100)         null,
   MONTHI               varchar(50)          null,
   constraint PK_CHITIETDOTTUYENSINH primary key (STAGE_ID, ID, EXAM_ID, MAJOR_ID2)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_17_FK on CHITIETDOTTUYENSINH (
STAGE_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_18_FK on CHITIETDOTTUYENSINH (
ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_25_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_25_FK on CHITIETDOTTUYENSINH (
EXAM_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_29_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_29_FK on CHITIETDOTTUYENSINH (
MAJOR_ID2 ASC
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
   EDUCATIONNAME        varchar(20)          not null,
   constraint PK_EDUCATION primary key nonclustered (EDUCATION_ID)
)
go

/*==============================================================*/
/* Table: EXAMNAME_MONTHI                                       */
/*==============================================================*/
create table EXAMNAME_MONTHI (
   EXAM_ID              int                  not null,
   EXAMNAME             varchar(100)         not null,
   constraint PK_EXAMNAME_MONTHI primary key nonclustered (EXAM_ID)
)
go

/*==============================================================*/
/* Table: INTAKE_KHOAHOC                                        */
/*==============================================================*/
create table INTAKE_KHOAHOC (
   INTAKE_ID            int                  not null,
   INTAKENAME           varchar(200)         not null,
   constraint PK_INTAKE_KHOAHOC primary key nonclustered (INTAKE_ID)
)
go

/*==============================================================*/
/* Table: MAJOR                                                 */
/*==============================================================*/
create table MAJOR (
   MAJOR_ID2            varchar(20)          not null,
   ID                   int                  null,
   MAJOR_NAME           varchar(50)          null,
   constraint PK_MAJOR primary key nonclustered (MAJOR_ID2)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_26_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_26_FK on MAJOR (
ID ASC
)
go

/*==============================================================*/
/* Table: NATION                                                */
/*==============================================================*/
create table NATION (
   NATION_ID            int                  not null,
   NATIONNAME           varchar(20)          not null,
   constraint PK_NATION primary key nonclustered (NATION_ID)
)
go

/*==============================================================*/
/* Table: PARAMETER_MAUNHAPLIEU                                 */
/*==============================================================*/
create table PARAMETER_MAUNHAPLIEU (
   YEAR_ID              int                  not null,
   SEM_ID               int                  not null,
   INTAKE_ID            int                  not null,
   SIGNATURENAME        varchar(40)          not null,
   MORECONTACT          varchar(40)          not null,
   DOCUMENTCODE         varchar(20)          not null
)
go

/*==============================================================*/
/* Index: IN2_FK                                                */
/*==============================================================*/
create index IN2_FK on PARAMETER_MAUNHAPLIEU (
INTAKE_ID ASC
)
go

/*==============================================================*/
/* Index: IN1_FK                                                */
/*==============================================================*/
create index IN1_FK on PARAMETER_MAUNHAPLIEU (
YEAR_ID ASC
)
go

/*==============================================================*/
/* Index: IN3_FK                                                */
/*==============================================================*/
create index IN3_FK on PARAMETER_MAUNHAPLIEU (
SEM_ID ASC
)
go

/*==============================================================*/
/* Table: PROVINCE                                              */
/*==============================================================*/
create table PROVINCE (
   PROVINCE_ID          int                  not null,
   NATION_ID            int                  not null,
   PROVINCENAME         varchar(20)          not null,
   constraint PK_PROVINCE primary key nonclustered (PROVINCE_ID)
)
go

/*==============================================================*/
/* Index: OF5_FK                                                */
/*==============================================================*/
create index OF5_FK on PROVINCE (
NATION_ID ASC
)
go

/*==============================================================*/
/* Table: SCORE_EXAM                                            */
/*==============================================================*/
create table SCORE_EXAM (
   EXAM_ID              int                  not null,
   MAJOR_ID2            varchar(20)          not null,
   SUMSCORE             decimal              null,
   SCOREPASS            decimal              null,
   constraint PK_SCORE_EXAM primary key (EXAM_ID, MAJOR_ID2)
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
MAJOR_ID2 ASC
)
go

/*==============================================================*/
/* Table: SEMESTER_HOCKY                                        */
/*==============================================================*/
create table SEMESTER_HOCKY (
   SEM_ID               int                  not null,
   SEMESTERNAME         varchar(20)          not null,
   constraint PK_SEMESTER_HOCKY primary key nonclustered (SEM_ID)
)
go

/*==============================================================*/
/* Table: STAGE_DOTTUYENSINH                                    */
/*==============================================================*/
create table STAGE_DOTTUYENSINH (
   STAGE_ID             int                  not null,
   SEM_ID               int                  not null,
   YEAR_ID              int                  not null,
   STAGENAME            varchar(200)         not null,
   DATETIME             datetime             not null,
   EXAMDATE             datetime             not null,
   EXAMTIME             char(20)             not null,
   ENGLISHTIMEEXAM      char(20)             null,
   constraint PK_STAGE_DOTTUYENSINH primary key nonclustered (STAGE_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_19_FK on STAGE_DOTTUYENSINH (
YEAR_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_20_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_20_FK on STAGE_DOTTUYENSINH (
SEM_ID ASC
)
go

/*==============================================================*/
/* Table: YEAR_NAMHOC                                           */
/*==============================================================*/
create table YEAR_NAMHOC (
   YEAR_ID              int                  not null,
   YEARNAME             int                  not null,
   constraint PK_YEAR_NAMHOC primary key nonclustered (YEAR_ID)
)
go

alter table CANDIDATEDOCUMENT
   add constraint FK_CANDIDAT_HAS8_CANDIDAT foreign key (ID)
      references CANDIDATE_SINHVIEN (ID)
go

alter table CANDIDATEDOCUMENT
   add constraint FK_CANDIDAT_OF9_DOCUMENT foreign key (DOC_ID)
      references DOCUMENT (DOC_ID)
go

alter table CANDIDATE_SINHVIEN
   add constraint FK_CANDIDAT_HAS3_EDUCATIO foreign key (EDUCATION_ID)
      references EDUCATION (EDUCATION_ID)
go

alter table CANDIDATE_SINHVIEN
   add constraint FK_CANDIDAT_HOMETOWN__DISTRICT foreign key (DISTRICT_ID)
      references DISTRICT (DISTRICT_ID)
go

alter table CANDIDATE_SINHVIEN
   add constraint FK_CANDIDAT_LIVE_IN_DISTRICT foreign key (DIS_DISTRICT_ID)
      references DISTRICT (DISTRICT_ID)
go

alter table CANDIDATE_SINHVIEN
   add constraint FK_CANDIDAT_OF1_CANDIDAT foreign key (TYPE_ID)
      references CANDIDATETYPE (TYPE_ID)
go

alter table CANDIDATE_SINHVIEN
   add constraint FK_CANDIDAT_RELATIONS_INTAKE_K foreign key (INTAKE_ID)
      references INTAKE_KHOAHOC (INTAKE_ID)
go

alter table CANDIDATE_SINHVIEN
   add constraint FK_CANDIDAT_RELATIONS_CATALOG_ foreign key (CATALOG_ID)
      references CATALOG_NIENKHOA (CATALOG_ID)
go

alter table CANDIDATE_SINHVIEN
   add constraint FK_CANDIDAT_RELATIONS_YEAR_NAM foreign key (YEAR_ID)
      references YEAR_NAMHOC (YEAR_ID)
go

alter table CANDIDATE_SINHVIEN
   add constraint FK_CANDIDAT_RELATIONS_SEMESTER foreign key (SEM_ID)
      references SEMESTER_HOCKY (SEM_ID)
go

alter table CHITIETDOTTUYENSINH
   add constraint FK_CHITIETD_RELATIONS_STAGE_DO foreign key (STAGE_ID)
      references STAGE_DOTTUYENSINH (STAGE_ID)
go

alter table CHITIETDOTTUYENSINH
   add constraint FK_CHITIETD_RELATIONS_CANDIDAT foreign key (ID)
      references CANDIDATE_SINHVIEN (ID)
go

alter table CHITIETDOTTUYENSINH
   add constraint FK_CHITIETD_RELATIONS_EXAMNAME foreign key (EXAM_ID)
      references EXAMNAME_MONTHI (EXAM_ID)
go

alter table CHITIETDOTTUYENSINH
   add constraint FK_CHITIETD_RELATIONS_MAJOR foreign key (MAJOR_ID2)
      references MAJOR (MAJOR_ID2)
go

alter table DISTRICT
   add constraint FK_DISTRICT_OF4_PROVINCE foreign key (PROVINCE_ID)
      references PROVINCE (PROVINCE_ID)
go

alter table MAJOR
   add constraint FK_MAJOR_RELATIONS_CANDIDAT foreign key (ID)
      references CANDIDATE_SINHVIEN (ID)
go

alter table PARAMETER_MAUNHAPLIEU
   add constraint FK_PARAMETE_IN1_YEAR_NAM foreign key (YEAR_ID)
      references YEAR_NAMHOC (YEAR_ID)
go

alter table PARAMETER_MAUNHAPLIEU
   add constraint FK_PARAMETE_IN2_INTAKE_K foreign key (INTAKE_ID)
      references INTAKE_KHOAHOC (INTAKE_ID)
go

alter table PARAMETER_MAUNHAPLIEU
   add constraint FK_PARAMETE_IN3_SEMESTER foreign key (SEM_ID)
      references SEMESTER_HOCKY (SEM_ID)
go

alter table PROVINCE
   add constraint FK_PROVINCE_OF5_NATION foreign key (NATION_ID)
      references NATION (NATION_ID)
go

alter table SCORE_EXAM
   add constraint FK_SCORE_EX_RELATIONS_EXAMNAME foreign key (EXAM_ID)
      references EXAMNAME_MONTHI (EXAM_ID)
go

alter table SCORE_EXAM
   add constraint FK_SCORE_EX_RELATIONS_MAJOR foreign key (MAJOR_ID2)
      references MAJOR (MAJOR_ID2)
go

alter table STAGE_DOTTUYENSINH
   add constraint FK_STAGE_DO_RELATIONS_YEAR_NAM foreign key (YEAR_ID)
      references YEAR_NAMHOC (YEAR_ID)
go

alter table STAGE_DOTTUYENSINH
   add constraint FK_STAGE_DO_RELATIONS_SEMESTER foreign key (SEM_ID)
      references SEMESTER_HOCKY (SEM_ID)
go

