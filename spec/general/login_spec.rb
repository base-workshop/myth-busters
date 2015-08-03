describe 'Login' do
  before(:all) do
    visit(LoginPage)
  end

  it 'logs in with valid criteria and goes to settings page' do
    on(LoginPage).login_with(@login_email, @login_password)
    on(NavigationPage).go_to_settings_page
    expect(on(SettingsPage).email_element.when_visible.value).to eq @login_email
  end
end
