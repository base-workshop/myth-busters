Feature: Login
  Scenario: Successful login
  Given An user with password
  When  I provide valid credentials
  Then  I should be able to login
