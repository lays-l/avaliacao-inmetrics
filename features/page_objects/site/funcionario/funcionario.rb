module Site
  module Funcionario
    class Funcionario < SitePrism::Page
      set_url "#{SITE_CONFIG['urls']['site']}/empregados/"
      element :a_cadastrar_funcionario, "a[href='/empregados/new_empregado']"
      element :tbl_funcionarios, '#tabela'
      element :div_alerta_sucesso, '.alert.alert-success'
      element :inpt_busca, 'input[type=search]'
      elements :btn_excluir, '#delete-btn'
      elements :btn_editar, '.btn.btn-warning'
      elements :tr_linhas_tabela, '#tabela > tbody > tr'

      def encontrar_tr(item)
        encontrado = false
        $site_pages.funcionario.tr_linhas_tabela.each do |linha|
          encontrado = linha.text.include?(item) ? true : false
        end
        encontrado
      end
    end
  end
end