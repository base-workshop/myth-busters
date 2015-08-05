Given(/^An user with password$/) do
  @login_email = @config['email']
  @login_password = @config['password']
end

When(/^I provide valid credentials$/) do
  visit(LoginPage)
  on(LoginPage).login_with(@login_email, @login_password)
end

Then(/^I should be able to login$/) do
  expect(@browser.url).to eq on(DashboardPage).page_url_value
end

When(/^I go to settings page$/) do
  on(NavigationPage).go_to_settings_page
end

Then(/^I should see my email in settings$/) do
  expect(on(SettingsPage).email_element.when_visible.value).to eq @login_email
end
