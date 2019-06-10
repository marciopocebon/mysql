-- case 2
-- projeto de uma loja virtual

create database loja;
use loja;
create table tb_clientes(
idCli int primary key auto_increment,
nomeCli varchar(50) not null,
foneCli varchar(15)
);

describe tb_clientes;

insert into tb_clientes (nomeCli,foneCli)
values('José de Assis','99999-9999');

select * from tb_clientes;

create table tb_vendas(
notaFiscal int primary key auto_increment,
produto varchar(200),
valor varchar(50),
cliente varchar(200));

-- o comando abaixo exibe as tabelas do banco de dados
show tables;

/*
	Criando uma tabela de produtos com uso de código de
	barras. O tipo de dados decimal é usado para números
    não inteiros
*/

create table tb_produtos(
codigoProduto varchar(100) primary key,
produto varchar(100) not null,
valor decimal(10,2) not null, -- 2 casas decimais
estoque int);

insert into tb_produtos(codigoProduto,produto,valor,estoque)
values('1000','Caneta',1.50,30);
insert into tb_produtos(codigoProduto,produto,valor,estoque)
values('1001','Borracha',3.25,50);

-- Dica: é possivel no workbench selecionar 2 ou mais tabelas
select * from tb_clientes;
select * from tb_produtos;

-- Criando uma tabela com relacionamento 1 ---> muitos
-- timestamp default current_timestamp (data e hora automática)
-- date (tipo de dados data)
-- constraint (cria uma restrição "on delete no action")
-- foreign key (cria uma chave estrangeira) FK
create table tb_pedidos(
notaFiscal int primary key auto_increment,
dataPedido timestamp default current_timestamp,
dataEnvio date,
idCli int not null,
constraint cliente_pedidos
foreign key (idCli)
references tb_clientes (idCli)
on delete no action);
describe tb_pedidos;

insert into tb_pedidos (dataEnvio,idCli)
values (curdate(),1);

insert into tb_pedidos (dataEnvio,idCli)
values (curdate(),9);

select * from tb_clientes;
select * from tb_produtos;
select * from tb_pedidos;

-- criando a tabela carrinho 1 pedido ---- vários ítens
/*
 ATENÇÃO !!!
 PK --------- FK (cria um relacionamento de 1 para muitos)
 PK --------- PK (cria um relacionamento de 1 para 1)
 FK --------- FK (cria um relacionamento de muitos para muitos)
 ****** o tipo de dados da FK deve ser o mesmo da PK ******
*/
create table tb_carrinho(
notaFiscal int not null,
codigoProduto varchar(100) not null,
quantidade int not null,
precoUnitario decimal(10,2) not null,
constraint pedidos_carrinho
foreign key(notaFiscal)
references tb_pedidos(notaFiscal)
on delete no action);

-- criando o relacionamento da tabela produtos com o carrinho
alter table tb_carrinho
add constraint produto_carrinho
foreign key(codigoProduto)
references tb_produtos(codigoProduto)
on delete no action;

insert into tb_carrinho
(notaFiscal,codigoProduto,quantidade,precoUnitario)
values (1,'1000',10,1.50);
insert into tb_carrinho
(notaFiscal,codigoProduto,quantidade,precoUnitario)
values (1,'1001',2,3.25);

select * from tb_carrinho;

/** criando relatórios no banco de dados **/

-- soma total (ponto de vendas)
select sum(quantidade * precoUnitario) as total
from tb_carrinho;

select * from tb_pedidos;
select * from tb_clientes;
-- unindo dados de tabelas diferentes em um único relatório
select
Ped.notaFiscal, Ped.dataPedido,
Cli.nomeCli, Cli.foneCli
from tb_pedidos as Ped
inner join tb_clientes as Cli
on (Ped.idCli = Cli.idCli);

-- criando apelidos para os campos da tabela
select
Ped.notaFiscal as Nota, Ped.dataPedido as DataNota,
Cli.nomeCli as Nome, Cli.foneCli as Fone
from tb_pedidos as Ped
inner join tb_clientes as Cli
on (Ped.idCli = Cli.idCli);

select * from tb_carrinho;
select * from tb_produtos;

-- relatório do inventário do estoque
select
Prod.produto,
Itens.quantidade, Itens.precoUnitario as valor
from tb_carrinho as Itens
inner join tb_produtos as Prod
on (Itens.codigoProduto = Prod.codigoProduto);













