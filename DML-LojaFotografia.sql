insert into FUNCIONARIO
values ('Fabio', 1, 'Fundos', 108, '16190', 'Sgto Pincel', 'Vendedor', 'Vendas', '1963366558')
;
insert into FUNCIONARIO
values ('Felipe', 1, 'Frente', 108, '16190', 'Juliana', 'Vendedor', 'Compras', '19664654')
;
insert into FUNCIONARIO
values ('Andre', 1, '', 118, '16 193', 'Talita', 'Vendedor', 'Vendas', '11111111111')

insert into Endereco VALUES(1, '14804409', 'SP', 'Araraquara', 'Botanico', 'Avendida Quaresmeria Rosa');
insert into Endereco VALUES(3, '15980000', 'SP', 'Dobrada', 'Centro', '');


select * from Endereco;

select CODIGO, E.CODEND,  F.NOME, cep, rua as 'Logradouro', numero
from Funcionario F right join endereco E 
on F.CodEnd = E.CodEnd
;



insert into produto 
values('Album de Fotografia', 80.50, 20.00, 5.0, 15.0, 'Acessórios');

Select *
from produto

Select * from cliente;
select * from funcionario;

Insert into cliente
values (0, 'Consumidor Final', 2, 'S/N', '', '', '', '', '', '', '', '', '', '', '', 'F')


insert into venda
values (0.00, '20/05/2024', 115, 0)

insert into itemvenda
values (2, 2, 10.0, 30.00 , 300.00), (2, 3, 1.0, 80.50, 80.50);

Select * from venda;
select * from itemvenda;

update produto
set
  qtd = qtd + 6,
  preco_custo = 11.00,
  preco_venda = preco_venda *1.1
where codigo = 2;