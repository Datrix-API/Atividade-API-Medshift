algoritmo "SistemaEscalaMedica"

var
   identificadores: vetor[1..50] de inteiro
   nomes: vetor[1..50] de caractere
   especialidades: vetor[1..50] de caractere
   disponibilidades: vetor[1..50] de caractere
   totalCadastrados, opcao, maxMedicos: inteiro
   idTemp, i: inteiro
   nomeTemp, espTemp, dispTemp: caractere
   existe: logico
   //idBusca: guarda o identificador digitado na consulta
   //posicao: guarda em qual posição dos vetores o médico foi encontrado
   idBusca, posicao: inteiro
   //encontrado: indica se o identificador buscado existe no cadastro
   encontrado: logico
   //opEsp: guarda o número da especialidade escolhida no menu
   //opTurno: guarda o número do turno escolhido no menu
   opEsp, opTurno: inteiro

inicio
   totalCadastrados <- 0
   maxMedicos <- 50
   opcao <- 0

   enquanto opcao <> 3 faca
      escreval("")
      escreval("=== SISTEMA DE ESCALA MÉDICA ===")
      escreval("1. Cadastrar Médico")
      escreval("2. Consultar Médico por Identificador")
      escreval("3. Sair")
      escreva("Escolha uma opção: ")
      leia(opcao)

      // opção 1: cadastro de médico (user story 10 e 11)
      se opcao = 1 entao
         limpatela
         escreval("--- CADASTRO DE MÉDICO ---")

         se totalCadastrados >= maxMedicos entao
            escreval("[ERRO] Limite máximo de médicos cadastrados atingido!")
         senao
            escreva("Digite o identificador numérico do médico: ")
            leia(idTemp)

            se idTemp <= 0 entao
               escreval("")
               escreval("[ERRO] O identificador deve ser um número maior que zero.")
            senao
               // verifica se o ID já existe
               existe <- falso
               para i de 1 ate totalCadastrados faca
                  se identificadores[i] = idTemp entao
                     existe <- verdadeiro
                  fimse
               fimpara

               se existe entao
                  escreval("")
                  escreval("[ERRO] Já existe um médico com o identificador ", idTemp, ". Cadastro negado!")
               senao
                  escreva("Digite o nome do médico: ")
                  leia(nomeTemp)

                  escreval("Escolha a especialidade do médico:")
                  escreval("1. Clinico")
                  escreval("2. Pediatra")
                  escreval("3. Cirurgiao")
                  // opEsp: zerado antes do laço, a cada cadastro
                  // pra não guardar o valor do cadastro anterior
                  opEsp <- 0
                  enquanto (opEsp < 1) ou (opEsp > 3) faca
                     escreva("Opcao: ")
                     leia(opEsp)
                     se (opEsp < 1) ou (opEsp > 3) entao
                        escreval("[ERRO] Opcao invalida! Escolha 1, 2 ou 3.")
                     fimse
                  fimenquanto
                  se opEsp = 1 entao
                     espTemp <- "Clinico"
                  fimse
                  se opEsp = 2 entao
                     espTemp <- "Pediatra"
                  fimse
                  se opEsp = 3 entao
                     espTemp <- "Cirurgiao"
                  fimse

                  escreval("Escolha o turno de disponibilidade:")
                  escreval("1. Manha")
                  escreval("2. Tarde")
                  escreval("3. Noite")
                  //opTurno: zerado antes do laço, a cada cadastro,
                  // pra não guardar o valor do cadastro anterior
                  opTurno <- 0
                  enquanto (opTurno < 1) ou (opTurno > 3) faca
                     escreva("Opcao: ")
                     leia(opTurno)
                     se (opTurno < 1) ou (opTurno > 3) entao
                        escreval("[ERRO] Opcao invalida! Escolha 1, 2 ou 3.")
                     fimse
                  fimenquanto
                  se opTurno = 1 entao
                     dispTemp <- "Manha"
                  fimse
                  se opTurno = 2 entao
                     dispTemp <- "Tarde"
                  fimse
                  se opTurno = 3 entao
                     dispTemp <- "Noite"
                  fimse

                  // só grava depois de ter todos os dados
                  totalCadastrados <- totalCadastrados + 1
                  identificadores[totalCadastrados] <- idTemp
                  nomes[totalCadastrados] <- nomeTemp
                  especialidades[totalCadastrados] <- espTemp
                  disponibilidades[totalCadastrados] <- dispTemp

                  escreval("")
                  escreval("[SUCESSO] Médico cadastrado com sucesso!")
               fimse
            fimse
         fimse
      fimse

      // opção 2: consulta por identificador
      se opcao = 2 entao
         limpatela
         escreval("CONSULTA DE MEDICO")

         se totalCadastrados = 0 entao
            escreval("Nenhum medico cadastrado ate o momento.")
         senao
            escreva("Digite o identificador do medico: ")
            leia(idBusca)

            // encontrado e posicao: começam zerados a cada consulta
            encontrado <- falso
            posicao <- 0
            para i de 1 ate totalCadastrados faca
               se identificadores[i] = idBusca entao
                  encontrado <- verdadeiro
                  posicao <- i
               fimse
            fimpara

            se encontrado entao
               escreval("ID: ", identificadores[posicao])
               escreval("Nome: ", nomes[posicao])
               escreval("Especialidade: ", especialidades[posicao])
               escreval("Disponibilidade: ", disponibilidades[posicao])
            senao
               escreval("Medico com identificador ", idBusca, " nao encontrado.")
            fimse
         fimse
      fimse

      // opção 3: sair
      se opcao = 3 entao
         escreval("Encerrando o programa...")
      fimse

      se (opcao < 1) ou (opcao > 3) entao
         escreval("Opção inválida! Tente novamente.")
      fimse

   fimenquanto
fimalgoritmo