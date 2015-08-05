class SettingsPage
  include PageObject

  page_url "https://core.futuresimple.com/settings/profile"

  text_field(:name, :id => 'profileName')
  text_field(:email, :id => 'profileEmail')
  text_field(:password, :id => 'profilePassword')
  button(:login, :css => '.btn')
end
