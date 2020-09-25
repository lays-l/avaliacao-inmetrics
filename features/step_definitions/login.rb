Dado('acessar a página de login') do
  $site_pages.login.load
  $site_pages.login.wait_until_inpt_login_visible(wait:10)
end

Quando('preencher os dados de usuário no cenário {string}') do |tipo|
  $site_pages.login.inpt_login.set data_load(%w[login usuario])
  $site_pages.login.inpt_senha.set tipo.eql?('positivo') ? data_load(%w[login senha]) : data_load(%w[login senha_invalida])
  $site_pages.login.btn_entrar.click
end

Então('validar que o usuário está logado com sucesso no cenário {string}') do |tipo|
  tipo.eql?('positivo') ? (expect(current_url).to eql($site_pages.funcionario.url)) : (expect($site_pages.login.div_alerta_erro.text).to include data_load(%w[mensagens erro login]))
end