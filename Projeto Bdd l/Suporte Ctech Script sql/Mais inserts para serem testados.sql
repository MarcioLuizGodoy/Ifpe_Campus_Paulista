'Copia da criação do banco de dados: '
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
    registro_profissional varchar (16) not null,
    primary key (cpf)
    );
    
create table conserto ( 
    numero_serie_equipamento varchar (20),
    cpf_tecnico_ctech varchar(20),
    primary key ( numero_serie_equipamento, cpf_tecnico_ctech),
    foreign key ( cpf_tecnico_ctech) references tecnico_ctech(cpf)
    );
    
create table estagiario (
    nome varchar (200) not null,
    cpf varchar(20) not null,
    supervisor_estagio varchar (20) not null,
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
    'Fim da copia da criacao das tabelas do banco de dados!!!'

		'inicio dos novos insets'
insert into cliente_prof values (
    '0000','Marinalva Conceito','Carlos Wilson'
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
    'Teste com Multimetro', 
    'Troca de componentes',
    'aaaabbb4321'
    );

insert into conselho_final_tecnico values (
    'evitar comer e beber quando proximo ao equipamento porque tinha restos de comida e cafe ja ressecado na placa',
    'aaaabbb4321'
    ); 
			'fim dos novos inserts'