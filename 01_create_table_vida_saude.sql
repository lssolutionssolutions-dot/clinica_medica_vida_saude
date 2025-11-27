PRAGMA foreign_keys = ON;

-- Tabela de convênios
CREATE TABLE Convenio (
    id_convenio     INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_convenio   TEXT NOT NULL
);

-- Tabela de pacientes
CREATE TABLE Paciente (
    id_paciente     INTEGER PRIMARY KEY AUTOINCREMENT,
    nome            TEXT NOT NULL,
    cpf             TEXT NOT NULL,
    data_nascimento TEXT NOT NULL,
    telefone        TEXT,
    email           TEXT,
    id_convenio     INTEGER,
    FOREIGN KEY (id_convenio) REFERENCES Convenio(id_convenio)
);

-- Tabela de especialidades médicas
CREATE TABLE Especialidade (
    id_especialidade    INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_especialidade  TEXT NOT NULL
);

-- Tabela de médicos
CREATE TABLE Medico (
    id_medico           INTEGER PRIMARY KEY AUTOINCREMENT,
    nome                TEXT NOT NULL,
    crm                 TEXT NOT NULL,
    telefone_contato    TEXT,
    id_especialidade    INTEGER,
    FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id_especialidade)
);

-- Tabela de ficha médica (1:1 com paciente)
CREATE TABLE Ficha_Medica (
    id_ficha            INTEGER PRIMARY KEY AUTOINCREMENT,
    id_paciente         INTEGER NOT NULL UNIQUE,
    alergias            TEXT,
    historico_clinico   TEXT,
    observacoes_gerais  TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

-- Tabela de consultas
CREATE TABLE Consulta (
    id_consulta     INTEGER PRIMARY KEY AUTOINCREMENT,
    id_paciente     INTEGER NOT NULL,
    id_medico       INTEGER NOT NULL,
    data_consulta   TEXT NOT NULL,
    horario         TEXT NOT NULL,
    status          TEXT NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico)   REFERENCES Medico(id_medico)
);

-- Tabela de pagamentos
CREATE TABLE Pagamento (
    id_pagamento    INTEGER PRIMARY KEY AUTOINCREMENT,
    id_consulta     INTEGER NOT NULL,
    valor           NUMERIC NOT NULL,
    forma_pagamento TEXT NOT NULL,
    status_pagamento TEXT NOT NULL,
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta)
);

-- Tabela de exames
CREATE TABLE Exame (
    id_exame        INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_exame      TEXT NOT NULL,
    tipo            TEXT,
    descricao       TEXT
);

-- Tabela associativa de exames solicitados (implementa relação N:N)
CREATE TABLE Exame_Solicitado (
    id_exame_solicitado   INTEGER PRIMARY KEY AUTOINCREMENT,
    id_consulta           INTEGER NOT NULL,
    id_exame              INTEGER NOT NULL,
    data_solicitacao      TEXT NOT NULL,
    status                TEXT,
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta),
    FOREIGN KEY (id_exame)    REFERENCES Exame(id_exame)
);

-- Tabela de resultados de exame (1:1 com exame_solicitado)
CREATE TABLE Resultado_Exame (
    id_resultado          INTEGER PRIMARY KEY AUTOINCREMENT,
    id_exame_solicitado   INTEGER NOT NULL,
    resultado_texto       TEXT,
    arquivo_pdf           TEXT,
    data_resultado        TEXT NOT NULL,
    FOREIGN KEY (id_exame_solicitado) REFERENCES Exame_Solicitado(id_exame_solicitado)
);

