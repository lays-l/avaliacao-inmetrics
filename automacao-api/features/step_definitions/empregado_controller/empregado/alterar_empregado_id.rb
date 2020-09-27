Dado('gerar dados para alteração') do
  @empregado_controller_empregado_alterar_put_body = build(:user).user_payload
end

Quando('fazer uma requisição PUT para o endpoint empregado alterar {string}') do |empregado_id|
  @empregado_id = empregado_id.empty? ? @empregado_controller_empregado_cadastrar_post_response['empregadoId'] : empregado_id
  @empregado_controller_empregado_alterar_put_response = endpoint_empregado_controller.alterar_usuario(@empregado_id, @empregado_controller_empregado_alterar_put_body)
end

Então('validar retorno do endpoint empregado alterar empregado_id para o cenário {string}') do |tipo|
  endpoint = @empregado_controller_empregado_alterar_put_response
  if tipo.eql?('positivo')
    expect(endpoint.code).to eql(api_data_load(%w[http_status_code accepted]))
    expect(endpoint['empregadoId']).to eql @empregado_id
    expect(endpoint['nome']).to eql @empregado_controller_empregado_alterar_put_body[:nome]
    expect(endpoint['sexo']).to eql @empregado_controller_empregado_alterar_put_body[:sexo]
    expect(endpoint['cpf']).to eql @empregado_controller_empregado_alterar_put_body[:cpf]
    expect(endpoint['cargo']).to eql @empregado_controller_empregado_alterar_put_body[:cargo]
    expect(endpoint['admissao']).to eql @empregado_controller_empregado_alterar_put_body[:admissao]
    expect(endpoint['salario']).to eql @empregado_controller_empregado_alterar_put_body[:salario]
    expect(endpoint['comissao']).to eql @empregado_controller_empregado_alterar_put_body[:comissao]
    expect(endpoint['tipoContratacao']).to eql @empregado_controller_empregado_alterar_put_body[:tipoContratacao]
  else
    expect(endpoint.code).to eql(api_data_load(%w[http_status_code bad_request]))
  end
end
