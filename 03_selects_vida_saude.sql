SELECT * FROM Paciente;
SELECT * FROM Medico;
SELECT * FROM Consulta;
SELECT * FROM Pagamento;
SELECT * FROM Exame;
SELECT * FROM Exame_Solicitado;
SELECT * FROM Ficha_Medica;


DELETE FROM Consulta;

INSERT INTO Consulta (id_paciente, id_medico, data_consulta, horario, status)
VALUES
  (1, 1, '2025-11-10', '09:00', 'Realizada'),
  (2, 2, '2025-11-11', '10:30', 'Agendada');


SELECT c.id_consulta,
       p.nome      AS paciente,
       m.nome      AS medico,
       c.data_consulta,
       c.horario,
       c.status
FROM Consulta c
JOIN Paciente p   ON c.id_paciente = p.id_paciente
JOIN Medico   m   ON c.id_medico   = m.id_medico
ORDER BY c.data_consulta, c.horario;


SELECT es.id_exame_solicitado,
       p.nome           AS paciente,
       e.nome_exame     AS exame,
       es.data_solicitacao,
       es.status
FROM Exame_Solicitado es
JOIN Consulta       c  ON es.id_consulta = c.id_consulta
JOIN Paciente       p  ON c.id_paciente  = p.id_paciente
JOIN Exame          e  ON es.id_exame    = e.id_exame
ORDER BY es.data_solicitacao;

SELECT r.id_resultado,
       p.nome           AS paciente,
       e.nome_exame     AS exame,
       r.resultado_texto,
       r.arquivo_pdf,
       r.data_resultado
FROM Resultado_Exame   r
JOIN Exame_Solicitado es ON r.id_exame_solicitado = es.id_exame_solicitado
JOIN Consulta         c  ON es.id_consulta        = c.id_consulta
JOIN Paciente         p  ON c.id_paciente         = p.id_paciente
JOIN Exame            e  ON es.id_exame           = e.id_exame
ORDER BY r.data_resultado;

SELECT pg.id_pagamento,
       p.nome           AS paciente,
       c.data_consulta,
       pg.valor,
       pg.forma_pagamento,
       pg.status_pagamento
FROM Pagamento pg
JOIN Consulta  c ON pg.id_consulta = c.id_consulta
JOIN Paciente  p ON c.id_paciente  = p.id_paciente
ORDER BY c.data_consulta;


SELECT f.id_ficha,
       p.nome        AS paciente,
       f.alergias,
       f.historico_clinico,
       f.observacoes_gerais
FROM Ficha_Medica f
JOIN Paciente    p ON f.id_paciente = p.id_paciente
ORDER BY p.nome;


SELECT
    forma_pagamento,
    COUNT(*)   AS qtd_pagamentos,
    SUM(valor) AS valor_total
FROM Pagamento
WHERE LOWER(status_pagamento) = 'pago'
GROUP BY forma_pagamento
ORDER BY valor_total DESC;

