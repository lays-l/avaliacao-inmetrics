Dado('eu tenho um usuário cadastrado na API empregado controller para o cenário {string}') do |tipo|
  step("eu tenho uma massa configurada para o POST do endpoint empregado cadastrar para o cenário '#{tipo}'")
  step('fazer uma requisição POST para o endpoint empregado cadastrar')
  step("validar retorno do endpoint empregado cadastrar para o cenário '#{tipo}'")
end

Quando('fazer uma requisição GET para o endpoint empregado list {string}') do |empregado_id|
  @empregado_id = empregado_id.empty? ? @empregado_controller_empregado_cadastrar_post_response['empregadoId'] : empregado_id
  @empregado_controller_list_empregado_id_get_response = endpoint_empregado_controller.retornar_usuario(@empregado_id.to_i)
end

Então('validar retorno do endpoint empregado list por id para o cenário {string}') do |tipo|
  endpoint = @empregado_controller_list_empregado_id_get_response
  if tipo.eql?('positivo')
    expect(endpoint.code).to eql(api_data_load(%w[http_status_code accepted]))
    expect(endpoint['empregadoId']).to eql @empregado_id
    expect(endpoint['nome']).to eql @empregado_controller_empregado_cadastrar_post_response['nome']
    expect(endpoint['sexo']).to eql @empregado_controller_empregado_cadastrar_post_response['sexo']
    expect(endpoint['cpf']).to eql @empregado_controller_empregado_cadastrar_post_response['cpf']
    expect(endpoint['cargo']).to eql @empregado_controller_empregado_cadastrar_post_response['cargo']
    expect(endpoint['admissao']).to eql @empregado_controller_empregado_cadastrar_post_response['admissao']
    expect(endpoint['salario']).to eql @empregado_controller_empregado_cadastrar_post_response['salario']
    expect(endpoint['comissao']).to eql @empregado_controller_empregado_cadastrar_post_response['comissao']
    expect(endpoint['tipoContratacao']).to eql @empregado_controller_empregado_cadastrar_post_response['tipoContratacao']
  else
    expect(endpoint.code).to eql(api_data_load(%w[http_status_code bad_request]))
    expect(endpoint.body).to eql(api_data_load(%w[response_messages empregado_nao_cadastrado]))
  end
end
