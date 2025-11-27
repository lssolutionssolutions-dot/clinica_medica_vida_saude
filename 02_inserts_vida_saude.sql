-- Inserts de exemplo
INSERT INTO Convenio (nome_convenio) VALUES
('Vida Popular Saúde'),
('Mais Bem Estar');

INSERT INTO Paciente (nome, cpf, data_nascimento, telefone, email, id_convenio) VALUES
('Maria Souza', '11111111111', '1990-05-10', '11999990000', 'maria@exemplo.com', 1),
('João Silva', '22222222222', '1985-08-20', '11988887777', 'joao@exemplo.com', 2);

INSERT INTO Especialidade (nome_especialidade) VALUES
('Clínico Geral'),
('Cardiologia'),
('Pediatria');

INSERT INTO Medico (nome, crm, telefone_contato, id_especialidade) VALUES
('Dr. Carlos Lima', '12345-SP', '1133334444', 1),
('Dra. Ana Paula', '67890-SP', '1144445555', 2);

INSERT INTO Ficha_Medica (id_paciente, alergias, historico_clinico, observacoes_gerais) VALUES
(1, 'Alergia a dipirona', 'Histórico de hipertensão controlada.', 'Paciente em acompanhamento anual.'),
(2, 'Sem alergias registradas', 'Sem histórico relevante.', 'Paciente em bom estado geral.');

INSERT INTO Consulta (id_paciente, id_medico, data_consulta, horario, status) VALUES
(1, 1, '2025-11-10', '09:00', 'Realizada'),
(2, 2, '2025-11-11', '10:30', 'Agendada');

INSERT INTO Pagamento (id_consulta, valor, forma_pagamento, status_pagamento) VALUES
(1, 120.00, 'Cartão de Crédito', 'Pago'),
(2, 90.00, 'Dinheiro', 'Pendente');

INSERT INTO Exame (nome_exame, tipo, descricao) VALUES
('Hemograma Completo', 'Laboratorial', 'Exame de sangue para avaliação geral.'),
('Raio-X de Tórax', 'Imagem', 'Avaliação radiológica do tórax.');

INSERT INTO Exame_Solicitado (id_consulta, id_exame, data_solicitacao, status) VALUES
(1, 1, '2025-11-10', 'Concluído'),
(1, 2, '2025-11-10', 'Em análise'),
(2, 1, '2025-11-11', 'Solicitado');

INSERT INTO Resultado_Exame (id_exame_solicitado, resultado_texto, arquivo_pdf, data_resultado) VALUES
(1, 'Resultados dentro da normalidade.', 'hemograma_maria.pdf', '2025-11-10'),
(2, 'Imagem com leve alteração, solicitar avaliação médica.', 'raiox_maria.pdf', '2025-11-11');

INSERT INTO Pagamento (id_consulta, valor, forma_pagamento, status_pagamento)
VALUES
(1, 90.00, 'Dinheiro', 'Concluído'),
(2, 120.00, 'Cartão de Débito', 'Pendente');

