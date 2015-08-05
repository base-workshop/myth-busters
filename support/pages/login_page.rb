class LoginPage
  include PageObject

  page_url "https://core.futuresimple.com/users/login"

  text_field(:email, :id => 'user_email')
  text_field(:password, :id => 'user_password')
  button(:login, :css => '.btn')

  div(:alert, css: '.alert.alert-error')

  def login_with(email, password)
    self.email = email
    self.password = password
    login
  end
end
