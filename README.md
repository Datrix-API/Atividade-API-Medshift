# Atividade-API-Medshift
Sistema de Apoio à Construção e Validação de Escalas Médicas

Sprint 1

Nesta 1ª Sprint foi desenvolvida a parte inicial do sistema, responsável pela configuração de um único plantão médico.

O sistema permite que o coordenador cadastre os três turnos que irão formar o plantão:

Manhã
Tarde
Noite

Cada turno deve ser selecionado apenas uma vez. Após selecionar o turno, o coordenador informa a quantidade de profissionais de cada especialidade.

As especialidades utilizadas nesta Sprint são:

Clínicos Gerais: de 2 a 4 médicos
Pediatras: de 1 a 2 médicos
Cirurgiões: de 1 a 2 médicos

O sistema também possui algumas validações para evitar informações inválidas. Caso seja informado um turno diferente de 1, 2 ou 3, ou uma quantidade de médicos fora dos limites definidos.

Ao final do cadastro dos três turnos, é apresentado um quadro geral mostrando a quantidade de médicos cadastrados em cada especialidade e em cada turno.

Exemplo do funcionamento

O coordenador seleciona um turno:

Manhã
Tarde
Noite

Depois informa a quantidade de:

Clínicos Gerais
Pediatras
Cirurgiões

Esse processo é repetido até que os três turnos estejam configurados.

Tecnologias utilizadas
Portugol
VisualG
Trello

Esta Sprint representa a etapa inicial do sistema. As próximas Sprints irão adicionar novas funcionalidades.