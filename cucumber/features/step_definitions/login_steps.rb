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
