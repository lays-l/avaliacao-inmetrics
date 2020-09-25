#language: pt

@#lays_lima
@funcionario
Funcionalidade: Funcionario - Validar cadastro de funcionário na página de funcionários no site de teste
  Como usuário do site de teste
  Quero realizar o acesso a página de funcionários
  Para cadastrar um novo funcionário

  Contexto: que o usuário esteja logado no site de teste na página de funcionários
    * acessar a página de login
    * preencher os dados de usuário no cenário 'positivo'
    * validar que o usuário está logado na página de funcionários

@cadastro_funcionario
Esquema do Cenário: Cenario: Validar cadastro de novo funcionario no site de teste
  Dado navegar para a página de '<pagina>'
  Quando preencher as informações para cadastro de funcionário
  Então validar que o funcionário foi cadastrado com sucesso

    Exemplos:
    | pagina   |
    | cadastro |