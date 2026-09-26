Algoritmo "semnome"
//MEDSHIFT
Var
   //declaração das variáveis do código
   turno, quantidade_manha, quantidade_manha2, quantidade_manha3: inteiro
   quantidade_tarde, quantidade_tarde2, quantidade_tarde3: inteiro
   quantidade_noite, quantidade_noite2, quantidade_noite3: inteiro

   turno1, turno2, turno3: caractere

   i, x, z: inteiro

   manha_usada, tarde_usada, noite_usada: logico
   turno_valido, medico_valido: logico

Inicio
   //seção para escolha de turnos
   para i <- 1 ate 3 faca

      turno_valido <- falso


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

      medico_valido <-falso

      para x <- 1 ate 100 faca
         se medico_valido = falso entao

            Escreval ("Informe a quantidade de CLÍNICOS GERAIS:")
            leia (quantidade_manha)
            se (quantidade_manha <= 4) e (quantidade_manha >= 2) entao
               medico_valido <- verdadeiro
               Escreval ("")
               Escreval ("=======================================")
               Escreval ("Quantidade de CLÍNICOS GERAIS válida.")
               Escreval ("=======================================")
               Escreval ("")
               Escreval ("===============================")
               Escreval ("O turno pode ser publicado.")
               Escreval ("===============================")
               Escreval ("")
            senao
               Escreval ("Quantidade de CLÍNICOS GERAIS inválida.")
            fimse
         fimse
      fimpara
   fimpara
fimalgoritmo