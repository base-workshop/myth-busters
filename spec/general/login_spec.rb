describe 'Login' do
  describe do
    it 'goes to login page' do
      visit(LoginPage)
    end

    it 'logs in' do
      on(LoginPage).login_with(@login_email, @login_password)
      on(DashboardPage).activity_element.when_visible(20)
    end

    it 'goes to settings page' do
      on(NavigationPage).go_to_settings_page
      expect(on(SettingsPage).email_element.when_visible.value).to eq @login_email
    end
  end
end
