Quando('fazer uma requisição GET para o endpoint empregado list-all') do
  @empregado_controller_get_response = endpoint_empregado_controller.retornar_todos_usuarios
end

Então('retornar a lista de usuários cadastrados') do
  endpoint = @empregado_controller_get_response
  expect(endpoint.code).to eql(api_data_load(%w[http_status_code ok]))
  expect(endpoint.first).not_to be_nil
end
