Feature: Login
  Scenario: Successful login
  Given An user with password
  When  I provide valid credentials
  Then  I should be able to login
  When  I go to settings page
  Then  I should see my email in settings


