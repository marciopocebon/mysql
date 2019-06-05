-- Comentários
-- A linha abaixo cria um novo banco de dados
create database agenda;
-- A linha abaixo seleciona o banco de dados
use agenda;
-- A linha abaixo cria uma tabela
create table tb_contatos(
id int primary key,
nome varchar(50) not null,
fone varchar(15) not null,
email varchar(50)
);
-- a linha abaixo exibe as tabelas:
show tables;
-- a linha abaixo descreve a tabela:
describe tb_contatos;

-- inserindo dados na tabela (CRUD - Create)
insert into tb_contatos(id,nome,fone,email)
values(1,'Bill Gates','1111-1111','bill@outlook.com');
insert into tb_contatos(id,nome,fone,email)
values(2,'Linus Torvalds','2222-2222','linus@gmai.com');
insert into tb_contatos(id,nome,fone,email)
values(3,'Bruna Marquesine','3333-3333','bruninha@gmail.com');
insert into tb_contatos(id,nome,fone)
values(4,'Bruce Dickinson','6666-6666');
insert into tb_contatos(id,nome,fone,email)
values(5,'Tony Stark','5555-5555','ts@gmail.com');

-- pesquisando dados na tabela (CRUD - Read)
-- selecionando todos os registros da tabela
select * from tb_contatos;
-- selecionando registros de acordo com um critério
select * from tb_contatos where id = 2;
select * from tb_contatos where nome = 'Bill Gates';
select * from tb_contatos where nome like 'B%';
-- selecionar por ordem alfabética (asc ou desc)
select * from tb_contatos order by nome asc;
select nome,fone from tb_contatos;
-- criando um relatório personalizado
select nome as contato, fone as telefone from tb_contatos;

-- alterando dados na tabela (CRUD - Update)
update tb_contatos set nome='Willian Gates' where id = 1;
update tb_contatos set email='ironmaidem@gmail.com' where id = 4;
update tb_contatos set fone='9999-1234', email='linus@tux.com' where id = 2;

-- removendo registros da tabela (CRUD - Delete)
delete from tb_contatos where id = 2;








