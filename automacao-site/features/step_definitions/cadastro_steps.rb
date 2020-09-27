Dado('acessar a página de cadastro') do
  step('acessar a página de login')
  $site_pages.cadastro.a_cadastrar_usuario.click
end

Quando('preencher as informações para cadastro') do
  $site_pages.cadastro.inpt_usuario.set Faker::Name.name #não pode ser menor que 8
  $site_pages.cadastro.inpt_senha.set data_load(%w[cadastro_usuario senha])
  $site_pages.cadastro.inpt_confirm_senha.set data_load(%w[cadastro_usuario senha])
  $site_pages.cadastro.btn_cadastrar.click
end

Então('validar que o usuário foi cadastrado com sucesso') do
  expect($site_pages.cadastro.has_no_div_usuario_ja_cadastrado?).to be_truthy
end
