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
   x: inteiro
   descansoValido: logico

   qtdClinicos, qtdPediatras, qtdCirurgioes: inteiro
   vagasPreenchidas, vagasSemana: inteiro
   plantoesCompletos: inteiro
inicio

   totalCadastrados <- 0
   maxMedicos <- 24
   opcao <- 0

   para i de 1 ate 24 faca
      para x de 1 ate 15 faca
         escala[i,x] <- falso
      fimpara
   fimpara

   enquanto opcao <> 7 faca

      escreval("")
      escreval("=== SISTEMA DE ESCALA MEDICA ===")
      escreval("1. Cadastrar Medico")
      escreval("2. Consultar Medico por Identificador")
      escreval("3. Escalar Medico no Plantao")
      escreval("4. Consultar Medicos Escalados")
      escreval("5. Vizualizar Cobertura Semanal")
      escreval("6. Resumo da Escala Semanal")
      escreval("7. Sair")
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

               para i de 1 ate totalCadastrados faca

                  escreval("---------------------------")
                  escreval("ID: ", identificadores[i])
                  escreval("Nome: ", nomes[i])
                  escreval("Especialidade: ", especialidades[i])
                  escreval("Disponibilidade: ", disponibilidades[i])

                  cargaAtual <- 0

                  para x de 1 ate 15 faca
                     se escala[i,x] entao
                        cargaAtual <- cargaAtual + 1
                     fimse
                  fimpara

                  se cargaAtual > 0 entao
                     escreval("Situacao: Ja possui ", cargaAtual, " plantao(s)")
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

                  escreval("")
                  escreval("Escolha o dia da semana:")
                  escreval("1. Segunda-feira")
                  escreval("2. Ter�a-feira")
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
                     diaSemana <- "Ter�a-feira"
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

                           // calcula a primeira coluna do dia
                           coluna <- ((opDiaSemana - 1) * 3) + 1

                           // conta os plantoes do medico nesse dia
                           para x de coluna ate coluna + 2 faca

                              se escala[posicao,x] entao
                                 qtdPlantoesDia <- qtdPlantoesDia + 1
                              fimse

                           fimpara

                           se qtdPlantoesDia >= 2 entao

                              escreval("[ERRO] Medico ja possui 2 plantoes nesse dia.")

                           senao

                              descansoValido <- verdadeiro

                              // verifica se trabalhou na noite anterior
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

                                 escreval("[ERRO] Conflito com o turno da noite/manh� do dia seguinte.")

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
               escreval("Deseja continuar a escala��o?")
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
         escreval("2. Ter�a-feira")
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

         escreval("")
         escreval("=== RESULTADO DA CONSULTA ===")

         para i de 1 ate totalCadastrados faca

            se escala[i,coluna] entao

               escreval("---------------------------")
               escreval("ID: ", identificadores[i])
               escreval("Nome: ", nomes[i])
               escreval("Especialidade: ", especialidades[i])
               escreval("Disponibilidade: ", disponibilidades[i])
               escreval("---------------------------")

               encontrado <- verdadeiro

            fimse

         fimpara

         se nao encontrado entao
            escreval("Nenhum medico escalado para esse filtro.")
         fimse

         //==============================
         // OPcao 5 - Cobertura Semanal
         //==============================

            caso 5

         limpatela
         escreval("=== COBERTURA SEMANAL ===")
         qtdPlantoes <- 0
         vagasSemana <- 0
         plantoesCompletos <- 0


         para opDiaSemana de 1 ate 5 faca

            escreval("")

            se opDiaSemana = 1 entao
               escreval("Segunda-feira")
            fimse
            se opDiaSemana = 2 entao
               escreval("Terca-feira")
            fimse
            se opDiaSemana = 3 entao
               escreval("Quarta-feira")
            fimse
            se opDiaSemana = 4 entao
               escreval("Quinta-feira")
            fimse
            se opDiaSemana = 5 entao
               escreval("Sexta-feira")
            fimse

            para turnoConsulta de 1 ate 3 faca

               //Identifica o dia da semana e os turnos
               coluna <- ((opDiaSemana - 1) * 3) + turnoConsulta
               cargaAtual <- 0
               qtdClinicos <- 0
               qtdPediatras <- 0
               qtdCirurgioes <- 0
               vagasPreenchidas <- 0

               //Percorre todos os medicos cadastrados, um por um
               para i de 1 ate totalCadastrados faca
                  //Verifica se esse medico esta escalado no plantao atual
                  se escala[i,coluna] entao
                     //soma 1 ao total de medicos desse plantao
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

               // Conta no maximo 2 clinicos gerais
               se qtdClinicos >= 2 entao
                  vagasPreenchidas <- vagasPreenchidas + 2
               senao
                  vagasPreenchidas <- vagasPreenchidas + qtdClinicos
               fimse

               // Conta no maximo 1 pediatra
               se qtdPediatras >= 1 entao
                  vagasPreenchidas <- vagasPreenchidas + 1
               fimse

               // Conta no maximo 1 cirurgiao
               se qtdCirurgioes >= 1 entao
                  vagasPreenchidas <- vagasPreenchidas + 1
               fimse

               vagasSemana <- vagasSemana + vagasPreenchidas

               se turnoConsulta = 1 entao
                  escreva("  Manha: ")
               fimse
               se turnoConsulta = 2 entao
                  escreva("  Tarde: ")
               fimse
               se turnoConsulta = 3 entao
                  escreva("  Noite: ")
               fimse

               se cargaAtual = 0 entao
                  escreval("DESCOBERTO")
                  qtdPlantoes <- qtdPlantoes + 1
               senao
                  escreval(cargaAtual, " medico(s)")
               fimse

               escreval("    Cobertura: ", (vagasPreenchidas * 100) / 4, "%")

               se vagasPreenchidas = 4 entao
                  escreval("    Situacao: COMPLETO")
                  plantoesCompletos <- plantoesCompletos + 1
               senao
                  escreval("    Situacao: INCOMPLETO")
               fimse

            fimpara
         fimpara

         escreval("")
         escreval("Plantoes descobertos: ", qtdPlantoes, " de 15")
         escreval("Plantoes completos: ", plantoesCompletos, " de 15")
         escreval("Plantoes incompletos: ", 15 - plantoesCompletos, " de 15")
         escreval("Vagas preenchidas: ", vagasSemana, " de 60")
         escreval("Cobertura semanal: ", ((vagasSemana * 100) / 60):0:2, "%")

         escreval("")
         escreva("Pressione ENTER para voltar ao menu...")
         leia(nomeTemp)

          // =====================================
         // OPCAO 6 - RESUMO DOS 5 DIAS
         // =====================================

      caso 6

         limpatela
         escreval("=== RESUMO DOS 5 DIAS DA SEMANA ===")

         se totalCadastrados = 0 entao

            escreval("Nenhum medico cadastrado.")

         senao

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

               cargaManha <- 0
               cargaTarde <- 0
               cargaNoite <- 0

               escreval("")
               escreval("========================================")
               escreval("DIA: ", diaSemana)
               escreval("========================================")

               para turnoConsulta de 1 ate 3 faca

                  coluna <- ((opDiaSemana - 1) * 3) + turnoConsulta
                  cargaAtual <- 0
                  haEscaladoTurno <- falso

                  escreval("")
                  se turnoConsulta = 1 entao
                     escreval("  --- Turno: Manha ---")
                  fimse
                  se turnoConsulta = 2 entao
                     escreval("  --- Turno: Tarde ---")
                  fimse
                  se turnoConsulta = 3 entao
                     escreval("  --- Turno: Noite ---")
                  fimse

                  para i de 1 ate totalCadastrados faca
                     se escala[i,coluna] entao
                        cargaAtual <- cargaAtual + 1
                        haEscaladoTurno <- verdadeiro
                        escreval("    * [ID ", identificadores[i], "] ", nomes[i], " - ", especialidades[i])
                     fimse
                  fimpara

                  se nao haEscaladoTurno entao
                     escreval("    (Nenhum medico escalado - DESCOBERTO)")
                  fimse

                  escreval("    Total no turno: ", cargaAtual, " medico(s)")

                  se turnoConsulta = 1 entao
                     cargaManha <- cargaAtual
                  fimse
                  se turnoConsulta = 2 entao
                     cargaTarde <- cargaAtual
                  fimse
                  se turnoConsulta = 3 entao
                     cargaNoite <- cargaAtual
                  fimse

               fimpara

               maiorCargaDia <- cargaManha
               se cargaTarde > maiorCargaDia entao
                  maiorCargaDia <- cargaTarde
               fimse
               se cargaNoite > maiorCargaDia entao
                  maiorCargaDia <- cargaNoite
               fimse

               menorCargaDia <- cargaManha
               se cargaTarde < menorCargaDia entao
                  menorCargaDia <- cargaTarde
               fimse
               se cargaNoite < menorCargaDia entao
                  menorCargaDia <- cargaNoite
               fimse

               escreval("")
               escreval("  --------------------------------------")
               escreva("  Maior carga (", maiorCargaDia, " medico(s)): ")
               primeiraExibicao <- verdadeiro

               se cargaManha = maiorCargaDia entao
                  escreva("Manha")
                  primeiraExibicao <- falso
               fimse
               se cargaTarde = maiorCargaDia entao
                  se nao primeiraExibicao entao
                     escreva(", ")
                  fimse
                  escreva("Tarde")
                  primeiraExibicao <- falso
               fimse
               se cargaNoite = maiorCargaDia entao
                  se nao primeiraExibicao entao
                     escreva(", ")
                  fimse
                  escreva("Noite")
                  primeiraExibicao <- falso
               fimse
               escreval("")

               escreva("  Menor carga (", menorCargaDia, " medico(s)): ")
               primeiraExibicao <- verdadeiro

               se cargaManha = menorCargaDia entao
                  escreva("Manha")
                  primeiraExibicao <- falso
               fimse
               se cargaTarde = menorCargaDia entao
                  se nao primeiraExibicao entao
                     escreva(", ")
                  fimse
                  escreva("Tarde")
                  primeiraExibicao <- falso
               fimse
               se cargaNoite = menorCargaDia entao
                  se nao primeiraExibicao entao
                     escreva(", ")
                  fimse
                  escreva("Noite")
                  primeiraExibicao <- falso
               fimse
               escreval("")

            fimpara

         fimse

         escreval("")
         escreva("Pressione ENTER para voltar ao menu...")
         leia(nomeTemp)
         
         // =====================================
         // OPCAO 7 - SAIR
         // =====================================

      caso 7
         escreval("Encerrando o programa...")

      outrocaso
         escreval("[ERRO] Opcao invalida!")
      fimescolha
   fimenquanto

fimalgoritmo