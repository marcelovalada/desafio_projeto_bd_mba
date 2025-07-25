-- Arquivo de consultas adicionais para atender requisitos opcionais do projeto

-- 1. Exemplo de LEFT JOIN: Todos os usuários e seus chamados (incluindo usuários que não têm chamados)
SELECT 
    u.nome AS usuario,
    u.setor,
    COALESCE(COUNT(c.id_chamado), 0) AS total_chamados
FROM usuario u
LEFT JOIN chamado c ON u.id_usuario = c.id_usuario
GROUP BY u.nome, u.setor
ORDER BY total_chamados DESC;

-- 2. Exemplo de RIGHT JOIN: Todas as categorias e seus chamados (incluindo categorias sem chamados)
SELECT 
    c.nome AS categoria,
    c.prioridade,
    COALESCE(COUNT(ch.id_chamado), 0) AS total_chamados
FROM chamado ch
RIGHT JOIN categoria c ON ch.id_categoria = c.id_categoria
GROUP BY c.nome, c.prioridade
ORDER BY total_chamados DESC;

-- 3. Exemplo com HAVING: Categorias com mais de 1 chamado
SELECT 
    c.nome AS categoria,
    COUNT(ch.id_chamado) AS total_chamados
FROM categoria c
JOIN chamado ch ON c.id_categoria = ch.id_categoria
GROUP BY c.nome
HAVING COUNT(ch.id_chamado) > 1
ORDER BY total_chamados DESC;

-- 4. Exemplo com LIMIT: Top 3 técnicos que mais atendem chamados
SELECT 
    t.nome AS tecnico,
    COUNT(c.id_chamado) AS chamados_atendidos
FROM tecnico t
JOIN chamado c ON t.id_tecnico = c.id_tecnico
GROUP BY t.nome
ORDER BY chamados_atendidos DESC
LIMIT 3;

-- 5. Exemplo de UPDATE: Atualizar status de um chamado específico
-- Exemplo 1: Fechando um chamado que estava em atendimento
UPDATE chamado
SET status = 'fechado', data_fechamento = CURRENT_TIMESTAMP
WHERE id_chamado = 3 AND status = 'em atendimento';

-- Exemplo 2: Atualizar a prioridade de uma categoria
UPDATE categoria
SET prioridade = 'alta'
WHERE nome = 'Software' AND prioridade = 'media';

-- 6. Exemplo de DELETE: Remover interações antigas
-- Nota: Este é um exemplo seguro com uma cláusula WHERE específica
-- Para executar, descomente a linha abaixo:
-- DELETE FROM interacao WHERE data_interacao < '2023-01-01';

-- 7. Exemplo combinando várias técnicas: Chamados por setor com contagem de interações
SELECT 
    u.setor,
    c.titulo AS chamado,
    c.status,
    COUNT(i.id_interacao) AS total_interacoes
FROM usuario u
JOIN chamado c ON u.id_usuario = c.id_usuario
LEFT JOIN interacao i ON c.id_chamado = i.id_chamado
GROUP BY u.setor, c.titulo, c.status
HAVING COUNT(i.id_interacao) >= 0
ORDER BY total_interacoes DESC
LIMIT 10;
