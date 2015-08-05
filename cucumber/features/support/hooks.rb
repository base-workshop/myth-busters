require 'watir-webdriver'

def load_config
  config_path = ENV["CONFIG_PATH"] || "../config/settings.yml"
  @config = YAML.load_file(config_path)
end

Before do
  @browser = Watir::Browser.new :firefox
  load_config
end

After do
  @browser.close
end
