-- LEFT JOIN - Listagem de usuários e seus chamados (incluindo os sem chamados)
SELECT 
    u.nome AS usuario,
    u.setor,
    COALESCE(COUNT(c.id_chamado), 0) AS total_chamados
FROM usuario u
LEFT JOIN chamado c ON u.id_usuario = c.id_usuario
GROUP BY u.nome, u.setor
ORDER BY total_chamados DESC;

-- Maior medo, DELETE/UPDATE sem WHERE em PROD, sexta final do expediente kkkkkk
-- UPDATE - Atualização de status do chamado.
UPDATE chamado
SET status = 'fechado', data_fechamento = CURRENT_TIMESTAMP
WHERE id_chamado = 3 AND status = 'em atendimento';

-- DELETE - Apenas para exemplo.
DELETE FROM interacao 
WHERE id_chamado = 2 AND role = 'usuario';
