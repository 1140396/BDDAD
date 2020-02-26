--Ex5.6

ALTER TABLE precos_edicoes_livros ADD data_hora DATE;

CREATE OR REPLACE TRIGGER trgPrecosEdicoesLivrosImpedirRegisto
BEFORE INSERT OR UPDATE OR DELETE ON precos_edicoes_livros

FOR EACH ROW

DECLARE

    ex_delete   EXCEPTION;
    ex_data1    EXCEPTION;
    ex_data2    EXCEPTION;

BEGIN    
    
    :new.data_hora := SYSDATE;
    
    IF DELETING THEN
        RAISE ex_delete;
    ELSE
        IF :NEW.data_inicio <= SYSDATE THEN
            RAISE ex_data1;
        ELSIF :OLD.data_inicio <= SYSDATE THEN
            RAISE ex_data2;
        END IF;
    END IF;
    
EXCEPTION

    WHEN ex_delete THEN
        RAISE_APPLICATION_ERROR(-20004, 'N�o s�o permitidas elimina��es de pre�os.');
    WHEN ex_data1 THEN
        RAISE_APPLICATION_ERROR(-20005, 'N�o s�o permitidos registos de pre�os anteriores � data atual.');
    WHEN ex_data2 THEN
        RAISE_APPLICATION_ERROR(-20006, 'N�o s�o permitidas modifica��es de registos de pre�os anterirores � data');

END trgPrecosEdicoesLivrosImpedirRegistos;
/