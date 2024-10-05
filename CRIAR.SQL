CREATE TABLE psan_dim_cliente (
    cd_cliente       NUMBER(6) NOT NULL,
    nm_cliente       VARCHAR2(80) NOT NULL,
    sx_cliente       CHAR(3) NOT NULL,
    es_civil_cliente VARCHAR2(10) NOT NULL,
    uf__estado       VARCHAR2(3) NOT NULL,
    mn_cidade        VARCHAR2(4) NOT NULL,
    nm_bairro        VARCHAR2(60) NOT NULL
);

COMMENT ON COLUMN psan_dim_cliente.cd_cliente IS
    'ATRIBUTO RESPONSÁVEL PELO IDENTIFICADOR ÚNICO.';

COMMENT ON COLUMN psan_dim_cliente.nm_cliente IS
    'ATRIBUTO RECEBE O NOME DO CLIENTE.';

COMMENT ON COLUMN psan_dim_cliente.sx_cliente IS
    'ATRIBUTO REECEBE O GENERO DO CLIENTE.';

COMMENT ON COLUMN psan_dim_cliente.es_civil_cliente IS
    'ATRIBUTO IDENTIFICA O ESTADO CÍVIL EM QUE O CLIENTE SE ENCONTRA.';

COMMENT ON COLUMN psan_dim_cliente.uf__estado IS
    'ATRIBUTO IDENTIFICA O ESTADO RESIDENCIAL DO CLIENTE.';

COMMENT ON COLUMN psan_dim_cliente.mn_cidade IS
    'ATRIBUTO IDENTIFICA O MUNICÍPIO RESIDENCIAL DO CLIENTE.';

COMMENT ON COLUMN psan_dim_cliente.nm_bairro IS
    'ATRIBUTO IDENTIFICA O BAIRRO  RESIDENCIAL DO CLIENTE.';

ALTER TABLE psan_dim_cliente ADD CONSTRAINT sk_psan_dim_cliente PRIMARY KEY ( cd_cliente );

CREATE TABLE psan_dim_fx_etaria_pet (
    ds_fx_etaria_pet VARCHAR2(60) NOT NULL,
    id_inicial_pet   NUMBER(2) NOT NULL,
    id_final_pet     NUMBER NOT NULL
);

COMMENT ON COLUMN psan_dim_fx_etaria_pet.ds_fx_etaria_pet IS
    'ATRIBUTO RESPONSÁVEL PELA IDADE INICIAL E IDADE FINAL DO PET.';

COMMENT ON COLUMN psan_dim_fx_etaria_pet.id_inicial_pet IS
    'ATRIBUTO RESPONSÁVEL PELA IDADE INCIAL DO PET.';

COMMENT ON COLUMN psan_dim_fx_etaria_pet.id_final_pet IS
    'ATRIATRIBUTO RESPONSÁVEL PELA IDADE FINAL DO PET.';

ALTER TABLE psan_dim_fx_etaria_pet ADD CONSTRAINT psan_dim_fx_etaria_pet_pk PRIMARY KEY ( ds_fx_etaria_pet );

CREATE TABLE psan_dim_loja (
    cd_loja   NUMBER(6) NOT NULL,
    nm_loja   VARCHAR2(60),
    uf_estado VARCHAR2(60) NOT NULL,
    mn_cidade VARCHAR2(4) NOT NULL,
    nm_bairro VARCHAR2(60) NOT NULL
);

COMMENT ON COLUMN psan_dim_loja.cd_loja IS
    'ATRIATRIBUTO RESPONSÁVEL PELO IDENTIFICADOR ÚNICO.';

COMMENT ON COLUMN psan_dim_loja.nm_loja IS
    'ATRIBUTO RESPONSÁVEL PELO NOME DA LOJA.';

COMMENT ON COLUMN psan_dim_loja.uf_estado IS
    'ATRIBUTO RESPONSÁVEL PELO ESTADO COMERCIAL DA LOJA.';

COMMENT ON COLUMN psan_dim_loja.mn_cidade IS
    'ATRIBUTO RESPONSÁVEL PELO MUNICÍPIO COMERCIAL DA LOJA.';

COMMENT ON COLUMN psan_dim_loja.nm_bairro IS
    'ATRIBUTO RESPONSÁVEL PELO BAIRRO COMERCIAL DA LOJA.';

ALTER TABLE psan_dim_loja ADD CONSTRAINT psan_dim_loja_pk PRIMARY KEY ( cd_loja );

CREATE TABLE psan_dim_pet (
    cd_pet      NUMBER(6) NOT NULL,
    nm_pet      VARCHAR2(60) NOT NULL,
    age_pet     NUMBER(2) NOT NULL,
    dt_nasc_pet DATE NOT NULL,
    nm_especie  VARCHAR2(60) NOT NULL,
    nm_raça     VARCHAR2(60) NOT NULL
);

COMMENT ON COLUMN psan_dim_pet.cd_pet IS
    'ATRIBUTO RESPONSÁVEL PELO IDENTIFICADOR ÚNICO.';

COMMENT ON COLUMN psan_dim_pet.nm_pet IS
    'ATRIBUTO RESPONSÁVEL PELO NOME DO PET.';

COMMENT ON COLUMN psan_dim_pet.age_pet IS
    'ATRIBUTO RESPONSÁVEL PELA IDADE DO PET';

COMMENT ON COLUMN psan_dim_pet.dt_nasc_pet IS
    'ATRIBUTO RESPONSÁVEL PELA DATA DE NASCIMENTO DO PET.';

