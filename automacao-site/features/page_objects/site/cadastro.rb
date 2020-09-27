module Site
  module Cadastro
    class Cadastro < SitePrism::Page
      element :a_cadastrar_usuario, ".w-full > a[href='/accounts/signup/']"
      element :a_cadastrar_usuario_header, ".nav-link > a[href='/accounts/signup/']"
      element :inpt_usuario, 'input[name=username]'
      element :inpt_senha, 'input[name=pass]'
      element :inpt_confirm_senha, 'input[name=confirmpass]'
      element :btn_cadastrar, '.login100-form-btn'
      element :div_usuario_ja_cadastrado, '.container-login100-form-btn', text: 'Usuário já cadastrado'
    end
  end
end
