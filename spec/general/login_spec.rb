describe 'Login' do
  before(:all) do
    visit(LoginPage)
  end

  context "valid criteria" do 
    let(:criteria) { [@login_email, @login_password] }

    it 'logs in with valid criteria and goes to settings page' do
      on(LoginPage).login_with(*criteria)
      on(NavigationPage).go_to_settings_page
      expect(on(SettingsPage).email_element.when_present.value).to eq @login_email
    end
  end
end
