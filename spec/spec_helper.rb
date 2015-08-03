require 'rubygems'
require 'faker'
require 'pry'
require 'pry-nav'
require 'watir'
require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'require_all'
require 'colored'
require 'active_support/time'

require_rel 'support'

RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.include Automatix::Helper::Web

  config.before(:all) do
    ENV['BROWSER'] ||= "chrome"
    @browser_res_x = 1366
    @browser_res_y = 768

    case ENV['BROWSER']
    when 'firefox'
      @browser = Watir::Browser.new :firefox
    when 'chrome'
      @browser = Watir::Browser.new :chrome, :switches => %w[--test-type]
    else
      raise "Unsupported browser: " + ENV['BROWSER']
    end

    @browser.window.resize_to(@browser_res_x, @browser_res_y)
    config_path = ENV["CONFIG_PATH"] || "config/settings.yml"
    @config = YAML.load_file(config_path)
    @login_email = @config['email']
    @login_password = @config['password']
  end

  config.after(:all) do
    @browser.close unless @browser.nil?
  end
end
