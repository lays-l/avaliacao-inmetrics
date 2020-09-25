module Site
  module Funcionario
    class CadastroFuncionario < SitePrism::Page
      set_url "#{SITE_CONFIG['urls']['site']}/empregados/new_empregado"
      element :inpt_nome, '#inputNome'
      element :inpt_cpf, '#cpf'
      element :slct_sexo, '#slctSexo'
      element :inpt_admissao, '#inputAdmissao'
      element :inpt_cargo, '#inputCargo'
      element :inpt_salario, '#dinheiro'
      element :inpt_radio_clt, '#clt'
      element :inpt_radio_pj, '#pj'
      element :inpt_btn_cadastrar, '.cadastrar-form-btn'
      # element :inpt_btn_cancelar, '.cancelar-form-btn'

      def selecionar_sexo
        retries = 0
        loop do
          slct_sexo.all('option').sample.click
          break if !slct_sexo.value.nil? || retries = 5

          retries += 1
        end
      end
    end
  end
end
