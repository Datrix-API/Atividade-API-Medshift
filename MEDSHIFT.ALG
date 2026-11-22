algoritmo "SistemaEscalaMedica"


var
   identificadores: vetor[1..24] de inteiro
   nomes: vetor[1..24] de caractere
   especialidades: vetor[1..24] de caractere
   disponibilidades: vetor[1..24] de caractere

   codEspecialidades: vetor[1..24] de inteiro
   codDisponibilidades: vetor[1..24] de inteiro

   totalCadastrados, maxMedicos, opcao: inteiro
   idTemp, idBusca, posicao, i: inteiro
   nomeTemp: caractere

   opEsp, opTurno: inteiro
   opContCadastro, opContEscalacao: inteiro
   turnoConsulta, espConsulta: inteiro

   qtdPlantoes: inteiro

   existe, encontrado, jaEscalado: logico
   validoDispTurno, validoEsp: logico

   opDiaSemana: inteiro
   diaSemana: caracter

   escala: vetor[1..24, 1..15] de logico
   coluna, colunaAnterior: inteiro
   cargaAtual: inteiro
   qtdPlantoesDia: inteiro
   qtdClinicos, qtdPediatras, qtdCirurgioes: inteiro
   faltaClinicos, faltaPediatras, faltaCirurgioes: inteiro
   x: inteiro
   descansoValido: logico

