-- 1. Técnicos que mais fecharam chamados
SELECT 
    t.nome AS tecnico,
    COUNT(c.id_chamado) AS chamados_fechados
FROM tecnico t
JOIN chamado c ON t.id_tecnico = c.id_tecnico
WHERE c.status = 'fechado'
GROUP BY t.nome
HAVING COUNT(ch.id_chamado) > 3
ORDER BY chamados_fechados DESC;

-- 2. Quantidade de chamados criados por categoria
SELECT 
    c.nome AS categoria,
    COUNT(ch.id_chamado) AS total_chamados
FROM categoria c
JOIN chamado ch ON c.id_categoria = ch.id_categoria
GROUP BY c.nome
ORDER BY total_chamados DESC;

-- 3. Chamados distintos por setor
SELECT 
    u.setor,
    COUNT(DISTINCT ch.id_chamado) AS total_chamados
FROM usuario u
JOIN chamado ch ON u.id_usuario = ch.id_usuario
GROUP BY u.setor
ORDER BY total_chamados DESC;

-- 4. Todos os usuários e seus chamados (incluindo usuários que não têm chamados)
INSERT INTO tecnico (nome, email, especialidade) VALUES ('Adonai', 'adonai@empresa.com', 'Dados');
SELECT 
    u.nome AS usuario,
    u.setor,
    COALESCE(COUNT(c.id_chamado), 0) AS total_chamados
FROM usuario u
LEFT JOIN chamado c ON u.id_usuario = c.id_usuario
GROUP BY u.nome, u.setor
ORDER BY total_chamados DESC;

-- 5. Exemplo de UPDATE: Atualizar status de um chamado específico
UPDATE chamado
SET status = 'fechado', data_fechamento = CURRENT_TIMESTAMP
WHERE id_chamado = 3;

-- 6. Exemplo de DELETE
DELETE FROM interacao WHERE id_interacao = 3;
SELECT * FROM interacao LIMIT 5;