Drop table LINHASFACTURA
Drop table FACTURASLIVROS
Drop table AUTORLIVRO 
Drop table LIVROS
Drop table TIPO
Drop table PUBLICACAO
Drop table AUTOR 

/*==============================================================*/
/* Table: AUTOR                                            */
/*==============================================================*/
create table AUTOR  (
   IDAUTOR       INT  constraint PK_AUTOR primary key,
   NOMEAUTOR     VARCHAR(50),
   )


/*==============================================================*/
/* Table: PUBLICACAO                                            */
/*==============================================================*/
create table PUBLICACAO  (
   IDPUBLICACAO         INT constraint PK_PUBLICACAO primary key,
   NOMEPUBLICACAO       VARCHAR(50),
)

/*==============================================================*/
/* Table: TIPO                                                  */
/*==============================================================*/
create table TIPO  (
   IDTIPO               VARCHAR(10) constraint PK_CDU primary key,
   DESCRICAO            VARCHAR(50),
)

/*==============================================================*/
/* Table: LIVROS                                            */
/*==============================================================*/
create table LIVROS  (
   IDLIVRO              INT constraint PK_LIVROS primary key,
   TITULO               VARCHAR(250),
   ANOPUBLICACAO        INT,
   ISBN                 VARCHAR(17),
   IDPUBLICACAO         INT references PUBLICACAO (IDPUBLICACAO),
   IDTIPO               VARCHAR(10) references TIPO (IDTIPO),
)

/*==============================================================*/
/* Table: AUTORLIVRO                                            */
/*==============================================================*/
create table AUTORLIVRO  (
   IDAUTOR       INT references AUTOR (IDAUTOR),
   IDLIVRO       INT references LIVROS (IDLIVRO),
   constraint PK_AUTORLIVRO primary key (IDAUTOR, IDLIVRO)
)


/*==============================================================*/
/* Table: FACTURASLIVROS                                        */
/*==============================================================*/
create table FACTURASLIVROS  (
   IDFACTURA            INT constraint PK_FACTURASLIVROS primary key,
   DATAFACTURA          DATE,
   TOTALFACTURA         MONEY,
)


/*==============================================================*/
/* Table: LINHASFACTURA                                         */
/*==============================================================*/
create table LINHASFACTURA  (
   IDLIVRO              INT references LIVROS (IDLIVRO),
   IDFACTURA            INT references FACTURASLIVROS (IDFACTURA),
   QUANTIDADE           INT,
   PRECO                MONEY,
   constraint PK_LINHASFACTURA primary key (IDLIVRO, IDFACTURA)
)