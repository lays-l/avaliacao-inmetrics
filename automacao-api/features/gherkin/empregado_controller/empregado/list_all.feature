#language: pt

@#lays_lima
@empregado_controller
Funcionalidade: Empregado Controller - endpoint de empregado listall
  validar endpoint GET da API Empregado Controller

  @retornar_usuarios
  Cenário: Validar endpoint GET empregado listall
    Quando fazer uma requisição GET para o endpoint empregado list-all
    Então retornar a lista de usuários cadastrados