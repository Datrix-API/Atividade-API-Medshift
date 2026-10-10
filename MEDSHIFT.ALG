Algoritmo "MEDSHIFT"

Var
// VARIAVEIS DA PRIMEIRA SPRINT
   turno: inteiro
   turno1, turno2, turno3: caractere
   i, x: inteiro
   z: caractere
   clinico1, pediatra1, cirurgiao1: inteiro
   clinico2, pediatra2, cirurgiao2: inteiro
   clinico3, pediatra3, cirurgiao3: inteiro
   manha_usada, tarde_usada, noite_usada: logico
   turno_valido, clinico_valido, pediatra_valido, cirurgiao_valido: logico
//------------------------------------------------------------------------
// VARIAVEIS DA SEGUNDA SPRINT
   qntd, op_cadastro, op: inteiro

   id_clinico1:  vetor [0..3]  de inteiro
   nome_clinico1:  vetor [0..3]  de caractere

   id_pediatra1: vetor [0..2] de inteiro
   nome_pediatra1:  vetor [0..2]  de caractere
   
   id_cirurgiao1: vetor [0..2] de inteiro
   nome_cirurgiao1:  vetor [0..2]  de caractere



Inicio
   escreval ("======================")
   escreval ("Hospital Santa Helena")
   escreval ("=======MEDSHIFT=======")
   escreval ("")
   
   repita
      escreval("Selecione a operacao desejada: ")
      escreval("")
      escreval("1 - Cadastros dos médicos")
      escreval("2 - Turnos e Plantões")
      escreval("3 - Sair")
      escreval("")
      leia(op)
         se (op < 1) ou (op > 3) entao
            escreval("Escolha uma opcao de 1 a 3")
            escreval("")
         fimse

   ate (op >= 1) e (op <= 3)

se op = 1 entao
     //cadastro dos medicos
   repita
     escreval ("Selecione o turno que deseja cadastrar o funcionario: ")
     escreval ("1 - MANHÃ")
     escreval ("2 - TARDE")
     escreval ("3 - NOITE")
     escreval ("")
     leia (op_cadastro)

     se (op_cadastro < 1) ou (op_cadastro > 3) entao
            escreval("Escolha uma opcao de 1 a 3")
            escreval("")
         fimse
     
   ate (op_cadastro >= 1) e (op_cadastro <= 3)

//----------------------------------------------------------------------
   
   se op_cadastro = 1 entao
      repita
            escreval ("Escolha a especialidade do médico: ")
            escreval ("1 - Clinico")
            escreval ("2 - Pediatra")
            escreval ("3 - Cirurgiao")

            leia (op_cadastro)
            se (op_cadastro < 1) ou (op_cadastro > 3) entao
                    escreval("Insira um numero entre 1 e 3")
            fimse
            
      ate (op_cadastro >= 1) e (op_cadastro <= 3)
      
      se op_cadastro = 1 entao
         escreval ("Insira a quantidade de clinicos que deseja cadastrar ")
         repita

               leia(qntd)
         
               se (qntd < 2) ou (qntd > 4) entao
                    escreval("Insira um numero entre 2 e 4")
               fimse
         
         ate (qntd >= 2 ) e (qntd <= 4)
         

         para i de 1 ate qntd faca
              escreval("Insira o nome completo do clinico: ")
              leia(nome_clinico1[i])

              escreval("Insira o CRM de ", nome_clinico1[i], ": ")
              leia(id_clinico1[i])

         fimpara
           
         escreval("Especialidade: Clinico Geral")

         para i de 1 ate qntd faca
              escreval(i, " - Nome: ", nome_clinico1[i], " - CRM:", id_clinico1[i])
         fimpara


      fimse
//-------------------------------------------------------------------
      se op_cadastro = 2 entao
         escreval ("Insira a quantidade de pediatras que deseja cadastrar ")
         repita

               leia(qntd)

               se (qntd < 1) ou (qntd > 2) entao
                    escreval("Insira um numero entre 1 e 2")
               fimse

         ate (qntd >= 1 ) e (qntd <= 2)

         para i de 1 ate qntd faca
              escreval("Insira o nome completo do pediatra: ")
              leia(nome_pediatra1[i])

              escreval("Insira o CRM de ", nome_pediatra1[i], ": ")
              leia(id_pediatra1[i])

         fimpara

         escreval("Especialidade: Pediatra")

         para i de 1 ate qntd faca
              escreval(i, " - Nome: ", nome_pediatra1[i], " - CRM:", id_pediatra1[i])
         fimpara
      fimse
