algoritmo "SistemaEscalaMedica"

var
   identificadores: vetor[1..24] de inteiro
   nomes: vetor[1..24] de caractere
   especialidades: vetor[1..24] de caractere
   disponibilidades: vetor[1..24] de caractere
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
   //opContCadastro: guarda a opção de escolha do usuário quando perguntado
   //se quer cadastrar mais médicos
   opContCadastro: inteiro
   //validoDispTurno: serve para verificar se o médico tem disponibilidade para
   //o turno escolhido na escalação
   //validoEsp: serve para verificar se o médico pode atuar na especialidade
   //escolhida na escalação
   validoDispTurno: logico
   validoEsp: logico
   //opContEscalacao: guarda a opção de escolha do usuário quando perguntado
   //se quer escalar mais médicos
   opContEscalacao: inteiro

inicio
   totalCadastrados <- 0
   maxMedicos <- 24
   opcao <- 0

   enquanto opcao <> 4 faca
      escreval("")
      escreval("=== SISTEMA DE ESCALA MÉDICA ===")
      escreval("1. Cadastrar Médico")
      escreval("2. Consultar Médico por Identificador")
      escreval("3. Escalar Médico no plantão")
      escreval("4. Sair")
      escreva("Escolha uma opção: ")
      leia(opcao)

      // opção 1: cadastro de médico (user story 10 e 11)
      se opcao = 1 entao
         opContCadastro <- 1
         enquanto opContCadastro = 1 faca
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
                     escreval("1. Clínico Geral")
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
                        espTemp <- "Clínico Geral"
                     fimse
                     se opEsp = 2 entao
                        espTemp <- "Pediatra"
                     fimse
                     se opEsp = 3 entao
                        espTemp <- "Cirurgião"
                     fimse

                     escreval("Escolha a disponibilidade por turno:")
                     escreval("1. Manhã")
                     escreval("2. Tarde")
                     escreval("3. Noite")
                     escreval("4. Manhã/Tarde")
                     escreval("5. Manhã/Noite")
                     escreval("6. Tarde/Noite")

                     //opTurno: zerado antes do laço, a cada cadastro,
                     // pra não guardar o valor do cadastro anterior
                     opTurno <- 0
                     enquanto (opTurno < 1) ou (opTurno > 6) faca
                        escreva("Opcao: ")
                        leia(opTurno)
                        se (opTurno < 1) ou (opTurno > 6) entao
                           escreval("[ERRO] Opcao invalida! Escolha 1 a 6.")
                        fimse
                     fimenquanto
                     se opTurno = 1 entao
                        dispTemp <- "Manhã"
                     fimse
                     se opTurno = 2 entao
                        dispTemp <- "Tarde"
                     fimse
                     se opTurno = 3 entao
                        dispTemp <- "Noite"
                     fimse
                     se opTurno = 4 entao
                        dispTemp <- "Manhã/Tarde"
                     fimse
                     se opTurno = 5 entao
                        dispTemp <- "Manhã/Noite"
                     fimse
                     se opTurno = 6 entao
                        dispTemp <- "Tarde/Noite"
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
            escreval("Deseja cadastrar mais médicos?")
            escreval("1. Sim")
            escreval("2. Nao")
            escreval("")
            leia(opContCadastro)

            enquanto (opContCadastro < 1) ou (opContCadastro > 2) faca
               escreval("ERRO! Opção inválida. Escolha 1 ou 2.")
               escreva("Opção: ")
               leia(opContCadastro)
            fimenquanto
         fimenquanto
         limpatela
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

      // opção 3: escalar médico no plantão
      se opcao = 3 entao
         limpatela
         escreval ("ESCALAÇÃO DE MÉDICOS")
         se totalCadastrados = 0 entao
            escreval("Nenhum medico cadastrado ate o momento.")
         senao
            opContEscalacao <- 1
            enquanto opContEscalacao = 1 faca
               Escreval("Lista geral dos Médicos Cadastrados:")
               para i de 1 ate totalCadastrados faca
                  Escreval("----------------------------------------")
                  Escreval("Identificador: ", identificadores[i])
                  Escreval("Nome ",nomes[i])
                  Escreval("Especialidade: ", especialidades[i])
                  Escreval("Disponibilidade :", disponibilidades[i])
                  Escreval("----------------------------------------")
               fimpara
               escreval ("Digite o identificador númerico do médico que deseja escalar: ")
               leia (idBusca)
               encontrado <- falso
               posicao <- 0
               para i de 1 ate totalCadastrados faca
                  se identificadores[i] = idBusca entao
                     encontrado <- verdadeiro
                     posicao <- i
                  fimse
               fimpara
               se encontrado entao
                  escreval ("Em qual plantão deseja cadastrar o médico",idBusca,"?")
                  escreval ("1. Manhã")
                  escreval ("2. Tarde")
                  escreval ("3. Noite")
                  escreval ("4. Manhã/Tarde")
                  escreval ("5. Manhã/Noite")
                  escreval ("6. Tarde/Noite")
                  opTurno <- 0
                  enquanto (opTurno < 1) ou (opTurno > 6) faca
                     escreva ("Opção: ")
                     leia (opTurno)
                     se (opTurno < 1) ou (opTurno > 6) entao
                        escreval ("[ERRO] Escolha uma opção de 1 a 6.")
                     fimse
                  fimenquanto
                  dispTemp <- disponibilidades[posicao]
                  validoDispTurno <- falso
                  se (dispTemp = "Manhã") e (opTurno = 1) entao
                     validoDispTurno <- verdadeiro
                  fimse
                  se (dispTemp = "Tarde") e (opTurno = 2) entao
                     validoDispTurno <- verdadeiro
                  fimse
                  se (dispTemp = "Noite") e (opTurno = 3) entao
                     validoDispTurno <- verdadeiro
                  fimse
                  se (dispTemp = "Manhã/Tarde") e ((opTurno = 1) ou (opTurno = 2) ou (opTurno = 4)) entao
                     validoDispTurno <- verdadeiro
                  fimse
                  se (dispTemp = "Manhã/Noite") e ((opTurno = 1) ou (opTurno = 3) ou (opTurno = 5)) entao
                     validoDispTurno <- verdadeiro
                  fimse
                  se (dispTemp = "Tarde/Noite") e ((opTurno = 2) ou (opTurno = 3) ou (opTurno = 6)) entao
                     validoDispTurno <- verdadeiro
                  fimse
                  se validoDispTurno entao
                     escreval ("Médico escalado!")
                     escreval ("")
                     escreval ("Qual especialidade do médico?")
                     escreval ("1. Clínico Geral")
                     escreval ("2. Pediatra")
                     escreval ("3. Cirurgião")
                     opEsp <- 0
                     enquanto (opEsp < 1) ou (opEsp > 3) faca
                        escreva("Opcao: ")
                        leia(opEsp)
                        se (opEsp < 1) ou (opEsp > 3) entao
                           escreval("[ERRO] Opcao invalida! Escolha 1, 2 ou 3.")
                        fimse
                     fimenquanto
                     espTemp <- especialidades[posicao]
                     validoEsp <- falso
                     se (espTemp = "Clínico Geral") e (opEsp = 1) entao
                        validoEsp <- verdadeiro
                     fimse
                     se (espTemp = "Pediatra") e (opEsp = 2) entao
                        validoEsp <- verdadeiro
                     fimse
                     se (espTemp = "Cirurgião") e (opEsp = 3) entao
                        validoEsp <- verdadeiro
                     fimse
                     se validoEsp entao
                        escreval ("Médico escalado!")
                        escreval("")
                        escreval("Deseja escalar mais médicos?")
                        escreval("1. Sim")
                        escreval("2. Nao")
                        escreval("")
                        leia(opContEscalacao)

                        enquanto (opContEscalacao < 1) ou (opContEscalacao > 2) faca
                           escreval("ERRO! Opção inválida. Escolha 1 ou 2.")
                           escreva("Opção: ")
                           leia(opContEscalacao)
                        fimenquanto
                     senao
                        escreval ("[ERRO] O médico não pode atuar nessa especialidade.")
                     fimse
                  senao
                     escreval ("[ERRO] O médico não tem disponibilidade para este turno.")
                  fimse
               senao
                  escreval("Medico com identificador ", idBusca, " nao encontrado.")
               fimse
            fimenquanto
            limpatela
         fimse
      fimse

      // opção 4: Sair
      se opcao = 4 entao
         escreval("Encerrando o programa...")
      fimse

      se (opcao < 1) ou (opcao > 4) entao
         escreval("Opção inválida! Tente novamente.")
      fimse
   fimenquanto
fimalgoritmo