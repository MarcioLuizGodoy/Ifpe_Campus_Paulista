create table cliente_prof ( 
    cpf varchar (16)  not null,
    nome varchar (100), 
    escola varchar (100) not null,
    primary key (cpf)
    );
    
create table cliente_prof_telefones (
	cpf_cliente_prof varchar(20) not null,
    numeros varchar (20),
	primary key ( numeros, cpf_cliente_prof),
    foreign key (cpf_cliente_prof) references cliente_prof(cpf)
    );
     
create table equipamento_eletronico (
    cpf_cliente_prof varchar (20),
    numero_serie varchar (20) not null,
    tombamento varchar (20) not null,
    modelo varchar (20) not null,
    primary key (numero_serie),
    foreign key ( cpf_cliente_prof) references cliente_prof(cpf)
    );
    
create table  tecnico_ctech (
    nome varchar (200) not null,
    cpf varchar(20) not null,
    registro_profissional varchar (16),
    primary key (cpf)
    );
    
create table conserto ( 
    numero_serie_equipamento varchar (20),
    cpf_tecnico_ctech varchar(20),
    primary key ( numero_serie_equipamento, cpf_tecnico_ctech),
    foreign key ( cpf_tecnico_ctech) references tecnico_ctech(cpf)
    );
    
create table estagiario (
    nome varchar (200),
    cpf varchar(20),
    supervisor_estagio varchar (20) ,
    cpf_tecnico_ctech varchar(16),
    primary key ( cpf ),
    foreign key (cpf_tecnico_ctech) references tecnico_ctech(cpf)
    );
    
create table documentacao (
    ticket varchar(200),
    cpf_tecnico_ctech varchar(16),
    numero_serie_equipamento_eletronico varchar (20),
    parecer_tecnico varchar (100),
    primary key (ticket),
    foreign key ( cpf_tecnico_ctech) references tecnico_ctech(cpf),
    foreign key (numero_serie_equipamento_eletronico) references equipamento_eletronico(numero_serie)
    );
    		
create table defeitos (
    problemas_equipamento varchar (100),
    ticket_documentacao varchar (200),
    primary key( problemas_equipamento, ticket_documentacao),
    foreign key (ticket_documentacao) references documentacao (ticket)
    );
    
create table procedimentos_realizados (
    intervencoes_feitas varchar (100),
    ticket_documentacao varchar (100),
    primary key ( intervencoes_feitas, ticket_documentacao),
    foreign key ( ticket_documentacao) references documentacao (ticket)
    );
    
create table conselho_final_tecnico ( 
    indicacao_uso varchar (200),
    ticket_documentacao varchar(100),
    foreign key ( ticket_documentacao) references documentacao(ticket)
    );

insert into cliente_prof values (
    '0000','Marinalva Conceito','Carlos Wilson'
    );

insert into cliente_prof_telefones values (
    '0000','333333'
    );

insert into equipamento_eletronico values (
    '0000','0a1b','1234','lenovo'
    );

insert into tecnico_ctech values (
    'marcia marinho','8888','9999'
    );

insert into conserto values (
    '0a1b','8888'
    );

insert into estagiario values (
    'marcio godoy' ,'1111','marcia marinho','8888'
    );

insert into documentacao values (
    'zzzzkkk1234','8888','0a1b',
    'equipamento pode ser devolvido a escola apos reparos'
    );

insert into defeitos values (
    'flat de video ruim , hd danificado,pouca memoria ram','zzzzkkk1234'
    );

insert into procedimentos_realizados values (
    'troca de flat de video, troca de hd e aumento de armazenamento, adicionado 4gb de ram','zzzzkkk1234'
    );

insert into conselho_final_tecnico values (
    'nao permitir que o equipamento seja aberto por outro profissinal fora do suporte tecnico da prefeitura, o flat de video foi posto da forma errada e portanto foi danificado. Ademais, manter o notebook o mais estatico possavel porque ass portas usbs sao sensaveis',
    'zzzzkkk1234'
    );
    
    
    
    
    insert into cliente_prof_telefones values (
    '0000','444444'
    );

insert into equipamento_eletronico values (
    '0000','0b1c','4321','Positivo'
    );

insert into tecnico_ctech values (
    'Gutemberg','7777','2222'
    );
    
    
    
    
    insert into tecnico_ctech values (
    'Elys mais alguma coisa','5555','1111'
    );




insert into conserto values (
    '0b1c','7777'
    );

insert into estagiario values (
    'amaro alguma coisa','6688','Gutember','7777'
    );

insert into documentacao values (
    'aaaabbb4321','7777','0b1c',
    'equipamento de ser substituido'
    );

insert into defeitos values (
    'placa ruim','aaaabbb4321'
    );

insert into procedimentos_realizados values (
    'Teste com Multimetro ,Troca de componentes',
    'aaaabbb4321'
    );

insert into conselho_final_tecnico values (
    'evitar comer e beber quando proximo ao equipamento porque tinha restos de comida e cafe ja ressecado na placa',
    'aaaabbb4321'
    ); 

select * from documentacao;

select * from cliente_prof_telefones
where numeros = '333333'


update  cliente_prof
set nome = 'Godoy fiote, Godoy'
where cpf = '0000'


update  tecnico_ctech
set nome = 'Dona Edna'
where cpf = '8888'

delete *from equipamento_eletronico
where numero_serie = 'zzzzkkk1234'

select *
from tecnico_ctech
left join estagiario
on tecnico_ctech.cpf = estagiario.cpf_tecnico_ctech;


