describe 'Login' do
  before(:all) do
    @browser.goto "https://core.futuresimple.com/users/login"
  end

  context "valid email" do
    let(:email) { @login_email }
    let(:password) { @login_password }

    it 'logs in with valid criteria and goes to settings page' do
      @browser.text_field(id: "user_email").set email
      @browser.text_field(id: "user_password").set password
      @browser.button(css: ".btn").click
      @browser.link(href: '#user-dd').when_present.click
      @browser.link(href: '/settings/profile').click
      expect(@browser.text_field(id: 'profileEmail').when_present.value).to eq @login_email
    end
  end
end
