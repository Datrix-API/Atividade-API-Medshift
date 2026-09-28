Algoritmo "MEDSHIFT"

Var
   turno: inteiro
   turno1, turno2, turno3: caractere
   i, x: inteiro
   z: caractere
   clinico1, pediatra1, cirurgiao1: inteiro
   clinico2, pediatra2, cirurgiao2: inteiro
   clinico3, pediatra3, cirurgiao3: inteiro
   manha_usada, tarde_usada, noite_usada: logico
   turno_valido, clinico_valido, pediatra_valido, cirurgiao_valido: logico

Inicio
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
            escreval ("======================")
            escreval ("Hospital Santa Helena")
            escreval ("=======MEDSHIFT=======")
            escreval ("")
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

Fimalgoritmo