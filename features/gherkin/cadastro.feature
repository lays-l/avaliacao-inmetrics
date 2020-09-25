#language: pt

@#lays_lima
@cadastro
Funcionalidade: Cadastro - Validar cadastro de novo usuário no site de teste
  Como novo usuário
  Quero realizar o cadastro no site de teste
  Para ter uma conta

@cadastro_usuario
@cenario_valido
Cenario: Validar cadastro de novo usuário no site de teste
  Dado acessar a página de cadastro
  Quando preencher as informações para cadastro
  Então validar que o usuário foi cadastrado com sucesso