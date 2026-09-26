Algoritmo "semnome"
//  
//  
//MEDSHIFT
Var
   //declaração das variáveis do código
   turno, quantidade_manha, quantidade_manha2, quantidade_manha3: inteiro
   quantidade_tarde, quantidade_tarde2, quantidade_tarde3: inteiro
   quantidade_noite, quantidade_noite2, quantidade_noite3: inteiro

   turno1, turno2, turno3: caractere

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
      para z <- 1 ate 100 faca
         se turno_valido = falso entao
            Escreval ("Informe o turno do plantão:")
            Escreval ("1 - MANHÃ")
            Escreval ("2 - TARDE")
            Escreval ("3 - NOITE")
            leia(turno) // leia adicionado aqui para que o usuario tenha
            //"o poder de escolha"

            se turno = 1 entao
               se manha_usada = falso entao //TURNO DA MANHÃ
                  manha_usada <- verdadeiro
                  turno_valido <- verdadeiro
                  Escreval ("")
                  Escreval("Turno da MANHÃ selecionado.")
                  Escreval("")
               senao
                  Escreval("")
                  Escreval ("O TURNO DA MANHÃ JÁ FOI SELECIOANDO.")
                  EscrevaL("Digite outro turno")
                  Escreval("")
               fimse

            senao

               se turno = 2 entao
                  se tarde_usada = falso entao //TURNO DA TARDE"
                     tarde_usada <- verdadeiro
                     turno_valido <- verdadeiro
                     Escreval("Turno da TARDE selecionado.")
                     Escreval("")
                  senao
                     Escreval("")
                     Escreval ("O TURNO DA TARDE JÁ FOI SELECIOANDO.")
                     EscrevaL("Digite outro turno")
                     Escreval("")
                  fimse

               senao

                  se turno = 3 entao
                     se noite_usada = falso entao //TURNO DA NOITE
                        turno3 <- "NOITE"
                        noite_usada <- verdadeiro
                        turno_valido <- verdadeiro
                        Escreval("Turno da NOITE selecionado.")
                        Escreval("")
                     senao
                        Escreval("")
                        Escreval ("O TURNO DA NOITE JÁ FOI SELECIONADO.")
                        EscrevaL("Digite outro turno")
                        Escreval("")
                     fimse
                  senao
                     Escreval(" Opção de turno inválida. Escolha 1,2 ou 3")
                  fimse
               fimse
            fimse
         fimse
      fimpara
////////////////////////////////////////////////////////////////////////////////
      clinico_valido <-falso
      se turno = 1 entao
         para x <- 1 ate 100 faca
            se clinico_valido = falso entao

               Escreval ("Informe a quantidade de CLÍNICOS GERAIS: ")
               leia (clinico1)
               se (clinico1 <= 4) e (clinico1 >= 2) entao
                  clinico_valido <- verdadeiro
               escreval("Clinicos do primeiro turno: ", clinico1)
               senao
                    Escreval ("Quantidade de CLÍNICOS GERAIS inválida.")
                    Escreval ("Digite um numero de 2 a 4")
               fimse
            fimse
         fimpara

      pediatra_valido <- falso
         para x <- 1 ate 100 faca
            se pediatra_valido =  falso entao

               escreval ("Informe a quantidade de PEDIATRAS: ")
               leia(pediatra1)
               se (pediatra1 <= 2) e (pediatra1 >= 0) entao
                  pediatra_valido <- verdadeiro
               escreval ("Pediatras do primeiro turno: ", pediatra1)
               senao
                    escreval ("Quantidade de pediatras inválida.")
                    escreval (" Digite um numero de 0 a 2")
               fimse
            fimse
         fimpara
             

      cirurgiao_valido <- falso
         para x <- 1 ate 100 faca
            se cirurgiao_valido =  falso entao

               escreval ("Informe a quantidade de CIRURGIOES: ")
               leia(cirurgiao1)
               se (cirurgiao1 <= 2) e (cirurgiao1 >= 0) entao
                  cirurgiao_valido <- verdadeiro
               escreval ("Cirurgiao do primeiro turno: ", cirurgiao1)
               senao
                    escreval ("Quantidade de cirurgiao inválida.")
                    escreval ("Digite um numero de 0 a 2")
               fimse
            fimse
         fimpara
      fimse
