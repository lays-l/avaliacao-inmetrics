module Site
  module Login
    class Login < SitePrism::Page
      set_url "#{CONFIG['urls']['site']}/accounts/login/"
      element :inpt_login, 'input[name=username]'
      element :inpt_senha, 'input[name=pass]'
      element :btn_entrar, '.login100-form-btn'
      element :div_alerta_erro, '.alert.alert-danger'
    end
  end
end
