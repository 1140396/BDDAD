-- ex 4.3

CREATE TABLE excecoes(

    ex_id   INT,
    ex_texto    VARCHAR(500) CONSTRAINT no_excecoes_ex_texto NOT NULL,
    CONSTRAINT pk_excecoes_ex_id PRIMARY KEY (ex_id),
    CONSTRAINT ck_excecoes_ex_id CHECK (ex_id <= -20000)
    );
    
-- Preencher tabela

INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200001, 'N�o s�o permitidos clientes com idade inferior a 18 anos.');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200002, 'Hor�rio de fim de semana');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200003, 'Fora de hor�rio de funcionamento');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200004, 'N�o s�o permitidos elemina��es de pre�os');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200005, 'N�o s�o permitiods registos de pre�os anteriores � data atual');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200006, 'N�o s�o permitidas modifica��es de registos de pre�os anteriores � data');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200007, 'N�o s�o permitidos registos de pre�os com valores iguais para datas com valores iguais para datas consecutivas');

