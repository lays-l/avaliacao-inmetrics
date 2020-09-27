Dado('navegar para a página de {string}') do |navegacao|
  case navegacao
  when 'cadastro' then $site_pages.funcionario.a_cadastrar_funcionario.click
  end
end

Então('validar que o usuário está logado na página de funcionários') do
  expect($site_pages.funcionario.has_tbl_funcionarios?).to be_truthy
end

Quando('pesquisar um funcionário por {string}') do |filtro|
  @filtro =  case filtro
             when 'nome' then data_load(%w[funcionario busca nome])
             when 'cpf' then @cpf.nil? ? data_load(%w[funcionario busca cpf]) : @cpf
             when 'cargo' then data_load(%w[funcionario busca cargo])
             end
  $site_pages.funcionario.inpt_busca.set @filtro
end

Então('validar que a busca retornou resultado') do
  expect($site_pages.funcionario.encontrar_tr(@filtro)).to be_truthy
end

Quando('cadastrar um novo funcionario') do
  step("navegar para a página de 'cadastro'")
  step('preencher as informações para cadastro de funcionário')
  step('validar que o funcionário foi cadastrado com sucesso')
end

Quando('excluir o cadastro do funcionario') do
  $site_pages.funcionario.btn_excluir.first.click
end

Então('validar que o cadastro do funcionario foi excluido com sucesso') do
  $site_pages.funcionario.wait_until_div_alerta_sucesso_visible(wait: 10)
  expect($site_pages.funcionario.div_alerta_sucesso.text).to include data_load(%w[mensagens sucesso funcionario_excluido])
end

Quando('editar o cadastro do funcionário') do
  $site_pages.funcionario.btn_editar.first.click
  $site_pages.cadastro_funcionario.inpt_nome.send_keys [:control, 'a'], :space
  $site_pages.cadastro_funcionario.inpt_nome.set Faker::Name.name
  $site_pages.cadastro_funcionario.slct_sexo.select($site_pages.cadastro_funcionario.slct_sexo.value.eql?('Masculino') ? 'Feminino' : 'Masculino')
  $site_pages.cadastro_funcionario.inpt_salario.send_keys [:control, 'a'], :space
  $site_pages.cadastro_funcionario.inpt_salario.set Faker::Number.number(digits: 6)
  $site_pages.cadastro_funcionario.inpt_btn_cadastrar.click
end

Então('validar que o cadastro do funcionario foi editado com sucesso') do
  $site_pages.funcionario.wait_until_div_alerta_sucesso_visible(wait: 10)
  expect($site_pages.funcionario.div_alerta_sucesso.text).to include data_load(%w[mensagens sucesso funcionario_editado])
end