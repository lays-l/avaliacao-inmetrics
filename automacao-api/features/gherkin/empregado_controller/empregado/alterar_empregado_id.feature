#language: pt

@#lays_lima
@empregado_controller
Funcionalidade: Empregado Controller - endpoint de empregado alterar por empregado_id
  validar endpoint PUT da API Empregado Controller

  @alterar_usuario
  Esquema do Cenário: Validar endpoint PUT empregado alterar empregado_id
    Dado eu tenho um usuário cadastrado na API empregado controller para o cenário '<tipo>'
    E gerar dados para alteração
    Quando fazer uma requisição PUT para o endpoint empregado alterar '<empregado_id>'
    Então validar retorno do endpoint empregado alterar empregado_id para o cenário '<tipo>'

    Exemplos:
      | tipo     | empregado_id |
      | positivo |              |
      | negativo | invalido     |