COMMENT ON COLUMN psan_dim_pet.nm_especie IS
    'ATRIBUTO IDENTIFICA O NOME DA ESPÉCIE DO PET.';

COMMENT ON COLUMN psan_dim_pet.nm_raça IS
    'ATRIBUTO RESPONSÁVEL POR IDENTIFICAR O NOME DA RAÇA DO PET.';

ALTER TABLE psan_dim_pet ADD CONSTRAINT sk_psan_dim_pet PRIMARY KEY ( cd_pet );

CREATE TABLE psan_dim_pro_serviço (
    cd_produto_serviço  NUMBER(6) NOT NULL,
    ds_produto_serviço  VARCHAR2(60) NOT NULL,
    cat_produto_serviço VARCHAR2(60) NOT NULL
);

COMMENT ON COLUMN psan_dim_pro_serviço.cd_produto_serviço IS
    'ATRIBUTO RESPONSÁVEL PELO IDENTIFICADOR ÚNICO.';

COMMENT ON COLUMN psan_dim_pro_serviço.ds_produto_serviço IS
    'ATRIBUTO RESPONSÁVEL PELA DESCRIÇÃO DO PRODUTO E OU SERVIÇO.';

COMMENT ON COLUMN psan_dim_pro_serviço.cat_produto_serviço IS
    'ATRIBUTO RESPONSÁVEL PELA CATEGORIA DO SERVIÇO.';

ALTER TABLE psan_dim_pro_serviço ADD CONSTRAINT sk_psan_dim_pro_serviço PRIMARY KEY ( cd_produto_serviço );

CREATE TABLE psan_dim_tempo (
    dt_evento DATE NOT NULL,
    ano       NUMBER(4) NOT NULL,
    mes       NUMBER(2) NOT NULL,
    dia       NUMBER(2) NOT NULL
);

COMMENT ON COLUMN psan_dim_tempo.dt_evento IS
    'ATRIBUTO RESPONSÁVEL PELO IDENTIFICADOR ÚNICO.';

COMMENT ON COLUMN psan_dim_tempo.ano IS
    'ATRIBUTO RESPONSÁVEL PELO ANO DO EVENTO.';

COMMENT ON COLUMN psan_dim_tempo.mes IS
    'ATRIBUTO RESPONSÁVEL PELO MÊS DO EVENTO.';

COMMENT ON COLUMN psan_dim_tempo.dia IS
    'ATRIBUTO RESPONSÁVEL PELO DIA DO EVENTO.';

ALTER TABLE psan_dim_tempo ADD CONSTRAINT psan_dim_tempo_pk PRIMARY KEY ( dt_evento );

CREATE TABLE psan_ft_consulta (
    cd_pet             NUMBER(6) NOT NULL,
    cd_loja            NUMBER(6) NOT NULL,
    dt_evento          DATE NOT NULL,
    cd_produto_serviço NUMBER(6) NOT NULL,
    cd_cliente         NUMBER(6) NOT NULL,
    ds_fx_etaria_pet   VARCHAR2(60) NOT NULL,
    nr_consulta        NUMBER(10, 2),
    vl_consulta        NUMBER(10, 2),
    qt_consulta        NUMBER(3)
);

COMMENT ON COLUMN psan_ft_consulta.nr_consulta IS
    'ATRIBUTO RESPONSÁVEL PELO IDENTIFICADOR ÚNICO.';

COMMENT ON COLUMN psan_ft_consulta.vl_consulta IS
    'ATRIBUTO RESPONSÁVEL PELO VALOR DA CONSULTA.';

COMMENT ON COLUMN psan_ft_consulta.qt_consulta IS
    'ATRIBUTO RESPONSÁVEL PELA QUANTIDADE DE CONSULTAS.';

ALTER TABLE psan_ft_consulta
    ADD CONSTRAINT psan_ft_consulta_pk PRIMARY KEY ( cd_pet,
                                                     cd_loja,
                                                     dt_evento,
                                                     cd_produto_serviço,
                                                     ds_fx_etaria_pet,
                                                     cd_cliente );

ALTER TABLE psan_ft_consulta
    ADD CONSTRAINT psan_fk_dim_cliente_ft_cnsta FOREIGN KEY ( cd_cliente )
        REFERENCES psan_dim_cliente ( cd_cliente );

ALTER TABLE psan_ft_consulta
    ADD CONSTRAINT psan_fk_dim_fx_ft_cnsta FOREIGN KEY ( ds_fx_etaria_pet )
        REFERENCES psan_dim_fx_etaria_pet ( ds_fx_etaria_pet );

ALTER TABLE psan_ft_consulta
    ADD CONSTRAINT psan_fk_dim_loja_psan_ft_cnsta FOREIGN KEY ( cd_loja )
        REFERENCES psan_dim_loja ( cd_loja );

ALTER TABLE psan_ft_consulta
    ADD CONSTRAINT psan_fk_dim_pet_psan_ft_cnsta FOREIGN KEY ( cd_pet )
        REFERENCES psan_dim_pet ( cd_pet );

ALTER TABLE psan_ft_consulta
    ADD CONSTRAINT psan_fk_dim_sv_ft_cta FOREIGN KEY ( cd_produto_serviço )
        REFERENCES psan_dim_pro_serviço ( cd_produto_serviço );

ALTER TABLE psan_ft_consulta
    ADD CONSTRAINT psan_fk_dim_tempo_ft_cnsta FOREIGN KEY ( dt_evento )
        REFERENCES psan_dim_tempo ( dt_evento );
