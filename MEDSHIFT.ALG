Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 23/09/2026
Var
   // Seção de Declarações das variáveis
   // Como uma variavel não guarda mais de um valor e temos 3 medicos
   // para 3 turnos totalizando 9 variaveis do tipo inteiro
   // e para caracteres, apenas 6 ja que temos 3 especialidades e 3 turnos
   especialidade,turno, quantidade: inteiro
   especialidade2,turno2, quantidade2: inteiro
   especialidade3,turno3, quantidade3: inteiro

   turno_carac,especialidade_carac: caractere
   turno_carac2,especialidade_carac2: caractere
   turno_carac3,especialidade_carac3: caractere

Inicio
   // Seção de Comandos, procedimento, funções, operadores, etc...

   //seção para escolha de turnos
   Escreval ("Digite o turno do plantão:")
   Escreval ("1 - Manhã")
   Escreval ("2 - Tarde")
   Escreval ("3 - Noite")
   Para turno <- 1 ate 3 faca
      leia(turno) // leia adicionado aqui para que o usuario tenha
      //"o poder de escolha"
      se turno = 1 entao
         turno_carac <- "Manhã"
         Escreval("Turno da manhã selecionado.")
         Escreval("")
      senao
         se turno = 2 entao
            turno_carac2 <- "Tarde"
            Escreval("Turno da tarde selecionado.")
            Escreval("")
         senao
            se turno = 3 entao
               turno_carac3 <- "Noite"
               Escreval("Turno da noite selecionado.")
               Escreval("")
            senao
               Escreval ("A opção de turno selecionada não existe")
               Escreval("")
Fimalgoritmo

fimse
fimse
fimse


// Seção para escolha de especialidade...
Escreval("Digite a especialidadedo plantão:")
Escreval("1 - Clínico Geral")
Escreval("2 - Pediatra")
Escreval("3 - Cirurgião")
leia(especialidade)
se especialidade = 1 entao
   especialidade_carac <- "Clinico Geral"
   Escreval("Clinico Geral selecionada.")
   Escreval("")
senao
   se especialidade = 2 entao
      especialidade_carac2 <- "Pediatra"
      Escreval("Pediatra selecionada.")
      Escreval("")
   senao
      se especialidade = 3 entao
         especialidade_carac3 <- "Cirurgião"
         Escreval("Cirurgião selecionado.")
         Escreval("")
      senao
         Escreval ("A opção de especialidade selecionada não existe")
         Escreval("")
Fimalgoritmo
fimse
fimse
fimse

//Seção para informar a quantidade da especialidade
Escreva ("Informe a quantidade de ")
se especialidade = 1 entao
   Escreval ("Clincos gerais")
senao
   se especialidade = 2 entao
      Escreval ("Pediatras")
   senao
      se especialidade = 3 entao
         Escreval ("Cirurgiões")
      fimse
   fimse
fimse

// validação da quantidade para clinicos gerais
// quantidade pensada para validar uma escala diária
// 2 clinicos por turno, em 3 plantões
se especialidade = 1 entao
   leia(quantidade)
   se (quantidade <= 12) e (quantidade >= 2) entao
      Escreval ("====Plantão aceito====")
      Escreval ("Turno da ", turno_carac, " com ", quantidade, " Clínicos Gerais")
   senao
      Escreval ("Quantidade inválida")
Fimalgoritmo
fimse
fimse

// validação da quantidade para pediatras
// quanntidade pensada para validar uma escala diária
// 1 pediatra por turno, em 3 plantões
se especialidade = 2 entao
   leia(quantidade2)
   se (quantidade2 <= 6) e (quantidade2 >= 1)entao
      Escreval ("")
      Escreval("===Plantão aceito===")
      Escreval ("Turno da ", turno_carac2, " com", quantidade2, " ", especialidade_carac2)
   senao
      Escreval ("Quantidade inválida")

      // validação da quantidade para pediatras
      // quanntidade pensada para validar uma escala diária
      // 1 pediatra por turno, em 3 plantões

      se especialidade = 3 entao
         leia(quantidade3)
         se (quantidade3 <= 6) e (quantidade3 >= 1)entao
            Escreval ("")
            Escreval("===Plantão aceito===")
            Escreval ("Turno da ", turno_carac3, " com", quantidade3, " ", especialidade_carac3)
         senao
            Escreval ("Quantidade inválida")
Fimalgoritmo
fimse
fimse
fimse
fimse
fimpara

Fimalgoritmo