
DELETE FROM Exame_Solicitado
WHERE id_exame_solicitado = 3
  AND id_exame_solicitado NOT IN (
      SELECT id_exame_solicitado
      FROM Exame_solicitado
  );


DELETE FROM Pagamento
WHERE id_pagamento = 5;


DELETE FROM Ficha_Medica
WHERE id_ficha = 1;