inicio

   totalCadastrados <- 0
   maxMedicos <- 24
   opcao <- 0

   para i de 1 ate 24 faca
      para x de 1 ate 15 faca
         escala[i,x] <- falso
      fimpara
   fimpara

   enquanto opcao <> 6 faca

      escreval("")
      escreval("=== SISTEMA DE ESCALA MEDICA ===")
      escreval("1. Cadastrar Medico")
      escreval("2. Consultar Medico por Identificador")
      escreval("3. Escalar Medico no Plantao")
      escreval("4. Consultar Medicos Escalados")
      escreval("5. Vizualizar Cobertura Semanal")
      escreval("6. Sair")
      escreva("Escolha uma opcao: ")
      leia(opcao)
      escolha(opcao)

         // =====================================
         // OPCAO 1 - CADASTRAR MEDICO
         // =====================================

      caso 1

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
                     escreval("7. Manha/Tarde/Noite")

                     opTurno <- 0

                     enquanto (opTurno < 1) ou (opTurno > 7) faca
                        escreva("Opcao: ")
                        leia(opTurno)

                        se (opTurno < 1) ou (opTurno > 7) entao
                           escreval("[ERRO] Escolha de 1 a 7.")
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

                     se opTurno = 7 entao
                        disponibilidades[totalCadastrados] <- "Manha/Tarde/Noite"
                     fimse

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

         // =====================================
         // OPCAO 2 - CONSULTAR MEDICO
         // =====================================

      caso 2

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

               qtdPlantoes <- 0

               para x de 1 ate 15 faca
                  se escala[posicao,x] entao
                     qtdPlantoes <- qtdPlantoes + 1
                  fimse
               fimpara

               escreval("---------------------------")
               escreval("ID: ", identificadores[posicao])
               escreval("Nome: ", nomes[posicao])
               escreval("Especialidade: ", especialidades[posicao])
               escreval("Disponibilidade: ", disponibilidades[posicao])

               se qtdPlantoes > 0 entao
                  escreval("Situacao: Escalado")
               senao
                  escreval("Situacao: Nao escalado")
               fimse

               // exibe a quantidade de plantoes atribuidos
               escreval("Plantoes atribuidos: ", qtdPlantoes)

               escreval("---------------------------")

            senao

               escreval("[ERRO] Medico nao encontrado.")

            fimse
         fimse

         // =====================================
         // OPCAO 3 - ESCALAR MEDICO
         // =====================================

      caso 3

         limpatela
         escreval("=== ESCALACAO DE MEDICOS ===")

         se totalCadastrados = 0 entao

            escreval("Nenhum medico cadastrado.")

         senao

            opContEscalacao <- 1

            enquanto opContEscalacao = 1 faca

               escreval("")
               escreval("=== MEDICOS CADASTRADOS ===")
               escreval("ID   Especialidade   Disponibilidade     Plantoes  Nome")
               escreval("------------------------------------------------------------")

               para i de 1 ate totalCadastrados faca

                  // conta os plantoes do medico i
                  cargaAtual <- 0
                  para x de 1 ate 15 faca
                     se escala[i,x] entao
                        cargaAtual <- cargaAtual + 1
                     fimse
                  fimpara

                  // coluna ID (largura 5)
                  escreva(identificadores[i])
                  se identificadores[i] < 10 entao
                     escreva("    ")
                  fimse
                  se (identificadores[i] >= 10) e (identificadores[i] < 100) entao
                     escreva("   ")
                  fimse
                  se identificadores[i] >= 100 entao
                     escreva("  ")
                  fimse

                  // coluna Especialidade (largura 16)
                  escreva(especialidades[i])
                  se codEspecialidades[i] = 1 entao
                     escreva("   ")
                  fimse
                  se codEspecialidades[i] = 2 entao
                     escreva("        ")
                  fimse
                  se codEspecialidades[i] = 3 entao
                     escreva("       ")
                  fimse

                  // coluna Disponibilidade (largura 20)
                  escreva(disponibilidades[i])
                  se codDisponibilidades[i] <= 3 entao
                     escreva("               ")
                  fimse
                  se (codDisponibilidades[i] >= 4) e (codDisponibilidades[i] <= 6) entao
                     escreva("         ")
                  fimse
                  se codDisponibilidades[i] = 7 entao
                     escreva("   ")
                  fimse

                  // coluna Plantoes (largura 10) e, por ultimo, o Nome
                  escreva(cargaAtual, "         ")
                  escreval(nomes[i])

               fimpara

               escreval("------------------------------------------------------------")
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

                  escreval("")
                  escreval("Escolha o dia da semana:")
                  escreval("1. Segunda-feira")
                  escreval("2. Terça-feira")
                  escreval("3. Quarta-feira")
                  escreval("4. Quinta-feira")
                  escreval("5. Sexta-feira")

                  opDiaSemana <- 0

                  enquanto (opDiaSemana < 1) ou (opDiaSemana > 5) faca
                     escreva ("Opcao: ")
                     leia (opDiaSemana)
                     se (opDiaSemana < 1) ou (opDiaSemana > 5) entao
                        escreval("[ERRO] Escolha de 1 a 5.")
                     fimse
                  fimenquanto

                  se opDiaSemana = 1 entao
                     diaSemana <- "Segunda-feira"
                  fimse
                  se opDiaSemana = 2 entao
                     diaSemana <- "Terça-feira"
                  fimse
                  se opDiaSemana = 3 entao
                     diaSemana <- "Quarta-feira"
                  fimse
                  se opDiaSemana = 4 entao
                     diaSemana <- "Quinta-feira"
                  fimse
                  se opDiaSemana = 5 entao
                     diaSemana <- "Sexta-feira"
                  fimse

                  escreval("")
                  escreval("Escolha o turno do plantao:")
                  escreval("1. Manha")
                  escreval("2. Tarde")
                  escreval("3. Noite")

                  opTurno <- 0

                  enquanto (opTurno < 1) ou (opTurno > 3) faca
                     escreva("Opcao: ")
                     leia(opTurno)

                     se (opTurno < 1) ou (opTurno > 3) entao
                        escreval("[ERRO] Escolha de 1 a 3.")
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

                  se codDisponibilidades[posicao] = 7 entao
                     se (opTurno = 1) ou (opTurno = 2) ou (opTurno = 3) entao
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

                        // calcula a coluna correspondente ao dia e turno
                        coluna <- ((opDiaSemana - 1) * 3) + opTurno

                        // verifica se o medico ja esta nesse plantao
                        se escala[posicao,coluna] entao

                           escreval("[ERRO] Medico ja escalado nesse plantao.")
                        senao
                           qtdPlantoesDia <- 0
                           coluna <- ((opDiaSemana - 1) * 3) + 1
                           para x de coluna ate coluna + 2 faca

                              se escala[posicao,x] entao
                                 qtdPlantoesDia <- qtdPlantoesDia + 1
                              fimse
                           fimpara
                           se qtdPlantoesDia >= 2 entao
                              escreval("[ERRO] Medico ja possui 2 plantoes nesse dia.")
                           senao

                              descansoValido <- verdadeiro
                              se (opTurno = 1) e (opDiaSemana > 1) entao
                                 colunaAnterior <- ((opDiaSemana - 1) * 3)
                                 se escala[posicao,colunaAnterior] entao
                                    descansoValido <- falso
                                 fimse
                              fimse

                              // impede escala noturna se ja estiver na manha seguinte
                              se (opTurno = 3) e (opDiaSemana < 5) entao

                                 colunaAnterior <- (opDiaSemana * 3) + 1

                                 se escala[posicao,colunaAnterior] entao
                                    descansoValido <- falso
                                 fimse
                              fimse
                              se nao descansoValido entao
                                 escreval("[ERRO] Conflito com o turno da noite/manhã do dia seguinte.")
                              senao
                                 se cargaAtual >= 5 entao
                                    escreval("[ERRO] Medico ja atingiu o limite de 5 plantoes semanais.")
                                 senao
                                    // registra o novo plantao
                                    coluna <- ((opDiaSemana - 1) * 3) + opTurno
                                    escala[posicao,coluna] <- verdadeiro
                                    escreval("")
                                    escreval("[SUCESSO] Medico escalado!")
                                    escreval("Nome: ", nomes[posicao])
                                    escreval("Especialidade: ", especialidades[posicao])
                                    escreval("Plantoes no dia: ", qtdPlantoesDia + 1)
                                    escreval("Plantoes na semana: ", cargaAtual + 1)
                                 fimse
                              fimse
                           fimse
                        fimse
                     senao
                        escreval("[ERRO] Medico nao atua nessa especialidade.")
                     fimse
                  senao
                     escreval("[ERRO] Medico sem disponibilidade para esse turno.")
                  fimse
               senao
                  escreval("[ERRO] Identificador nao encontrado.")
               fimse
               escreval("")
               escreval("Deseja continuar a escalação?")
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

         // =====================================
         // OPCAO 4 - CONSULTAR ESCALADOS
         // =====================================

      caso 4

         limpatela

         escreval("")
         escreval("Escolha o dia da semana:")
         escreval("1. Segunda-feira")
         escreval("2. Terça-feira")
         escreval("3. Quarta-feira")
         escreval("4. Quinta-feira")
         escreval("5. Sexta-feira")

         opDiaSemana <- 0

         enquanto (opDiaSemana < 1) ou (opDiaSemana > 5) faca

            escreva("Opcao: ")
            leia(opDiaSemana)

            se (opDiaSemana < 1) ou (opDiaSemana > 5) entao
               escreval("[ERRO] Escolha de 1 a 5.")
            fimse

         fimenquanto

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

         encontrado <- falso

         // Calcula a coluna do dia e turno escolhidos
         coluna <- ((opDiaSemana - 1) * 3) + turnoConsulta

         Escreval("")
         Escreval("=== RESULTADO DA CONSULTA ===")

         // primeiro conta quantos medicos estao nesse plantao
         qtdPlantoes <- 0
         para i de 1 ate totalCadastrados faca
            se escala[i,coluna] entao
               qtdPlantoes <- qtdPlantoes + 1
            fimse
         fimpara

         se qtdPlantoes = 0 entao

            Escreval("Nenhum medico escalado para esse filtro.")

         senao

            Escreval("ID   Especialidade   Disponibilidade     Nome")
            Escreval("------------------------------------------------------------")

            para i de 1 ate totalCadastrados faca

               se escala[i,coluna] entao

                  Escreva(identificadores[i])
                  se identificadores[i] < 10 entao
                     Escreva("    ")
                  fimse
                  se (identificadores[i] >= 10) e (identificadores[i] < 100) entao
                     Escreva("   ")
                  fimse
                  se identificadores[i] >= 100 entao
                     Escreva("  ")
                  fimse

                  escreva(especialidades[i])
                  se codEspecialidades[i] = 1 entao
                     Escreva("   ")
                  fimse
                  se codEspecialidades[i] = 2 entao
                     Escreva("        ")
                  fimse
                  se codEspecialidades[i] = 3 entao
                     Escreva("       ")
                  fimse

                  escreva(disponibilidades[i])
                  se codDisponibilidades[i] <= 3 entao
                     Escreva("               ")
                  fimse
                  se (codDisponibilidades[i] >= 4) e (codDisponibilidades[i] <= 6) entao
                     Escreva("         ")
                  fimse
                  se codDisponibilidades[i] = 7 entao
                     Escreva("   ")
                  fimse

                  Escreval(nomes[i])

               fimse

            fimpara

            Escreval("------------------------------------------------------------")
            Escreval("Total de medicos neste plantao: ", qtdPlantoes)

         fimse
         //==============================
         // OPcao 5 - Cobertura Semanal
         //==============================

      caso 5

         limpatela
         escreval("=== COBERTURA SEMANAL ===")
         escreval("")
         escreval("Dia             Turno   Clin     Ped     Cir     Situacao")
         escreval("---------------------------------------------------------------")
         qtdPlantoes <- 0

         para opDiaSemana de 1 ate 5 faca

            se opDiaSemana = 1 entao
               diaSemana <- "Segunda-feira"
            fimse
            se opDiaSemana = 2 entao
               diaSemana <- "Terca-feira"
            fimse
            se opDiaSemana = 3 entao
               diaSemana <- "Quarta-feira"
            fimse
            se opDiaSemana = 4 entao
               diaSemana <- "Quinta-feira"
            fimse
            se opDiaSemana = 5 entao
               diaSemana <- "Sexta-feira"
            fimse

            para turnoConsulta de 1 ate 3 faca

               coluna <- ((opDiaSemana - 1) * 3) + turnoConsulta
               cargaAtual <- 0
               qtdClinicos <- 0
               qtdPediatras <- 0
               qtdCirurgioes <- 0

               para i de 1 ate totalCadastrados faca
                  se escala[i,coluna] entao
                     cargaAtual <- cargaAtual + 1
                     se codEspecialidades[i] = 1 entao
                        qtdClinicos <- qtdClinicos + 1
                     fimse
                     se codEspecialidades[i] = 2 entao
                        qtdPediatras <- qtdPediatras + 1
                     fimse
                     se codEspecialidades[i] = 3 entao
                        qtdCirurgioes <- qtdCirurgioes + 1
                     fimse
                  fimse
               fimpara

               faltaClinicos <- 2 - qtdClinicos
               faltaPediatras <- 1 - qtdPediatras
               faltaCirurgioes <- 1 - qtdCirurgioes

               se faltaClinicos < 0 entao
                  faltaClinicos <- 0
               fimse
               se faltaPediatras < 0 entao
                  faltaPediatras <- 0
               fimse
               se faltaCirurgioes < 0 entao
                  faltaCirurgioes <- 0
               fimse

               // DIA - coluna com largura fixa de 16 caracteres
               escreva(diaSemana)
               se opDiaSemana = 1 entao
                  escreva("   ")
               fimse
               se opDiaSemana = 2 entao
                  escreva("     ")
               fimse
               se opDiaSemana = 3 entao
                  escreva("    ")
               fimse
               se opDiaSemana = 4 entao
                  escreva("    ")
               fimse
               se opDiaSemana = 5 entao
                  escreva("     ")
               fimse

               // TURNO - coluna com largura fixa de 8 caracteres
               se turnoConsulta = 1 entao
                  escreva("Manha   ")
               fimse
               se turnoConsulta = 2 entao
                  escreva("Tarde   ")
               fimse
               se turnoConsulta = 3 entao
                  escreva("Noite   ")
               fimse

               // ESPECIALIDADES - colunas com largura fixa
               escreva(qtdClinicos, "/2")
               escreva("     ")
               escreva(qtdPediatras, "/1")
               escreva("     ")
               escreva(qtdCirurgioes, "/1")
               escreva("     ")

               se (faltaClinicos = 0) e (faltaPediatras = 0) e (faltaCirurgioes = 0) entao
                  escreva("COMPLETO")
                  escreva("     ")
               senao
                  qtdPlantoes <- qtdPlantoes + 1
                  se cargaAtual = 0 entao
                     escreva("DESCOBERTO")
                     escreva("   ")
                  senao
                     escreva("INCOMPLETO")
                     escreva("   ")
                  fimse
               fimse

               escreval("")

            fimpara
         fimpara

         escreval("---------------------------------------------------------------")
         escreval("Plantoes incompletos ou descobertos: ", qtdPlantoes, " de 15")
         escreval("")
         escreva("Pressione ENTER para voltar ao menu...")
         leia(nomeTemp)
         limpatela


         // =====================================
         // OPCAO 6 - SAIR
         // =====================================

      caso 6
         escreval("Encerrando o programa...")

      outrocaso
         escreval("[ERRO] Opcao invalida!")
      fimescolha
   fimenquanto

fimalgoritmo