////////////////////////////////////////////////////////////////////////////////
      se turno = 2 entao
         para x <- 1 ate 100 faca
            se clinico_valido = falso entao

               Escreval ("Informe a quantidade de CLÍNICOS GERAIS: ")
               leia (clinico2)
               se (clinico2 <= 4) e (clinico2 >= 2) entao
                  clinico_valido <- verdadeiro
                  escreval("Clinicos do segundo turno: ", clinico2)
               senao
                    Escreval ("Quantidade de CLÍNICOS GERAIS inválida.")
                    Escreval ("Digite um numero de 2 a 4")
               fimse
            fimse
         fimpara
      fimse
      
      se turno = 2 entao
               para x <- 1 ate 100 faca
                  se pediatra_valido = falso entao

                     Escreval ("Informe a quantidade de pediatras: ")
                     leia (pediatra2)
                     se (pediatra2 <= 4) e (pediatra2 >= 2) entao
                        pediatra_valido <- verdadeiro
                        escreval("pediatras do segundo turno: ", pediatra2)
                     senao
                          Escreval ("Quantidade de PEDIATRAS inválida.")
                          escreval (" Digite um numero de 2 a 4")
                     fimse
                  fimse
               fimpara
            fimse

         se turno = 2 entao
            para x <- 1 ate 100 faca
               se cirurgiao_valido = falso entao

                  Escreval ("Informe a quantidade de cirurgiao: ")
                  leia (cirurgiao2)
                  se (cirurgiao2 <= 4) e (cirurgiao2 >= 2) entao
                     cirurgiao_valido <- verdadeiro
                     escreval("cirurgioes do segundo turno: ", cirurgiao2)
                  senao
                       Escreval ("Quantidade de cirurgioes inválida.")
                       Escreval ("Digite um numero de 2 a 4")
                  fimse
               fimse
            fimpara
         fimse
////////////////////////////////////////////////////////////////////////////////
         se turno = 3 entao
                  para x <- 1 ate 100 faca
                     se clinico_valido = falso entao

                        Escreval ("Informe a quantidade de CLÍNICOS GERAIS: ")
                        leia (clinico3)
                        se (clinico3 <= 4) e (clinico3 >= 2) entao
                           clinico_valido <- verdadeiro
                           escreval("Clinicos do terceiro turno: ", clinico3)
                        senao
                             Escreval ("Quantidade de CLÍNICOS GERAIS inválida")
                             escreval (" Digite um numero de 2 a 4")
                        fimse
                     fimse
                  fimpara
               fimse

         se turno = 3 entao
         para x <- 1 ate 100 faca
            se pediatra_valido = falso entao

               Escreval ("Informe a quantidade de pediatras: ")
               leia (pediatra3)
               se (pediatra3 <= 4) e (pediatra3 >= 2) entao
                  pediatra_valido <- verdadeiro
                  escreval("pediatras do terceiro turno: ", pediatra3)
               senao
                    Escreval ("Quantidade de PEDIATRAS inválida.")
                    escreval ("Digite um numero de 2 a 4")
               fimse
            fimse
         fimpara
      fimse

      se turno = 3 entao
                  para x <- 1 ate 100 faca
                     se cirurgiao_valido = falso entao

                        Escreval ("Informe a quantidade de cirurgiao: ")
                        leia (cirurgiao3)
                        se (cirurgiao3 <= 4) e (cirurgiao3 >= 2) entao
                           cirurgiao_valido <- verdadeiro
                           escreval("cirurgioes do terceiro turno: ", cirurgiao3)
                        senao
                             Escreval ("Quantidade de cirurgioes inválida.")
                             escreval (" Digite um numero de 2 a 4")
                        fimse
                     fimse
                  fimpara
               fimse
fimpara
////////////////////////////////////////////////////////////////////////////////
escreval("==========================================")
escreval ("")
Escreval ("Plantao do primeiro turno: ")
escreval ("")
escreval ("Clinicos: ",clinico1)
escreval ("Pediatras: ",pediatra1)
escreval ("Cirurgioes: ",cirurgiao1)
escreval ("TURNO COBERTO")
escreval ("==========================================")



escreval ("")
Escreval ("Plantao do segundo turno: ")
escreval ("")
escreval ("Clinicos: ",clinico2)
escreval ("Pediatras: ",pediatra2)
escreval ("Cirurgioes: ",cirurgiao2)
escreval ("TURNO COBERTO")
escreval ("==========================================")

escreval ("")
Escreval ("Plantao do terceiro turno: ")
escreval ("")
escreval ("Clinicos: ",clinico3)
escreval ("Pediatras: ",pediatra3)
escreval ("Cirurgioes: ",cirurgiao3)
escreval ("TURNO COBERTO")
escreval ("==========================================")


fimalgoritmo