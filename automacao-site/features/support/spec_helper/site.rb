Dir[File.join(File.dirname(__FILE__), 'page_objects/site/*.rb')].sort.each { |file| require file }

module Site
  class Pages
    def login
      Site::Login::Login.new
    end

    def cadastro
      Site::Cadastro::Cadastro.new
    end

    def funcionario
      Site::Funcionario::Funcionario.new
    end

    def cadastro_funcionario
      Site::Funcionario::CadastroFuncionario.new
    end
  end
end
