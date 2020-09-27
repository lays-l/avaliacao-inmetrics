#language: pt

@#lays_lima
@funcionario
Funcionalidade: Funcionario - Validar acesso de usuário à página de funcionários no site de teste
  Como usuário do site de teste
  Quero realizar o acesso a página de funcionários
  Para acessar a página de funcionários

  Contexto: que o usuário esteja logado no site de teste
    * acessar a página de login
    * preencher os dados de usuário no cenário 'positivo'

  @acessar_pagina_funcionario
  Cenario: Validar acesso de usuário à página de funcionários no site de teste
    Então validar que o usuário está logado na página de funcionários

  @busca_funcionario
  Esquema do Cenario: Validar acesso de usuário à página de funcionários no site de teste
    Quando pesquisar um funcionário por '<filtro>'
    Então validar que a busca retornou resultado

    Exemplos:
      | filtro |
      | nome   |
      | cargo  |
      | cpf    |

  @excluir_funcionario
  Esquema do Cenario: Validar acesso de usuário à página de funcionários no site de teste
    Quando cadastrar um novo funcionario
    E pesquisar um funcionário por 'cpf'
    E excluir o cadastro do funcionario
    Então validar que o cadastro do funcionario foi excluido com sucesso

  @editar_funcionario
  Esquema do Cenario: Validar acesso de usuário à página de funcionários no site de teste
    Quando editar o cadastro do funcionário
    Então validar que o cadastro do funcionario foi editado com sucesso
