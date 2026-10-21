algoritmo "SistemaEscalaMedica"

const
   MAX_MEDICOS = 50

var
   identificadores: vetor[1..MAX_MEDICOS] de inteiro
   nomes: vetor[1..MAX_MEDICOS] de caractere
   especialidades: vetor[1..MAX_MEDICOS] de caractere
   disponibilidades: vetor[1..MAX_MEDICOS] de caractere
   totalCadastrados, opcao: inteiro

// função para verificar se o identificador já existe (user story 11)
funcao existeIdentificador(id: inteiro): logico
var
   i: inteiro
   encontrou: logico
inicio
   encontrou <- falso
   para i de 1 ate totalCadastrados faca
      se identificadores[i] = id entao
         encontrou <- verdadeiro
      fimSe
   fimPara
   retorne encontrou
fimFuncao

// procedimento de cadastro (user story 10 e 11)
procedimento cadastrarMedico()
var
   idTemp: inteiro
inicio
   limpaTela
   escreval("--- CADASTRO DE MÉDICO ---")

   se totalCadastrados >= MAX_MEDICOS entao
      escreval("Erro: Limite máximo de médicos cadastrados atingido!")
      retorne
   fimSe

   escreva("Digite o identificador numérico do médico: ")
leia(idTemp)

   // impede cadastro com o mesmo ID
   se existeIdentificador(idTemp) entao
      escreval()
      escreval("[ERRO] Já existe um médico cadastrado com o identificador '", idTemp, "'. Cadastro negado!")
      retorne
   fimSe

   // incrementa temporariamente para salvar na próxima posição livre
   totalCadastrados <- totalCadastrados + 1

   identificadores[totalCadastrados] <- idTemp

   escreva("Digite o nome do médico: ")
   leia(nomes[totalCadastrados])

   escreva("Digite a especialidade do médico: ")
   leia(especialidades[totalCadastrados])

   escreva("Digite a disponibilidade por turno: ")
   leia(disponibilidades[totalCadastrados])

   escreval()
   escreval("[SUCESSO] Médico cadastrado com sucesso!")
fimProcedimento

// procedimento para listar os médicos cadastrados
procedimento listarMedicos()
var
   i: inteiro
inicio
   limpaTela
   escreval("--- MÉDICOS CADASTRADOS ---")

   se totalCadastrados = 0 entao
      escreval("Nenhum médico cadastrado até o momento.")
      retorne
   fimSe

   para i de 1 ate totalCadastrados faca
      escreval("------------------------------------")
      escreval("ID: ", identificadores[i])
      escreval("Nome: ", nomes[i])
      escreval("Especialidade: ", especialidades[i])
      escreval("Disponibilidade: ", disponibilidades[i])
   fimPara
   escreval("------------------------------------")
fimProcedimento

// programa Principal
inicio
   totalCadastrados <- 0

   repita
      escreval()
      escreval("=== SISTEMA DE ESCALA MÉDICA ===")
      escreval("1. Cadastrar Médico")
      escreval("2. Listar Médicos Cadastrados")
      escreval("3. Sair")
      escreva("Escolha uma opção: ")
      leia(opcao)

      escolha opcao
      caso 1
         cadastrarMedico()
      caso 2
         listarMedicos()
      caso 3
         escreval("Encerrando o programa...")
      outroCaso
         escreval("Opção inválida! Tente novamente.")
      fimEscolha

   ate opcao = 3

fimalgoritmo