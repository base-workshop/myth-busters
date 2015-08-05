describe "Deals" do
  before(:all) do 
    @browser.goto "https://core.futuresimple.com/users/login"
    @browser.text_field(id: "user_email").set @login_email
    @browser.text_field(id: "user_password").set @login_password
    @browser.button(class: "btn").click
  end

  it "checks dashboard page" do 
    @browser.link(id: 'nav-sales').when_present.click
    expect(@browser.link(:class => 'list-view').when_present.visible?).to be_truthy
  end
end
