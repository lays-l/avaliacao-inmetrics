Quando('preencher as informações para cadastro de funcionário') do
  @cpf = Faker::CPF.pretty  # também pode ser utilizado CpfUtils.cpf_formatted - o campo só está aceitando com pontuação
  contrato = data_load(%w[funcionario contrato]).sample
  $site_pages.cadastro_funcionario.inpt_nome.set Faker::Name.name
  $site_pages.cadastro_funcionario.inpt_cpf.set @cpf
  sleep(0.5)
  $site_pages.cadastro_funcionario.selecionar_sexo()
  $site_pages.cadastro_funcionario.inpt_admissao.set I18n.l(Date.today-5)
  $site_pages.cadastro_funcionario.inpt_cargo.set data_load(%w[funcionario cargo]).sample
  $site_pages.cadastro_funcionario.inpt_salario.set Faker::Number.number(digits: 6)
  contrato.eql?('clt') ? $site_pages.cadastro_funcionario.inpt_radio_clt.click : $site_pages.cadastro_funcionario.inpt_radio_pj.click
  $site_pages.cadastro_funcionario.inpt_btn_cadastrar.click
end

Então('validar que o funcionário foi cadastrado com sucesso') do
  $site_pages.funcionario.wait_until_div_alerta_sucesso_visible(wait: 10)
  expect($site_pages.funcionario.div_alerta_sucesso.text).to include data_load(%w[mensagens sucesso usuario_cadastrado])
end