describe "Deals" do
  before(:all) do 
    visit(LoginPage)
    on(LoginPage).login_with(@login_email, @login_password)
  end

  it "checks deals page" do 
    on(NavigationPage).sales_element.when_present.click
    expect(on(DealsPage).active_deals_view_element.when_present.visible?).to be_truthy
  end
end
