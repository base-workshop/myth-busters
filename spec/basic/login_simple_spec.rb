
describe 'LoginTest' do
  let(:criteria) { [@login_email, @login_password] }

  it 'logs in with valid criteria and goes to settings page' do
    login_to_autotest(*criteria)
    expect(on(DashboardPage).activity_element.when_visible.visible?).to be_truthy
  end
end
