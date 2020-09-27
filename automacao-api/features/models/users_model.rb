class UsersModel
  attr_accessor :name, :sexo, :cpf, :cargo, :departamento_id, :admissao, :salario, :comissao, :tipo_contratacao

  def user_payload
    {
      nome: @name,
      sexo: @sexo,
      cpf: @cpf,
      cargo: @cargo,
      departamentoId: @departamento_id,
      admissao: @admissao,
      salario: @salario.to_s.gsub(/\A(\d{1})(\d{3})(\d{2})\Z/, '\\1.\\2,\\3'),
      comissao: @comissao.to_s.gsub(/\A(\d{3})(\d{2})\Z/, '\\1,\\2'),
      tipoContratacao: @tipo_contratacao
    }
  end
end
