Algoritmo "Dados do Plantão"
//  
//  

Var
//Variavel do menu de escolha no inicio do progama
   opcao: inteiro

//Criei um contador 'i' que vai armazenar os nomes dos clinicos
   i: inteiro

// Variaveis do periodo Matutino    CGM = Clinico Geral Matutino
   CGM: vetor [0..3]  de caractere

   
// Variaveis do periodo Vespertino  CGV = Clinico Geral Vespertino
   CGV: vetor [0..3] de caractere

   
 // Variaveis do periodo Noturno    CGN = Clinico Geral Norturno
   CGN: vetor [0..3] de caractere




Inicio

         Escreval("ESCALA DE PLANTÃO DE SEGUNDA FEIRA DOS CLINICOS GERAIS")
         escreval("")
//aqui criamos um laço de repeticao, enquanto a opcao escolhida
//nao for um numero entre 1 e 3 o progama nao segue em frente
      repita
         Escreval("Digite 1 para ver a escala matutina    (6h-14:35)")
         Escreval("Digite 2 para ver a escala vespertina  (14:35h-23:05)")
         Escreval("Digite 3 para ver a escala matutina    (23:05h-6h)")
         Escreval ("" )
         leia (opcao)

         se (opcao < 1) ou (opcao > 3) entao
            escreval("Escolha uma opcao de 1 a 3")
            escreval("")
         fimse
      ate (opcao >= 1) e (opcao <= 3)
      

 //Periodo matutino
      se opcao = 1 entao
//Informando os clinicos que vão atuar das 6h as 14:35
            CGM[0] <- "Flaco Lopez"
            CGM[1] <- "Valdivia"
            CGM[2] <- "Gustavo Gomez"
            CGM[3] <- "Abel Ferreira"

            escreval("========================")
            escreval("CLINICOS GERAIS MATUTINO")
            escreval("========================")
            escreval("")
//looping para informar os clinicos do primeiro turno
            para i de 0 ate 3 faca
                 escreval(i+1, " - ", CGM[i])
            fimpara
            escreval ("")
            escreval("========================")
      fimse
//-----------------------------------------------------------------

//Periodo vespertino
      se opcao = 2 entao
//Informando os clinicos que vão atuar das 14:40h as 23:05
         CGV[0] <- "Neymar Junior"
         CGV[1] <- "L Messi"
         CGV[2] <- "Cristiano Ronaldo"
         CGV[3] <- "Mbappe"

         escreval("CLINICOS GERAIS VESPERTINO")
         escreval("========================")
         escreval("")
//looping para informar os clinicos do primeiro turno
         para i de 0 ate 3 faca
              escreval(i+1, " - ", CGV[i])
         fimpara
         escreval ("")
         escreval("========================")
      fimse
//-----------------------------------------------------------------

//Periodo noturno
      se opcao = 3 entao
//Informando os clinicos que vão atuar das 23:05h as 6h
         CGN[0] <- "Cristiano Araujo"
         CGN[1] <- "Vinicius J"
         CGN[2] <- "Charlie B"
         CGN[3] <- "Joca"

         escreval("CLINICOS GERAIS NOTURNO")
         escreval("========================")
         escreval("")

//looping para informar os clinicos do primeiro turno
         para i de 0 ate 3 faca
              escreval(i+1, " - ", CGN[i])
         fimpara
         escreval ("")
         escreval("========================")
      fimse


Fimalgoritmo
