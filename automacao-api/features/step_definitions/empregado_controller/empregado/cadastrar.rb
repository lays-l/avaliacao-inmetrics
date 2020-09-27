Dado('eu tenho uma massa configurada para o POST do endpoint empregado cadastrar para o cenário {string}') do |tipo, *dados|
  @empregado_controller_empregado_cadastrar_post_body = build(:user).user_payload
  if tipo.eql?('negativo')
    @data_table = create_data_table(dados.first)
    case @data_table['dado_invalido']
    when 'nome' then @empregado_controller_empregado_cadastrar_post_body[:nome] = api_data_load(%w[dados_invalidos nome])
    when 'cpf' then @empregado_controller_empregado_cadastrar_post_body[:cpf].gsub!(/[^0-9]/, '')
    when 'sexo' then @empregado_controller_empregado_cadastrar_post_body[:sexo] = api_data_load(%w[dados_invalidos sexo])
    when 'departamento' then @empregado_controller_empregado_cadastrar_post_body[:departamentoId] = ''
    when 'admissao' then @empregado_controller_empregado_cadastrar_post_body[:admissao] = Date.today
    when 'salario' then @empregado_controller_empregado_cadastrar_post_body[:salario].gsub!(/[^0-9]/, '')
    when 'comissao' then @empregado_controller_empregado_cadastrar_post_body[:comissao].gsub!(/[^0-9]/, '')
    when 'contratacao' then @empregado_controller_empregado_cadastrar_post_body[:tipoContratacao] = api_data_load(%w[dados_invalidos contratacao])
    else @empregado_controller_empregado_cadastrar_post_body = nil
    end
  end
end

Quando('fazer uma requisição POST para o endpoint empregado cadastrar') do
  @empregado_controller_empregado_cadastrar_post_response = endpoint_empregado_controller.cadastrar_usuario(@empregado_controller_empregado_cadastrar_post_body)
end

Então('validar retorno do endpoint empregado cadastrar para o cenário {string}') do |tipo|
  endpoint = @empregado_controller_empregado_cadastrar_post_response
  if tipo.eql?('positivo')
    expect(endpoint.code).to eql(api_data_load(%w[http_status_code accepted]))
    expect(endpoint['empregadoId']).not_to be_nil
    expect(endpoint['nome']).to eql @empregado_controller_empregado_cadastrar_post_body[:nome]
    expect(endpoint['sexo']).to eql @empregado_controller_empregado_cadastrar_post_body[:sexo]
    expect(endpoint['cpf']).to eql @empregado_controller_empregado_cadastrar_post_body[:cpf]
    expect(endpoint['cargo']).to eql @empregado_controller_empregado_cadastrar_post_body[:cargo]
    expect(endpoint['admissao']).to eql @empregado_controller_empregado_cadastrar_post_body[:admissao]
    expect(endpoint['salario']).to eql @empregado_controller_empregado_cadastrar_post_body[:salario]
    expect(endpoint['comissao']).to eql @empregado_controller_empregado_cadastrar_post_body[:comissao]
    expect(endpoint['tipoContratacao']).to eql @empregado_controller_empregado_cadastrar_post_body[:tipoContratacao]
  else
    expect(endpoint.code).to eql(api_data_load(%w[http_status_code bad_request]))
    case @data_table['dado_invalido']
    when 'nome' then expect(endpoint.first).to eql api_data_load(%w[response_messages nome_invalido])
    when 'cpf' then expect(endpoint.first).to eql api_data_load(%w[response_messages cpf_padrao_invalido])
    when 'sexo' then expect(endpoint.first).to eql api_data_load(%w[response_messages sexo_invalido])
    when 'departamento' then expect(endpoint.first).to eql api_data_load(%w[response_messages departamento_id_nulo])
    when 'admissao' then expect(endpoint.first).to eql api_data_load(%w[response_messages admissao_padrao_invalido])
    when 'salario', 'comissao' then expect(endpoint.first).to include api_data_load(%w[response_messages valor_invalido])
    when 'contratacao' then expect(endpoint.first).to eql api_data_load(%w[response_messages tipo_contratacao_invalido])
    end
  end
end
