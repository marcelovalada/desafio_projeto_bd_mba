-- Inserindo Dados
INSERT INTO categoria (nome, prioridade) VALUES
('Infraestrutura', 'alta'),
('Software', 'media'),
('Backup', 'baixa');

INSERT INTO usuario (nome, email, setor) VALUES
('João Silva', 'joao.silva@empresa.com', 'RH'),
('Maria Santos', 'maria.santos@empresa.com', 'Financeiro'),
('Ana Costa', 'ana.costa@empresa.com', 'Marketing');

INSERT INTO tecnico (nome, email, especialidade) VALUES
('Pedro Leal', 'pedro.leal@empresa.com', 'Dados'),
('Marcelo Valada', 'marcelo.valada@empresa.com', 'Software');

INSERT INTO chamado (id_usuario, id_tecnico, id_categoria, titulo, descricao, status) VALUES
(1, 1, 1, 'Não consigo rodar o Docker', 'Não consigo rodar imagem Docker localmente', 'aberto'),
(1, 1, 1, 'Chamado encerrado 1', 'Chamado encerrado 1', 'fechado'),
(2, 2, 2, 'Erro no sistema de RH', 'Aparece mensagem de erro ao tentar fechar a folha de pagamento', 'em atendimento'),
(3, 2, 3, 'Backup do ERP', 'Não consigo fazer backup do ERP', 'aberto'),
(1, 1, 2, 'Sistema contábil com lentidão', 'Sistema contábil está muito lento e mostra popups', 'em atendimento'),
(2, 2, 2, 'Chamado encerrado 2', 'Chamado encerrado 2', 'fechado'),
(3, 2, 2, 'Chamado encerrado 3', 'Chamado encerrado 3', 'fechado');

INSERT INTO interacao (id_chamado, role, mensagem) VALUES
(1, 'usuario', 'Olá! Teria como agilizar? Tenho que corrigir o bug...'),
(2, 'tecnico', 'Analisando o erro do sistema. Poderia me dizer matrícula do usuário?'),
(2, 'usuario', '00154...'),
(4, 'tecnico', 'Está acontecendo uma atualização de emergência no sistema...'),
(4, 'usuario', 'Vai demorar...'),
(4, 'tecnico', 'Termina no período da manhã...');
