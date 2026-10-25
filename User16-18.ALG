
algoritmo "SistemaEscalaMedica"

var
   identificadores: vetor[1..24] de inteiro
   nomes: vetor[1..24] de caractere
   especialidades: vetor[1..24] de caractere
   disponibilidades: vetor[1..24] de caractere

   codEspecialidades: vetor[1..24] de inteiro
   codDisponibilidades: vetor[1..24] de inteiro
   turnosEscalados: vetor[1..24] de inteiro
   escalados: vetor[1..24] de logico

   totalCadastrados, maxMedicos, opcao: inteiro
   idTemp, idBusca, posicao, i: inteiro
   nomeTemp: caractere

   opEsp, opTurno: inteiro
   opContCadastro, opContEscalacao: inteiro
   turnoConsulta, espConsulta: inteiro

   existe, encontrado, jaEscalado: logico
   validoDispTurno, validoEsp: logico
   turnoCompativel: logico

inicio

   totalCadastrados <- 0
   maxMedicos <- 24
   opcao <- 0

   para i de 1 ate 24 faca
      escalados[i] <- falso
      turnosEscalados[i] <- 0
   fimpara

   enquanto opcao <> 5 faca

      escreval("")
      escreval("=== SISTEMA DE ESCALA MEDICA ===")
      escreval("1. Cadastrar Medico")
      escreval("2. Consultar Medico por Identificador")
      escreval("3. Escalar Medico no Plantao")
      escreval("4. Consultar Medicos Escalados")
      escreval("5. Sair")
      escreva("Escolha uma opcao: ")
      leia(opcao)

      // =====================================
      // OPCAO 1 - CADASTRAR MEDICO
      // =====================================

      se opcao = 1 entao

         opContCadastro <- 1

         enquanto opContCadastro = 1 faca

            limpatela
            escreval("=== CADASTRO DE MEDICO ===")

            se totalCadastrados >= maxMedicos entao

               escreval("[ERRO] Limite de 24 medicos atingido!")

            senao

               escreva("Digite o identificador do medico: ")
               leia(idTemp)

               se idTemp <= 0 entao

                  escreval("[ERRO] O ID deve ser maior que zero.")

               senao

                  existe <- falso

                  para i de 1 ate totalCadastrados faca
                     se identificadores[i] = idTemp entao
                        existe <- verdadeiro
                     fimse
                  fimpara

                  se existe entao

                     escreval("[ERRO] Identificador ja cadastrado!")

                  senao

                     escreva("Digite o nome do medico: ")
                     leia(nomeTemp)

                     escreval("")
                     escreval("Escolha a especialidade:")
                     escreval("1. Clinico Geral")
                     escreval("2. Pediatra")
                     escreval("3. Cirurgiao")

                     opEsp <- 0

                     enquanto (opEsp < 1) ou (opEsp > 3) faca
                        escreva("Opcao: ")
                        leia(opEsp)

                        se (opEsp < 1) ou (opEsp > 3) entao
                           escreval("[ERRO] Escolha 1, 2 ou 3.")
                        fimse
                     fimenquanto

                     escreval("")
                     escreval("Escolha a disponibilidade:")
                     escreval("1. Manha")
                     escreval("2. Tarde")
                     escreval("3. Noite")
                     escreval("4. Manha/Tarde")
                     escreval("5. Manha/Noite")
                     escreval("6. Tarde/Noite")

                     opTurno <- 0

                     enquanto (opTurno < 1) ou (opTurno > 6) faca
                        escreva("Opcao: ")
                        leia(opTurno)

                        se (opTurno < 1) ou (opTurno > 6) entao
                           escreval("[ERRO] Escolha de 1 a 6.")
                        fimse
                     fimenquanto

                     totalCadastrados <- totalCadastrados + 1

                     identificadores[totalCadastrados] <- idTemp
                     nomes[totalCadastrados] <- nomeTemp

                     codEspecialidades[totalCadastrados] <- opEsp
                     codDisponibilidades[totalCadastrados] <- opTurno

                     se opEsp = 1 entao
                        especialidades[totalCadastrados] <- "Clinico Geral"
                     fimse

                     se opEsp = 2 entao
                        especialidades[totalCadastrados] <- "Pediatra"
                     fimse

                     se opEsp = 3 entao
                        especialidades[totalCadastrados] <- "Cirurgiao"
                     fimse

                     se opTurno = 1 entao
                        disponibilidades[totalCadastrados] <- "Manha"
                     fimse

                     se opTurno = 2 entao
                        disponibilidades[totalCadastrados] <- "Tarde"
                     fimse

                     se opTurno = 3 entao
                        disponibilidades[totalCadastrados] <- "Noite"
                     fimse

                     se opTurno = 4 entao
                        disponibilidades[totalCadastrados] <- "Manha/Tarde"
                     fimse

                     se opTurno = 5 entao
                        disponibilidades[totalCadastrados] <- "Manha/Noite"
                     fimse

                     se opTurno = 6 entao
                        disponibilidades[totalCadastrados] <- "Tarde/Noite"
                     fimse

                     escalados[totalCadastrados] <- falso
                     turnosEscalados[totalCadastrados] <- 0

                     escreval("")
                     escreval("[SUCESSO] Medico cadastrado!")

                  fimse
               fimse
            fimse

            escreval("")
            escreval("Deseja cadastrar mais medicos?")
            escreval("1. Sim")
            escreval("2. Nao")
            leia(opContCadastro)

            enquanto (opContCadastro < 1) ou (opContCadastro > 2) faca
               escreval("[ERRO] Escolha 1 ou 2.")
               leia(opContCadastro)
            fimenquanto

         fimenquanto

         limpatela

      fimse

      // =====================================
      // OPCAO 2 - CONSULTAR MEDICO
      // =====================================

      se opcao = 2 entao

         limpatela
         escreval("=== CONSULTA DE MEDICO ===")

         se totalCadastrados = 0 entao

            escreval("Nenhum medico cadastrado.")

         senao

            escreva("Digite o identificador: ")
            leia(idBusca)

            encontrado <- falso
            posicao <- 0

            para i de 1 ate totalCadastrados faca
               se identificadores[i] = idBusca entao
                  encontrado <- verdadeiro
                  posicao <- i
               fimse
            fimpara

            se encontrado entao

               escreval("---------------------------")
               escreval("ID: ", identificadores[posicao])
               escreval("Nome: ", nomes[posicao])
               escreval("Especialidade: ", especialidades[posicao])
               escreval("Disponibilidade: ", disponibilidades[posicao])

               se escalados[posicao] entao
                  escreval("Situacao: Escalado")
               senao
                  escreval("Situacao: Nao escalado")
               fimse

               escreval("---------------------------")

            senao

               escreval("[ERRO] Medico nao encontrado.")

            fimse
         fimse
      fimse

      // =====================================
      // OPCAO 3 - ESCALAR MEDICO
      // =====================================

      se opcao = 3 entao

         limpatela
         escreval("=== ESCALACAO DE MEDICOS ===")

         se totalCadastrados = 0 entao

            escreval("Nenhum medico cadastrado.")

         senao

            opContEscalacao <- 1

            enquanto opContEscalacao = 1 faca

               escreval("")
               escreval("=== MEDICOS CADASTRADOS ===")

               para i de 1 ate totalCadastrados faca

                  escreval("---------------------------")
                  escreval("ID: ", identificadores[i])
                  escreval("Nome: ", nomes[i])
                  escreval("Especialidade: ", especialidades[i])
                  escreval("Disponibilidade: ", disponibilidades[i])

                  se escalados[i] entao
                     escreval("Situacao: Ja escalado")
                  senao
                     escreval("Situacao: Disponivel para escala")
                  fimse

               fimpara

               escreval("---------------------------")
               escreva("Digite o ID do medico: ")
               leia(idBusca)

               encontrado <- falso
               posicao <- 0

               para i de 1 ate totalCadastrados faca
                  se identificadores[i] = idBusca entao
                     encontrado <- verdadeiro
                     posicao <- i
                  fimse
               fimpara

               se encontrado entao

                  jaEscalado <- escalados[posicao]

                  se jaEscalado entao

                     escreval("[ERRO] Medico ja escalado!")

                  senao

                     escreval("")
                     escreval("Escolha o turno do plantao:")
                     escreval("1. Manha")
                     escreval("2. Tarde")
                     escreval("3. Noite")
                     escreval("4. Manha/Tarde")
                     escreval("5. Manha/Noite")
                     escreval("6. Tarde/Noite")

                     opTurno <- 0

                     enquanto (opTurno < 1) ou (opTurno > 6) faca
                        escreva("Opcao: ")
                        leia(opTurno)

                        se (opTurno < 1) ou (opTurno > 6) entao
                           escreval("[ERRO] Escolha de 1 a 6.")
                        fimse
                     fimenquanto

                     validoDispTurno <- falso

                     se codDisponibilidades[posicao] = opTurno entao
                        validoDispTurno <- verdadeiro
                     fimse

                     se codDisponibilidades[posicao] = 4 entao
                        se (opTurno = 1) ou (opTurno = 2) entao
                           validoDispTurno <- verdadeiro
                        fimse
                     fimse

                     se codDisponibilidades[posicao] = 5 entao
                        se (opTurno = 1) ou (opTurno = 3) entao
                           validoDispTurno <- verdadeiro
                        fimse
                     fimse

                     se codDisponibilidades[posicao] = 6 entao
                        se (opTurno = 2) ou (opTurno = 3) entao
                           validoDispTurno <- verdadeiro
                        fimse
                     fimse

                     se validoDispTurno entao

                        escreval("")
                        escreval("Escolha a especialidade:")
                        escreval("1. Clinico Geral")
                        escreval("2. Pediatra")
                        escreval("3. Cirurgiao")

                        opEsp <- 0

                        enquanto (opEsp < 1) ou (opEsp > 3) faca
                           escreva("Opcao: ")
                           leia(opEsp)

                           se (opEsp < 1) ou (opEsp > 3) entao
                              escreval("[ERRO] Escolha 1, 2 ou 3.")
                           fimse
                        fimenquanto

                        validoEsp <- falso

                        se codEspecialidades[posicao] = opEsp entao
                           validoEsp <- verdadeiro
                        fimse

                        se validoEsp entao

                           escalados[posicao] <- verdadeiro
                           turnosEscalados[posicao] <- opTurno

                           escreval("")
                           escreval("[SUCESSO] Medico escalado!")
                           escreval("Nome: ", nomes[posicao])
                           escreval("Especialidade: ", especialidades[posicao])

                        senao

                           escreval("[ERRO] Medico nao atua nessa especialidade.")

                        fimse

                     senao

                        escreval("[ERRO] Medico sem disponibilidade para esse turno.")

                     fimse

                  fimse

               senao

                  escreval("[ERRO] Identificador nao encontrado.")

               fimse

               escreval("")
               escreval("Deseja escalar mais medicos?")
               escreval("1. Sim")
               escreval("2. Nao")
               leia(opContEscalacao)

               enquanto (opContEscalacao < 1) ou (opContEscalacao > 2) faca
                  escreval("[ERRO] Escolha 1 ou 2.")
                  leia(opContEscalacao)
               fimenquanto

               limpatela

            fimenquanto

         fimse

      fimse

      // =====================================
      // OPCAO 4 - CONSULTAR ESCALADOS
      // =====================================

      se opcao = 4 entao

         limpatela

         escreval("=== CONSULTAR MEDICOS ESCALADOS ===")
         escreval("")
         escreval("Escolha o turno:")
         escreval("1. Manha")
         escreval("2. Tarde")
         escreval("3. Noite")

         turnoConsulta <- 0

         enquanto (turnoConsulta < 1) ou (turnoConsulta > 3) faca

            escreva("Opcao: ")
            leia(turnoConsulta)

            se (turnoConsulta < 1) ou (turnoConsulta > 3) entao
               escreval("[ERRO] Escolha 1, 2 ou 3.")
            fimse

         fimenquanto

         escreval("")
         escreval("Escolha a especialidade:")
         escreval("1. Clinico Geral")
         escreval("2. Pediatra")
         escreval("3. Cirurgiao")
         escreval("4. Todas as especialidades")

         espConsulta <- 0

         enquanto (espConsulta < 1) ou (espConsulta > 4) faca

            escreva("Opcao: ")
            leia(espConsulta)

            se (espConsulta < 1) ou (espConsulta > 4) entao
               escreval("[ERRO] Escolha de 1 a 4.")
            fimse

         fimenquanto

         encontrado <- falso

         escreval("")
         escreval("=== RESULTADO DA CONSULTA ===")

         para i de 1 ate totalCadastrados faca

            turnoCompativel <- falso

            // Verifica turnos individuais

            se turnosEscalados[i] = turnoConsulta entao
               turnoCompativel <- verdadeiro
            fimse

            // Manha/Tarde

            se turnosEscalados[i] = 4 entao

               se (turnoConsulta = 1) ou (turnoConsulta = 2) entao
                  turnoCompativel <- verdadeiro
               fimse

            fimse

            // Manha/Noite

            se turnosEscalados[i] = 5 entao

               se (turnoConsulta = 1) ou (turnoConsulta = 3) entao
                  turnoCompativel <- verdadeiro
               fimse

            fimse

            // Tarde/Noite

            se turnosEscalados[i] = 6 entao

               se (turnoConsulta = 2) ou (turnoConsulta = 3) entao
                  turnoCompativel <- verdadeiro
               fimse

            fimse

            // Filtra medicos escalados

            se escalados[i] entao

               se turnoCompativel entao

                  se (codEspecialidades[i] = espConsulta) ou (espConsulta = 4) entao

                     escreval("---------------------------")
                     escreval("ID: ", identificadores[i])
                     escreval("Nome: ", nomes[i])
                     escreval("Especialidade: ", especialidades[i])
                     escreval("Disponibilidade: ", disponibilidades[i])
                     escreval("---------------------------")

                     encontrado <- verdadeiro

                  fimse

               fimse

            fimse

         fimpara

         se nao encontrado entao
            escreval("Nenhum medico escalado para esse filtro.")
         fimse

      fimse

      // =====================================
      // OPCAO 5 - SAIR
      // =====================================

      se opcao = 5 entao
         escreval("Encerrando o programa...")
      fimse

      se (opcao < 1) ou (opcao > 5) entao
         escreval("[ERRO] Opcao invalida!")
      fimse

   fimenquanto

fimalgoritmo

      
      
      
      
      
      
      
      
      // opção 5: Sair
      se opcao = 5 entao
         escreval("Encerrando o programa...")
      fimse

      se (opcao < 1) ou (opcao > 4) entao
         escreval("Opção inválida! Tente novamente.")
      fimse
   fimenquanto
fimalgoritmo