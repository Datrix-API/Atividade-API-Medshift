Algoritmo "MEDSHIFT"

Var
   //declaração das variáveis do código
   turno, turno1, turno2, turno3: caractere

   i, x, z: inteiro

   clinico1, pediatra1, cirurgiao1: inteiro
   clinico2, pediatra2, cirurgiao2: inteiro
   clinico3, pediatra3, cirurgiao3: inteiro

   manha_usada, tarde_usada, noite_usada: logico
   turno_valido, clinico_valido, pediatra_valido, cirurgiao_valido: logico
Inicio
   //seção para escolha de turnos
   para i <- 1 ate 3 faca
      turno_valido <- falso
      clinico_valido <- falso
      pediatra_valido <- falso
      cirurgiao_valido <- falso
      para x <- 1 ate 100 faca
         se turno_valido = falso entao
            escreval ("======================")
            escreval ("Hospital Santa Helena")
            escreval ("=======MEDSHIFT=======")
            escreval ("")
            Escreval ("Informe o turno do plantão:")
            Escreval ("1 - MANHÃ")
            Escreval ("2 - TARDE")
            Escreval ("3 - NOITE")
            leia(turno) // leia adicionado aqui para que o usuario tenha
            //"o poder de escolha"
            //TURNO DA MANHÃ
            se turno = 1 entao
               se manha_usada = falso entao
                  turno1 <- "MANHÃ"
                  manha_usada <- verdadeiro
                  turno_valido <- verdadeiro
                  escreval ("===========================")
                  escreval ("Turno da MANHÃ selecionado.")
                  escreval ("===========================")
                  escreval ("")
               senao
                  escreval ("")
                  escreval ("====================================")
                  escreval ("O turno da MANHÃ já foi selecionado.")
                  escrevaL ("Informe outro turno.")
                  escreval ("====================================")
                  escreval ("")
                  escreval ("PRESSIONE ENTER PARA CONTINUAR.")
                  leia (z)
                  limpatela
               fimse
            senao
               //TURNO DA TARDE
               se turno = 2 entao
                  se tarde_usada = falso entao
                     turno2 <- "TARDE"
                     tarde_usada <- verdadeiro
                     turno_valido <- verdadeiro
                     escreval ("===========================")
                     escreval ("Turno da TARDE selecionado.")
                     escreval ("===========================")
                     escreval ("")
                  senao
                     escreval ("")
                     escreval ("====================================")
                     escreval ("o turno da TARDE já foi selecionado.")
                     escrevaL ("Informe outro turno.")
                     escreval ("====================================")
                     escreval ("")
                     escreval ("PRESSIONE ENTER PARA CONTINUAR.")
                     leia (z)
                     limpatela
                  fimse
               senao
                  //TURNO DA NOITE
                  se turno = 3 entao
                     se noite_usada = falso entao
                        turno3 <- "NOITE"
                        noite_usada <- verdadeiro
                        turno_valido <- verdadeiro
                        escreval ("===========================")
                        escreval ("Turno da NOITE selecionado.")
                        escreval ("===========================")
                        escreval ("")
                     senao
                        escreval ("")
                        escreval ("====================================")
                        escreval ("o turno da NOITE já foi selecionado.")
                        escrevaL ("Informe outro turno.")
                        escreval ("====================================")
                        escreval ("")
                        escreval ("PRESSIONE ENTER PARA CONTINUAR.")
                        leia (z)
                        limpatela
                     fimse
                  senao
                     escreval ("=========================================")
                     escreval ("Opção de turno inválida. Digite 1,2 ou 3.")
                     escreval ("=========================================")
                     escreval ("")
                     escreval ("PRESSIONE ENTER PARA CONTINUAR.")
                     leia (z)
                     limpatela
                  fimse
               fimse
            fimse
         fimse
      fimpara
      //definição de quantidades do primeiro turno
      //clínicos gerais do primeiro turno
      clinico_valido <-falso
      se turno = 1 entao
         para x <- 1 ate 100 faca
            se clinico_valido = falso entao
               escreval ("Informe a quantidade de CLÍNICOS GERAIS:")
               leia (clinico1)
               se (clinico1 <= 4) e (clinico1 >= 2) entao
                  clinico_valido <- verdadeiro
                  escreval ("")
                  escreval ("======================================")
                  escreval ("CLÍNICOS GERAIS do primeiro turno: ",clinico1)
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
         //pediatras do primeiro turno
         pediatra_valido <- falso
         para x <- 1 ate 100 faca
            se pediatra_valido = falso entao

               escreval ("Informe a quantidade de PEDIATRAS:")
               leia(pediatra1)
               se (pediatra1 <= 2) e (pediatra1 >= 1) entao
                  pediatra_valido <- verdadeiro
                  escreval ("")
                  escreval ("===============================")
                  escreval ("PEDIATRAS do primeiro turno: ", pediatra1)
                  escreval ("===============================")
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
         //cirurgiões do primeiro turno
         cirurgiao_valido <- falso
         para x <- 1 ate 100 faca
            se cirurgiao_valido =  falso entao

               escreval ("Informe a quantidade de CIRURGIÕES:")
               leia(cirurgiao1)
               se (cirurgiao1 <= 2) e (cirurgiao1 >= 1) entao
                  cirurgiao_valido <- verdadeiro
                  escreval ("")
                  escreval ("================================")
                  escreval ("CIRURGIÕES do primeiro turno: ", cirurgiao1)
                  escreval ("================================")
               senao
                  escreval ("")
                  escreval ("=================================")
                  escreval ("Quantidade de cirurgiao inválida.")
                  escreval ("Digite um número de 1 a 2.")
                  escreval ("=================================")
               fimse
            fimse
         fimpara
         escreval ("")
         escreval ("")
         escreval ("PRESSIONE ENTER PARA CONTINUAR.")
         leia (z)
         limpatela
      fimse
      //definição de quantidades do segundo turno
      //clínicos gerais do segundo turno
      se turno = 2 entao
         para x <- 1 ate 100 faca
            se clinico_valido = falso entao
               escreval ("Informe a quantidade de CLÍNICOS GERAIS:")
               leia (clinico2)
               se (clinico2 <= 4) e (clinico2 >= 2) entao
                  clinico_valido <- verdadeiro
                  escreval ("")
                  escreval ("====================================")
                  escreval ("CLÍNICOS GERAIS do segundo turno: ",clinico2)
                  escreval ("====================================")
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
      fimse
      //pediatras do segundo turno
      se turno = 2 entao
         para x <- 1 ate 100 faca
            se pediatra_valido = falso entao

               Escreval ("Informe a quantidade de PEDIATRAS:")
               leia (pediatra2)
               se (pediatra2 <= 2) e (pediatra2 >= 1) entao
                  pediatra_valido <- verdadeiro
                  escreval ("")
                  escreval ("==============================")
                  escreval ("PEDIATRAS do segundo turno: ",pediatra2)
                  escreval ("==============================")
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
      fimse
      //cirurgiões do segundo turno
      se turno = 2 entao
         para x <- 1 ate 100 faca
            se cirurgiao_valido = falso entao

               Escreval ("Informe a quantidade de CIRURGIÕES:")
               leia (cirurgiao2)
               se (cirurgiao2 <= 2) e (cirurgiao2 >= 1) entao
                  cirurgiao_valido <- verdadeiro
                  escreval ("")
                  escreval ("===============================")
                  escreval ("CIRURGIÕES do segundo turno: ",cirurgiao2)
                  escreval ("===============================")
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
         escreval ("")
         escreval ("PRESSIONE ENTER PARA CONTINUAR.")
         leia (z)
         limpatela
      fimse
      //definição de quantidades do terceiro turno
      //clínicos gerais do terceiro turno
      se turno = 3 entao
         para x <- 1 ate 100 faca
            se clinico_valido = falso entao
               escreval ("Informe a quantidade de CLÍNICOS GERAIS:")
               leia (clinico3)
               se (clinico3 <= 4) e (clinico3 >= 2) entao
                  clinico_valido <- verdadeiro
                  escreval ("")
                  escreval ("=====================================")
                  escreval ("CLÍNICOS GERAIS do terceiro turno: ",clinico3)
                  escreval ("=====================================")
                  escreval ("")
               senao
                  escreval ("")
                  escreval ("======================================")
                  escreval ("Quantidade de CLÍNICOS GERAIS inválida")
                  escreval ("Digite um número de 2 a 4.")
                  escreval ("======================================")
                  escreval ("")
               fimse
            fimse
         fimpara
      fimse
      //pediatras do terceiro turno
      se turno = 3 entao
         para x <- 1 ate 100 faca
            se pediatra_valido = falso entao
               escreval ("Informe a quantidade de PEDIATRAS:")
               leia (pediatra3)
               se (pediatra3 <= 2) e (pediatra3 >= 1) entao
                  pediatra_valido <- verdadeiro
                  escreval ("")
                  escreval ("===============================")
                  escreval ("PEDIATRAS do terceiro turno: ", pediatra3)
                  escreval ("===============================")
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
      fimse
      //cirurgiões do terceiro turno
      se turno = 3 entao
         para x <- 1 ate 100 faca
            se cirurgiao_valido = falso entao

               escreval ("Informe a quantidade de CIRURGIÕES:")
               leia (cirurgiao3)
               se (cirurgiao3 <= 2) e (cirurgiao3 >= 1) entao
                  cirurgiao_valido <- verdadeiro
                  escreval ("")
                  escreval ("===============================")
                  escreval ("CIRURGIÕES do terceiro turno: ", cirurgiao3)
                  escreval ("===============================")
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
         escreval ("")
         escreval ("PRESSIONE ENTER PARA CONTINUAR.")
         leia (z)
         limpatela
      fimse
   fimpara
   //quadro geral da situação dos 3 turnos
   //turno da manhã
   escreval ("======================")
   escreval ("Hospital Santa Helena")
   escreval ("=======MEDSHIFT=======")
   escreval ("")
   escreval ("=======================================")
   escreval ("Quantidade de médicos do turno da ",turno1)
   escreval ("")
   escreval ("-------------------")
   escreval ("CLÍNICOS GERAIS: ",clinico1)
   escreval ("PEDIATRAS: ",pediatra1)
   escreval ("CIRURGIÕES: ",cirurgiao1)
   escreval ("-------------------")
   escreval ("")
   escreval ("TURNO COBERTO!!!")
   escreval ("=======================================")
   //turno da tarde
   escreval ("=======================================")
   escreval ("Quantidade de médicos do turno da ",turno2)
   escreval ("")
   escreval ("-------------------")
   escreval ("CLÍNICOS GERAIS: ",clinico2)
   escreval ("PEDIATRAS: ",pediatra2)
   escreval ("CIRURGIÕES: ",cirurgiao2)
   escreval ("-------------------")
   escreval ("")
   escreval ("TURNO COBERTO!!!")
   escreval ("=======================================")
   //turno da noite
   escreval ("=======================================")
   Escreval ("Quantidade de médicos do turno da ",turno3)
   escreval ("")
   escreval ("-------------------")
   escreval ("CLÍNICOS GERAIS: ",clinico3)
   escreval ("PEDIATRAS: ",pediatra3)
   escreval ("CIRURGIÕES: ",cirurgiao3)
   escreval ("-------------------")
   escreval ("")
   escreval ("TURNO COBERTO!!!")
   escreval ("=======================================")
fimalgoritmo