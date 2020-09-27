#language: pt

@#lays_lima
@empregado_controller
Funcionalidade: Empregado Controller - endpoint de empregado cadastrar
  validar endpoint POST da API Empregado Controller

  @cadastrar_usuario
  Esquema do Cenário: Validar endpoint POST empregado cadastrar
    Dado eu tenho uma massa configurada para o POST do endpoint empregado cadastrar para o cenário '<tipo>'
      | dado_invalido | <dado_invalido> |
    Quando fazer uma requisição POST para o endpoint empregado cadastrar
    Então validar retorno do endpoint empregado cadastrar para o cenário '<tipo>'

    Exemplos:
      | tipo     | dado_invalido |
      | positivo |               |
      | negativo | nome          |
      | negativo | cpf           |
      | negativo | sexo          |
      | negativo | departamento  |
      | negativo | admissao      |
      | negativo | salario       |
      | negativo | comissao      |
      | negativo | contratacao   |