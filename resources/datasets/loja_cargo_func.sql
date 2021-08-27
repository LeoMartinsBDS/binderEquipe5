USE marketcamp;

INSERT INTO loja (nomeexibicao,cnpj,logradouro,emailatendimento,telefone) VALUES ('Casas São Paulo', '12345678912345', 'Rua da Sé 320, Sé - SP', 'atendimento1@gmail.com', '1112345698'),
																				 ('Luiza Magazine',  '31232131241241', 'Rua Tupiniquim 100, Vila Sésamo - SP ', 'atnd@gmail.com', '1112549887'),
																				 ('Kapow',  		 '13211231212423', 'Rua Disney 20, Disneylandia - RS ', 'kapow@kpw.com.br', '4522364974'),
																				 ('Gigabyte Comercio Eletronico','65478934568125', 'Rua Rambo 666, Vila Selva - AM ', 'giga@gigabyte.com', '6654987568'),
																				 ('Mercado Preso',  '65497431529874', 'Rua da Liberdade 300, Liberdade - SP ', 'atendimento@gmail.com', '1203548942');
																				 
INSERT INTO cargofuncionario (nomecargo, descricaocargo) VALUES ('Presidente', 'O cara que manda em tudo e coloca o filho para trabalhar como chefe (MERITOCRACIA)'),
																('Gerente Geral', 'Responsável por fazer o gerenciamento de todas as equipes'),
																('Gerente Equipe','Responsável por fazer o gerenciamento de uma unica equipe'),
																('Vendedor', 'Responsável por realizar a venda dos produtos da loja'),
																('Faxineira', 'Responsável por fazer a limpeza dos ambientes da loja');
																
INSERT INTO funcionario (cargoid, lojaid, nome, cpf, email, logradouro, esocialid, agenciasalario, contasalario) VALUES (1, 1, 'Sidnei Jhonson', '46899587825', 'aragan@hotmail.com', 'Rua Grove 10, Capão Redondo - São Paulo', 111, 001, '2020123'),
																												(2, 1, 'Niko Bellic', 	  '89865659898', 'nbellic@hotmail.com','Rua Boliche 100, Itaquera - São Paulo', 232, 001, '2020213'),
																												(3, 2, 'Claudio Velocidade', '65894321548', 'claudespeed@hotmail.com','Rua Veloz e Furiosa 300, Sé - São Paulo', 233, 002, '3030589'),
																												(4, 1, 'Tommy Vercetti', 	 '12312321312', 'tmmvetti@hotmail.com','Rua  da Mafia 100, Italia - Bahia', 432, 025, '6547884'),
																												(4, 2, 'Jhonny Klebetz', 	 '34412341232', 'jk@gmail.com','Rua JK, Nova Brasilia - Rio de Janeiro', 2234, 300, '30001'),
																												(4, 4, 'Luis Lopes', 	     '32112412344', 'll@gmail.com','Rua Porto Riquenha, Nova Granada - Mato Grosso', 54, 002, '3365956'),
																												(5, 4, 'Franklin Branklin',  '34453453312', 'franklinb@hotmail.com','Rua Grove 300, Capão Redondo - São Paulo', 2, 021, '356898141'),
																												(4, 5, 'Trevor Phillips', 	 '32431233231', 'tpindustries@hotmail.com','Rua Industrial 0, Industrial - Amazonas', 55, 450, '1123131231'),
																												(4, 3, 'Michael de Santa', 	 '54543253456', 'merrychristmas@hotmail.com','Rua Natal 25, Nordestinalandia - Ceará', 123, 666, '6669999');
																												