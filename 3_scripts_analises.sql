-- 1. Técnicos que mais fecharam chamados
SELECT 
    t.nome AS tecnico,
    COUNT(c.id_chamado) AS chamados_fechados
FROM tecnico t
JOIN chamado c ON t.id_tecnico = c.id_tecnico
WHERE c.status = 'fechado'
GROUP BY t.nome
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
