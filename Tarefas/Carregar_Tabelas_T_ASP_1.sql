/*==============================================================*/
/* Table: AUTOR                                            */
/*==============================================================*/
Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (1,'Thomas M. Connolly')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (2,'Carolyn E. Begg ')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (4,'Jane Grimson')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (5,'Pedro Nogueira Ramos')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (6,'Paul Graham')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (7,'Carlos A. Coelho Coelho')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (8,'Gary B. Lamont')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (9,'David A. Van Veldhuizen ')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (10,'Alaine England')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (11,'Andy Finney ')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (12,'Nuno Ribeiro ')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (13,'Jakob Nielsen ')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (14,'Peter G. W. Keen ')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (15,'Carlo Batini')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (16,'Stefano Ceri')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (17,'Shamkant B. Navathe ')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (18,'Harold Abelson')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (19,'Gerald Jay Sussman')

Insert into AUTOR (IDAUTOR,NOMEAUTOR)
Values (20,'With Julie Sussman ')



/*==============================================================*/
/* Table: PUBLICACAO                                            */
/*==============================================================*/
Insert into PUBLICACAO (IDPUBLICACAO,NOMEPUBLICACAO)
Values (1,'Harlow : Addison - Wesley')

Insert into PUBLICACAO (IDPUBLICACAO,NOMEPUBLICACAO)
Values (2,'Redwood City : The Benjamin')

Insert into PUBLICACAO (IDPUBLICACAO,NOMEPUBLICACAO)
Values (3,'Lisboa : FCA - Editora Informática')

Insert into PUBLICACAO (IDPUBLICACAO,NOMEPUBLICACAO)
Values (4,'Lisboa : Edições Sílabo')

Insert into PUBLICACAO (IDPUBLICACAO,NOMEPUBLICACAO)
Values (5,'New Jersey : Prentice-Hall')

Insert into PUBLICACAO (IDPUBLICACAO,NOMEPUBLICACAO)
Values (6,'New York : Springer')

Insert into PUBLICACAO (IDPUBLICACAO,NOMEPUBLICACAO)
Values (7,'Philadelphia : Society for Industrial')

Insert into PUBLICACAO (IDPUBLICACAO,NOMEPUBLICACAO)
Values (8,'San Diego : Morgan Kaufmann')



/*==============================================================*/
/* Table: TIPO                                                  */
/*==============================================================*/
Insert into TIPO (IDTIPO,DESCRICAO)
Values ('004.65','Bases de Dados')

Insert into TIPO (IDTIPO,DESCRICAO)
Values ('004.42','Programação')

Insert into TIPO (IDTIPO,DESCRICAO)
Values ('004.56','Multimédia')



/*==============================================================*/
/* Table: LIVROS                                            */
/*==============================================================*/
Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('Database systems : A practical approach to design, Implementation, and management ',2005,'978-0-321-21025-8',1,'004.65',1)

Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('Conceptual database design : An entity - relationship approach ',2006,'0-8053-0244-1 ',2,'004.65',2)

Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('Distributed database systemas ',2004,'0-201-54400-8',1,'004.65',3)

Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('Desenhar bases de dados com UML',2007,'972-618-434-7',2,'004.65',4)

Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('ANSI common lisp',2005,'0-13-370875-6',2,'004.42',5)

Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('Evolutionary algorithms for solving multi-objective problems ',2006,'978-0-387-33254-3',5,'004.42',6)

Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('Combinatorial data analysis : Optimization by dynamic programming ',2001,'0-89871-478-8',6,'004.42',7)

Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('Structure and interpretation of computer programs ',null,'0-262-51087-1',7,'004.42',8)

Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('Managing interactive media : Project management for web and digital media ',2007,'0-321-43693-8',1,'004.56',9)

Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('Multimédia e tecnologias interactivas ',2004,'972-722-415-6',8,'004.56',10)

Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('Multimedia and hypertext : the internet and beyond ',1995,'0-12-518408-5',7,'004.56',11)

Insert into LIVROS (TITULO,ANOPUBLICACAO,ISBN,IDPUBLICACAO,IDTipo,IDLIVRO)
Values ('Business multimedia explained : a managers guide to key terms and concepts ',1997,'0-87584-772-2',7,'004.56',12)



/*==============================================================*/
/* Table: AUTORLIVRO                                            */
/*==============================================================*/
Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (1,1)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (2,1)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (4,3)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (5,4)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (6,5)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (7,6)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (8,6)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (9,6)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (10,9)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (11,9)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (12,10)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (13,11)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (14,12)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (15,2)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (16,2)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (17,2)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (18,8)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (19,8)

Insert into AUTORLIVRO (IDAUTOR,IDLIVRO)
Values (20,8)



/*==============================================================*/
/* Table: FACTURASLIVROS                                        */
/*==============================================================*/
Insert into FACTURASLIVROS (IDFACTURA,DATAFACTURA,TOTALFACTURA)
Values (1,'2006-02-01','25,2')

Insert into FACTURASLIVROS (IDFACTURA,DATAFACTURA,TOTALFACTURA)
Values (2,'2007-10-25',27)

Insert into FACTURASLIVROS (IDFACTURA,DATAFACTURA,TOTALFACTURA)
Values (3,'2007-09-30',89)

Insert into FACTURASLIVROS (IDFACTURA,DATAFACTURA,TOTALFACTURA)
Values (4,'2007-09-20',46)

Insert into FACTURASLIVROS (IDFACTURA,DATAFACTURA,TOTALFACTURA)
Values (5,'2007-01-15',75)

Insert into FACTURASLIVROS (IDFACTURA,DATAFACTURA,TOTALFACTURA)
Values (6,'2007-02-08',51)

Insert into FACTURASLIVROS (IDFACTURA,DATAFACTURA,TOTALFACTURA)
Values (7,'2007-03-12',56)

Insert into FACTURASLIVROS (IDFACTURA,DATAFACTURA,TOTALFACTURA)
Values (8,'2006-10-04','80,2')



/*==============================================================*/
/* Table: LINHASFACTURA                                         */
/*==============================================================*/
Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (1,1,1,'25,2')

Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (2,7,1,30)

Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (3,5,1,40)

Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (4,5,1,35)

Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (5,8,1,30)

Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (6,2,1,27)

Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (7,7,1,26)

Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (8,8,1,'50,2')

Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (9,4,2,23)

Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (10,3,1,37)

Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (11,6,1,51)

Insert into LINHASFACTURA (IDLIVRO,IDFACTURA,QUANTIDADE,PRECO)
Values (12,3,1,52)