//-------------------------------------------------------------------
      se op_cadastro = 3 entao
         escreval ("Insira a quantidade de cirurgioes que deseja cadastrar ")
         repita

               leia(qntd)

               se (qntd < 1) ou (qntd > 2) entao
                    escreval("Insira um numero entre 1 e 2")
               fimse

         ate (qntd >= 1 ) e (qntd <= 2)
       fimse

         para i de 1 ate qntd faca
              escreval("Insira o nome completo do cirurgiao: ")
              leia(nome_cirurgiao1[i])

              escreval("Insira o CRM de ", nome_cirurgiao1[i], ": ")
              leia(id_cirurgiao1[i])

         fimpara

         escreval("Especialidade: cirurgiao")

         para i de 1 ate qntd faca
              escreval(i, " - Nome: ", nome_cirurgiao1[i], " - CRM:", id_cirurgiao1[i])
         fimpara


   fimse

     
     
     
     
fimse
//----------------------------------------------------------------------

se op = 2 entao
      manha_usada <- falso
      tarde_usada <- falso
      noite_usada <- falso

      turno1 <- "MANHÃ"
      turno2 <- "TARDE"
      turno3 <- "NOITE"

      // Escolha dos 3 turnos
      para i <- 1 ate 3 faca

         turno_valido <- falso
         clinico_valido <- falso
         pediatra_valido <- falso
         cirurgiao_valido <- falso

         // Validação da seleção do turno
         para x <- 1 ate 100 faca
            se turno_valido = falso entao


               escreval ("Informe o turno do plantão:")
               escreval ("1 - MANHÃ")
               escreval ("2 - TARDE")
               escreval ("3 - NOITE")
               escreval ("")
               escreva ("Opção: ")
               leia(turno)

               // Manhã
               se turno = 1 entao
                  se manha_usada = falso entao
                     manha_usada <- verdadeiro
                     turno_valido <- verdadeiro
                     escreval ("")
                     escreval ("===========================")
                     escreval ("Turno da MANHÃ selecionado.")
                     escreval ("===========================")
                     escreval ("")
                  senao
                     escreval ("")
                     escreval ("====================================")
                     escreval ("O turno da MANHÃ já foi selecionado.")
                     escreval ("Informe outro turno.")
                     escreval ("====================================")
                     escreval ("")
                     escreval ("Digite ENTER para continuar.")
                     leia(z)
                     limpatela
                  fimse
               senao
                  // Tarde
                  se turno = 2 entao
                     se tarde_usada = falso entao
                        tarde_usada <- verdadeiro
                        turno_valido <- verdadeiro
                        escreval ("")
                        escreval ("===========================")
                        escreval ("Turno da TARDE selecionado.")
                        escreval ("===========================")
                        escreval ("")
                     senao
                        escreval ("")
                        escreval ("====================================")
                        escreval ("O turno da TARDE já foi selecionado.")
                        escreval ("Informe outro turno.")
                        escreval ("====================================")
                        escreval ("")
                        escreval ("Digite ENTER para continuar.")
                        leia(z)
                        limpatela
                     fimse
                  senao
                     // Noite
                     se turno = 3 entao
                        se noite_usada = falso entao
                           noite_usada <- verdadeiro
                           turno_valido <- verdadeiro
                           escreval ("")
                           escreval ("===========================")
                           escreval ("Turno da NOITE selecionado.")
                           escreval ("===========================")
                           escreval ("")
                        senao
                           escreval ("")
                           escreval ("====================================")
                           escreval ("O turno da NOITE já foi selecionado.")
                           escreval ("Informe outro turno.")
                           escreval ("====================================")
                           escreval ("")
                           escreval ("Digite ENTER para continuar.")
                           leia(z)
                           limpatela
                        fimse
                     senao
                        // Opção inválida
                        escreval ("")
                        escreval ("=========================================")
                        escreval ("Opção de turno inválida.")
                        escreval ("Digite 1, 2 ou 3.")
                        escreval ("=========================================")
                        escreval ("")
                        escreval ("Digite ENTER para continuar.")
                        leia(z)
                        limpatela
                     fimse
                  fimse
               fimse
            fimse
         fimpara

         // Cadastro: Turno da Manhã
         se turno = 1 entao
            // Clínicos Gerais
            clinico_valido <- falso
            para x <- 1 ate 100 faca
               se clinico_valido = falso entao
                  escreval ("Informe a quantidade de CLÍNICOS GERAIS:")
                  leia(clinico1)
                  se (clinico1 >= 2) e (clinico1 <= 4) entao
                     clinico_valido <- verdadeiro
                     escreval ("")
                     escreval ("======================================")
                     escreval ("CLÍNICOS GERAIS do turno da MANHÃ: ", clinico1)
                     escreval ("======================================")
                     escreval ("")
                  senao
                     escreval ("")
                     escreval ("=======================================")
                     escreval ("Quantidade de CLÍNICOS GERAIS inválida.")
                     escreval ("Digite um número de 2 a 4.")
                     escreval ("=======================================")
                     escreval ("")
                  fimse
               fimse
            fimpara

            // Pediatras
            pediatra_valido <- falso
            para x <- 1 ate 100 faca
               se pediatra_valido = falso entao
                  escreval ("Informe a quantidade de PEDIATRAS:")
                  leia(pediatra1)
                  se (pediatra1 >= 1) e (pediatra1 <= 2) entao
                     pediatra_valido <- verdadeiro
                     escreval ("")
                     escreval ("=================================")
                     escreval ("PEDIATRAS do turno da MANHÃ: ", pediatra1)
                     escreval ("=================================")
                     escreval ("")
                  senao
                     escreval ("")
                     escreval ("=================================")
                     escreval ("Quantidade de PEDIATRAS inválida.")
                     escreval ("Digite um número de 1 a 2.")
                     escreval ("=================================")
                     escreval ("")
                  fimse
               fimse
            fimpara

            // Cirurgiões
            cirurgiao_valido <- falso
            para x <- 1 ate 100 faca
               se cirurgiao_valido = falso entao
                  escreval ("Informe a quantidade de CIRURGIÕES:")
                  leia(cirurgiao1)
                  se (cirurgiao1 >= 1) e (cirurgiao1 <= 2) entao
                     cirurgiao_valido <- verdadeiro
                     escreval ("")
                     escreval ("==================================")
                     escreval ("CIRURGIÕES do turno da MANHÃ: ", cirurgiao1)
                     escreval ("==================================")
                     escreval ("")
                  senao
                     escreval ("")
                     escreval ("==================================")
                     escreval ("Quantidade de CIRURGIÕES inválida.")
                     escreval ("Digite um número de 1 a 2.")
                     escreval ("==================================")
                     escreval ("")
                  fimse
               fimse
            fimpara

            escreval ("")
            escreval ("Digite ENTER para continuar.")
            leia(z)
            limpatela
         fimse

         // Cadastro: Turno da Tarde
         se turno = 2 entao
            // Clínicos Gerais
            clinico_valido <- falso
            para x <- 1 ate 100 faca
               se clinico_valido = falso entao
                  escreval ("Informe a quantidade de CLÍNICOS GERAIS:")
                  leia(clinico2)
                  se (clinico2 >= 2) e (clinico2 <= 4) entao
                     clinico_valido <- verdadeiro
                     escreval ("")
                     escreval ("======================================")
                     escreval ("CLÍNICOS GERAIS do turno da TARDE: ", clinico2)
                     escreval ("======================================")
                     escreval ("")
                  senao
                     escreval ("")
                     escreval ("=======================================")
                     escreval ("Quantidade de CLÍNICOS GERAIS inválida.")
                     escreval ("Digite um número de 2 a 4.")
                     escreval ("=======================================")
                     escreval ("")
                  fimse
               fimse
            fimpara

            // Pediatras
            pediatra_valido <- falso
            para x <- 1 ate 100 faca
               se pediatra_valido = falso entao
                  escreval ("Informe a quantidade de PEDIATRAS:")
                  leia(pediatra2)
                  se (pediatra2 >= 1) e (pediatra2 <= 2) entao
                     pediatra_valido <- verdadeiro
                     escreval ("")
                     escreval ("=================================")
                     escreval ("PEDIATRAS do turno da TARDE: ", pediatra2)
                     escreval ("=================================")
                     escreval ("")
                  senao
                     escreval ("")
                     escreval ("=================================")
                     escreval ("Quantidade de PEDIATRAS inválida.")
                     escreval ("Digite um número de 1 a 2.")
                     escreval ("=================================")
                     escreval ("")
                  fimse
               fimse
            fimpara

            // Cirurgiões
            cirurgiao_valido <- falso
            para x <- 1 ate 100 faca
               se cirurgiao_valido = falso entao
                  escreval ("Informe a quantidade de CIRURGIÕES:")
                  leia(cirurgiao2)
                  se (cirurgiao2 >= 1) e (cirurgiao2 <= 2) entao
                     cirurgiao_valido <- verdadeiro
                     escreval ("")
                     escreval ("==================================")
                     escreval ("CIRURGIÕES do turno da TARDE: ", cirurgiao2)
                     escreval ("==================================")
                     escreval ("")
                  senao
                     escreval ("")
                     escreval ("==================================")
                     escreval ("Quantidade de CIRURGIÕES inválida.")
                     escreval ("Digite um número de 1 a 2.")
                     escreval ("==================================")
                     escreval ("")
                  fimse
               fimse
            fimpara

            escreval ("")
            escreval ("Digite ENTER para continuar.")
            leia(z)
            limpatela
         fimse

         // Cadastro: Turno da Noite
         se turno = 3 entao
            // Clínicos Gerais
            clinico_valido <- falso
            para x <- 1 ate 100 faca
               se clinico_valido = falso entao
                  escreval ("Informe a quantidade de CLÍNICOS GERAIS:")
                  leia(clinico3)
                  se (clinico3 >= 2) e (clinico3 <= 4) entao
                     clinico_valido <- verdadeiro
                     escreval ("")
                     escreval ("======================================")
                     escreval ("CLÍNICOS GERAIS do turno da NOITE: ", clinico3)
                     escreval ("======================================")
                     escreval ("")
                  senao
                     escreval ("")
                     escreval ("=======================================")
                     escreval ("Quantidade de CLÍNICOS GERAIS inválida.")
                     escreval ("Digite um número de 2 a 4.")
                     escreval ("=======================================")
                     escreval ("")
                  fimse
               fimse
            fimpara

            // Pediatras
            pediatra_valido <- falso
            para x <- 1 ate 100 faca
               se pediatra_valido = falso entao
                  escreval ("Informe a quantidade de PEDIATRAS:")
                  leia(pediatra3)
                  se (pediatra3 >= 1) e (pediatra3 <= 2) entao
                     pediatra_valido <- verdadeiro
                     escreval ("")
                     escreval ("=================================")
                     escreval ("PEDIATRAS do turno da NOITE: ", pediatra3)
                     escreval ("=================================")
                     escreval ("")
                  senao
                     escreval ("")
                     escreval ("=================================")
                     escreval ("Quantidade de PEDIATRAS inválida.")
                     escreval ("Digite um número de 1 a 2.")
                     escreval ("=================================")
                     escreval ("")
                  fimse
               fimse
            fimpara

            // Cirurgiões
            cirurgiao_valido <- falso
            para x <- 1 ate 100 faca
               se cirurgiao_valido = falso entao
                  escreval ("Informe a quantidade de CIRURGIÕES:")
                  leia(cirurgiao3)
                  se (cirurgiao3 >= 1) e (cirurgiao3 <= 2) entao
                     cirurgiao_valido <- verdadeiro
                     escreval ("")
                     escreval ("==================================")
                     escreval ("CIRURGIÕES do turno da NOITE: ", cirurgiao3)
                     escreval ("==================================")
                     escreval ("")
                  senao
                     escreval ("")
                     escreval ("==================================")
                     escreval ("Quantidade de CIRURGIÕES inválida.")
                     escreval ("Digite um número de 1 a 2.")
                     escreval ("==================================")
                     escreval ("")
                  fimse
               fimse
            fimpara

            escreval ("")
            escreval ("Digite ENTER para continuar.")
            leia(z)
            limpatela
         fimse
      fimpara

      // Quadro Geral
      escreval ("======================")
      escreval ("Hospital Santa Helena")
      escreval ("=======MEDSHIFT=======")
      escreval ("")

      // Turno da Manhã
      escreval ("=======================================")
      escreval ("Quantidade de médicos do turno da ", turno1)
      escreval ("")
      escreval ("-------------------")
      escreval ("CLÍNICOS GERAIS: ", clinico1)
      escreval ("PEDIATRAS: ", pediatra1)
      escreval ("CIRURGIÕES: ", cirurgiao1)
      escreval ("-------------------")
      escreval ("")
      escreval ("TURNO COBERTO!!!")
      escreval ("=======================================")
      escreval ("")

      // Turno da Tarde
      escreval ("=======================================")
      escreval ("Quantidade de médicos do turno da ", turno2)
      escreval ("")
      escreval ("-------------------")
      escreval ("CLÍNICOS GERAIS: ", clinico2)
      escreval ("PEDIATRAS: ", pediatra2)
      escreval ("CIRURGIÕES: ", cirurgiao2)
      escreval ("-------------------")
      escreval ("")
      escreval ("TURNO COBERTO!!!")
      escreval ("=======================================")
      escreval ("")

      // Turno da Noite
      escreval ("=======================================")
      escreval ("Quantidade de médicos do turno da ", turno3)
      escreval ("")
      escreval ("-------------------")
      escreval ("CLÍNICOS GERAIS: ", clinico3)
      escreval ("PEDIATRAS: ", pediatra3)
      escreval ("CIRURGIÕES: ", cirurgiao3)
      escreval ("-------------------")
      escreval ("")
      escreval ("TURNO COBERTO!!!")
      escreval ("=======================================")
fimse
Fimalgoritmo
