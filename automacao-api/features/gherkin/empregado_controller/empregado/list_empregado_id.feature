#language: pt

@#lays_lima
@empregado_controller
Funcionalidade: Empregado Controller - endpoint de empregado list por id do empregado
  validar endpoint GET da API Empregado Controller

  @retornar_usuario_por_id
  Esquema do Cenário: Validar endpoint GET empregado list por id do empregado
    Dado eu tenho um usuário cadastrado na API empregado controller para o cenário '<tipo>'
    Quando fazer uma requisição GET para o endpoint empregado list '<empregado_id>'
    Então validar retorno do endpoint empregado list por id para o cenário '<tipo>'

    Exemplos:
      | tipo     | empregado_id |
      | positivo |              |
      | negativo | invalido     |