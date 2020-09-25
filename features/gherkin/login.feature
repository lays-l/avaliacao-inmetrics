#language: pt

@#lays_lima
@login
Funcionalidade: Login - Validar acesso de um usuário ao site de teste
  Como usuário já cadastrado
  Quero realizar o acesso ao site de teste
  Para acessar minha conta

Esquema do Cenario: Validar acesso de um usuário ao site de teste
  Dado acessar a página de login
  Quando preencher os dados de usuário no cenário '<tipo>'
  Então validar que o usuário está logado com sucesso no cenário '<tipo>'

    Exemplos:
    | tipo     |
    | positivo |
    | negativo |
