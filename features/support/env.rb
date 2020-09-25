require 'selenium-webdriver'
require 'rspec'
require 'httparty'
require 'capybara'
require "rubygems"
require 'capybara/dsl'
require 'site_prism'
require 'pry'
require 'capybara/cucumber'
require 'report_builder'
require 'capybara/poltergeist'
require 'without_accents'
require 'net/sftp'
require 'rspec/retry'
require 'faker'
require 'cpf_faker'
require 'cpf_utils'

Dir[File.join(File.dirname(__FILE__), 'commons/*.rb')].sort.each { |file| require file }

STANDARD_DATA = YAML.load_file("#{File.dirname(__FILE__)}/data/data.yaml")

def load_yaml_file(path)
  YAML.load_file(File.dirname(__FILE__) + path)
end

SITE_CONFIG = load_yaml_file('/config/config.yaml')
SITE_DATA = load_yaml_file('/data/data.yaml')

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = binding.eval('SITE_CONFIG') ['urls']['site']
  config.default_max_wait_time = 10
end

I18n.load_path << "#{File.dirname(__FILE__)}/locale/pt-BR.yml"
I18n.default_locale = :"pt-BR"
