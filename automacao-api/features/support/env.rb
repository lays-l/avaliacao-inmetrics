require 'factory_bot'
require 'faker'
require 'httparty'
require 'rspec'
require 'pry'
require 'cpf_faker'

require_relative 'spec_helper/spec_rest'

def load_yaml_file(path)
  YAML.load_file(File.dirname(__FILE__) + path)
end

CONFIG = load_yaml_file("/config/#{ENV['AMBIENTE']}.yaml")
STANDARD_DATA = load_yaml_file('/data/standard.yaml')

World(ApiCommons)
World(FactoryBot::Syntax::Methods)
