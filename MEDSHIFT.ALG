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
   somaPlantoes: inteiro
   mediaSemanal: real

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

   vagasPreenchidas, vagasSemana: inteiro
   plantoesCompletos, plantoesIncompletos: inteiro
   plantoesDescobertos: inteiro

   porcCompletos, porcIncompletos: real
   porcDescobertos, coberturaSemanal: real

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
      escreval("============ MEDSHIFT ============")
      escreval("=== SISTEMA DE ESCALAS MÉDICAS ===")
      escreval("")
      escreval("1. Cadastrar Médico")
      escreval("2. Consultar Médico por Identificador")
      escreval("3. Escalar Médico no Plantão")
      escreval("4. Consultar Médicos Escalados")
      escreval("5. Vizualizar Cobertura Semanal")
      escreval("6. Calcular Média Semanal de Plantões")
      escreval("7. Sair")
      escreva("Escolha uma opção: ")
      leia(opcao)
      escolha(opcao)

         // =====================================
         // OPCAO 1 - CADASTRAR MEDICO
         // =====================================

      caso 1

         opContCadastro <- 1

         enquanto opContCadastro = 1 faca

            limpatela
            escreval("=== CADASTRO DE MÉDICO ===")

            se totalCadastrados >= maxMedicos entao

               escreval("[ERRO] Limite de 24 médicos atingido!")

            senao

               escreva("Digite o identificador do médico: ")
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

                     escreval("[ERRO] Identificador já cadastrado!")

                  senao

                     escreva("Digite o nome do médico: ")
                     leia(nomeTemp)

                     escreval("")
                     escreval("Escolha a especialidade:")
                     escreval("1. Clínico Geral")
                     escreval("2. Pediatra")
                     escreval("3. Cirurgião")

                     opEsp <- 0

                     enquanto (opEsp < 1) ou (opEsp > 3) faca
                        escreva("Opção: ")
                        leia(opEsp)

                        se (opEsp < 1) ou (opEsp > 3) entao
                           escreval("[ERRO] Escolha 1, 2 ou 3.")
                        fimse
                     fimenquanto

                     escreval("")
                     escreval("Escolha a disponibilidade:")
                     escreval("1. Manhã")
                     escreval("2. Tarde")
                     escreval("3. Noite")
                     escreval("4. Manhã/Tarde")
                     escreval("5. Manhã/Noite")
                     escreval("6. Tarde/Noite")
                     escreval("7. Manhã/Tarde/Noite")

                     opTurno <- 0

                     enquanto (opTurno < 1) ou (opTurno > 7) faca
                        escreva("Opção: ")
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
                        especialidades[totalCadastrados] <- "Clínico Geral"
                     fimse

                     se opEsp = 2 entao
                        especialidades[totalCadastrados] <- "Pediatra"
                     fimse

                     se opEsp = 3 entao
                        especialidades[totalCadastrados] <- "Cirurgião"
                     fimse

                     se opTurno = 1 entao
                        disponibilidades[totalCadastrados] <- "Manhã"
                     fimse

                     se opTurno = 2 entao
                        disponibilidades[totalCadastrados] <- "Tarde"
                     fimse

                     se opTurno = 3 entao
                        disponibilidades[totalCadastrados] <- "Noite"
                     fimse

                     se opTurno = 4 entao
                        disponibilidades[totalCadastrados] <- "Manhã/Tarde"
                     fimse

                     se opTurno = 5 entao
                        disponibilidades[totalCadastrados] <- "Manhã/Noite"
                     fimse

                     se opTurno = 6 entao
                        disponibilidades[totalCadastrados] <- "Tarde/Noite"
                     fimse

                     se opTurno = 7 entao
                        disponibilidades[totalCadastrados] <- "Manhã/Tarde/Noite"
                     fimse

                     escreval("")
                     escreval("[SUCESSO] Médico cadastrado!")

                  fimse
               fimse
            fimse

            escreval("")
            escreval("Deseja cadastrar mais médicos?")
            escreval("1. Sim")
            escreval("2. Não")
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
         escreval("=== CONSULTA DE MÉDICO ===")

         se totalCadastrados = 0 entao

            escreval("Nenhum médico cadastrado.")

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
                  escreval("Situação: Escalado")
               senao
                  escreval("Situação: Não escalado")
               fimse

               // exibe a quantidade de plantoes atribuidos
               escreval("Plantões atribuídos: ", qtdPlantoes)

               escreval("---------------------------")

            senao

               escreval("[ERRO] Médico não encontrado.")

            fimse
         fimse

         // =====================================
         // OPCAO 3 - ESCALAR MEDICO
         // =====================================

      caso 3

         limpatela
         escreval("=== ESCALAÇÃO DE MÉDICOS ===")

         se totalCadastrados = 0 entao

            escreval("Nenhum médico cadastrado.")

         senao

            opContEscalacao <- 1

            enquanto opContEscalacao = 1 faca

               escreval("")
               escreval("=== MÉDICOS CADASTRADOS ===")
               escreval("ID   Especialidade   Disponibilidade     Plantões  Nome")
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
               escreva("Digite o ID do médico: ")
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
                  escreval("1. Manhã")
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
                     escreval("1. Clínico Geral")
                     escreval("2. Pediatra")
                     escreval("3. Cirurgião")

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

                           escreval("[ERRO] Médico já escalado nesse plantão.")
                        senao
                           qtdPlantoesDia <- 0
                           coluna <- ((opDiaSemana - 1) * 3) + 1
                           para x de coluna ate coluna + 2 faca

                              se escala[posicao,x] entao
                                 qtdPlantoesDia <- qtdPlantoesDia + 1
                              fimse
                           fimpara
                           se qtdPlantoesDia >= 2 entao
                              escreval("[ERRO] Médico já possui 2 plantões nesse dia.")
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
                                    escreval("[ERRO] Médico já atingiu o limite de 5 plantões semanais.")
                                 senao
                                    // registra o novo plantao
                                    coluna <- ((opDiaSemana - 1) * 3) + opTurno
                                    escala[posicao,coluna] <- verdadeiro
                                    escreval("")
                                    escreval("[SUCESSO] Medico escalado!")
                                    escreval("Nome: ", nomes[posicao])
                                    escreval("Especialidade: ", especialidades[posicao])
                                    escreval("Plantões no dia: ", qtdPlantoesDia + 1)
                                    escreval("Plantões na semana: ", cargaAtual + 1)
                                 fimse
                              fimse
                           fimse
                        fimse
                     senao
                        escreval("[ERRO] Médico não atua nessa especialidade.")
                     fimse
                  senao
                     escreval("[ERRO] Médico sem disponibilidade para esse turno.")
                  fimse
               senao
                  escreval("[ERRO] Identificador não encontrado.")
               fimse
               escreval("")
               escreval("Deseja continuar a escalação?")
               escreval("1. Sim")
               escreval("2. Não")
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

            escreva("Opção: ")
            leia(opDiaSemana)

            se (opDiaSemana < 1) ou (opDiaSemana > 5) entao
               escreval("[ERRO] Escolha de 1 a 5.")
            fimse

         fimenquanto

         escreval("=== CONSULTAR MÉDICOS ESCALADOS ===")
         escreval("")
         escreval("Escolha o turno:")
         escreval("1. Manhã")
         escreval("2. Tarde")
         escreval("3. Noite")

         turnoConsulta <- 0

         enquanto (turnoConsulta < 1) ou (turnoConsulta > 3) faca

            escreva("Opção: ")
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

            Escreval("Nenhum médico escalado para esse filtro.")

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
            Escreval("Total de médicos neste plantão: ", qtdPlantoes)

         fimse



         //==============================
         // OPCAO 5 - COBERTURA SEMANAL
         //==============================

      caso 5

         limpatela
         escreval("=== COBERTURA SEMANAL ===")
         escreval("")
         escreval("Dia             Turno   Clin     Ped     Cir     Situação")
         escreval("---------------------------------------------------------------")

         qtdPlantoes <- 0
         plantoesCompletos <- 0
         plantoesIncompletos <- 0
         plantoesDescobertos <- 0
         vagasSemana <- 0

         para opDiaSemana de 1 ate 5 faca

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

               vagasPreenchidas <- 4 - faltaClinicos - faltaPediatras - faltaCirurgioes

               vagasSemana <- vagasSemana + vagasPreenchidas

               // DIA
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

               // TURNO
               se turnoConsulta = 1 entao
                  escreva("Manhã   ")
               fimse
               se turnoConsulta = 2 entao
                  escreva("Tarde   ")
               fimse
               se turnoConsulta = 3 entao
                  escreva("Noite   ")
               fimse

               // ESPECIALIDADES
               escreva(qtdClinicos, "/2")
               escreva("     ")
               escreva(qtdPediatras, "/1")
               escreva("     ")
               escreva(qtdCirurgioes, "/1")
               escreva("     ")

               // SITUACAO DO PLANTAO
               se vagasPreenchidas = 4 entao

                  escreval("COMPLETO")
                  plantoesCompletos <- plantoesCompletos + 1

               senao

                  se cargaAtual = 0 entao

                     escreval("DESCOBERTO")
                     plantoesDescobertos <- plantoesDescobertos + 1

                  senao

                     escreval("INCOMPLETO")
                     plantoesIncompletos <- plantoesIncompletos + 1

                  fimse

               fimse

            fimpara

         fimpara

         // CALCULO DAS PORCENTAGENS

         porcCompletos <- (plantoesCompletos * 100) / 15
         porcIncompletos <- (plantoesIncompletos * 100) / 15
         porcDescobertos <- (plantoesDescobertos * 100) / 15

         coberturaSemanal <- (vagasSemana * 100) / 60

         // RESULTADO FINAL

         escreval("")
         escreval("==============================================")
         escreval("          RESUMO DA COBERTURA SEMANAL")
         escreval("==============================================")

         escreval("Plantões descobertos: ", plantoesDescobertos, " de 15 ")

         escreval("Plantões completos: ", plantoesCompletos, " de 15 ")

         escreval("Plantões incompletos: ", plantoesIncompletos, " de 15 ")

         escreval("Vagas preenchidas: ", vagasSemana, " de 60")

         escreval("Cobertura semanal: ", coberturaSemanal:0:2, "%")

         escreval("")
         escreva("Pressione ENTER para voltar ao menu...")
         leia(nomeTemp)
         limpatela

         // =====================================
         // OPCAO 6 - MEDIA SEMANAL DE PLANTOES
         // =====================================

      caso 6

         limpatela
         escreval("=== MÉDIA SEMANAL DE PLANTÕES ===")
         escreval("")

         se totalCadastrados = 0 entao

            escreval("Nenhum médico cadastrado. Cadastre médicos para calcular a média.")

         senao

            somaPlantoes <- 0

            escreval("PLANTÕES ATRIBUÍDOS POR MÉDICO")
            escreval("-----------------------------------------------")
            escreval("ID              Nome              Plantões")
            escreval("-----------------------------------------------")

            // Conta os plantoes de cada medico nos 15 turnos da semana.
            // Medicos sem plantoes tambem entram no calculo da media.
            para i de 1 ate totalCadastrados faca

               cargaAtual <- 0

               para x de 1 ate 15 faca
                  se escala[i,x] entao
                     cargaAtual <- cargaAtual + 1
                  fimse
               fimpara

               somaPlantoes <- somaPlantoes + cargaAtual
               escreval(identificadores[i], "               ", nomes[i], "                  ", cargaAtual)

            fimpara

            mediaSemanal <- somaPlantoes / totalCadastrados

            escreval("-----------------------------------------------")
            escreval("Total de médicos cadastrados: ", totalCadastrados)
            escreval("Total de plantões atribuídos: ", somaPlantoes)
            escreval("Média semanal de plantões por médico: ", mediaSemanal)
            escreval("")
            escreval("A média considera todos os médicos cadastrados, inclusive os que possuem zero plantões.")

         fimse

         escreval("")
         escreva("Pressione ENTER para voltar ao menu...")
         leia(nomeTemp)
         limpatela

         // =====================================
         // OPCAO 7 - SAIR
         // =====================================

      caso 7
         escreval("Encerrando o programa...")

      outrocaso
         escreval("[ERRO] Opção inválida!")
      fimescolha
   fimenquanto

fimalgoritmo