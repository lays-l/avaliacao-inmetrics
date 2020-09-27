require 'faker'
require 'cpf_faker'
require_relative '../models/users_model'

FactoryBot.define do
  factory :user, class: UsersModel do
    name { Faker::Name.first_name }
    sexo { ['i', 'f', 'm'].sample }
    cargo { ['QA', 'DEV', 'BA'].sample }
    cpf { Faker::CPF.pretty }
    departamento_id { Faker::Number.between(from: 1, to: 9) }
    admissao { (Date.today - 5).strftime('%d/%m/%Y') }
    salario { Faker::Number.number(digits: 6) }
    comissao { Faker::Number.number(digits: 5) }
    tipo_contratacao { ['pj', 'clt'].sample }
  end
end
