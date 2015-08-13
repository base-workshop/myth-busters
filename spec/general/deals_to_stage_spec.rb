# TODO: make all input data a variable

describe "Move Deals to Stage" do
  before(:all) do 
    visit(LoginPage)
    on(LoginPage).login_with(@login_email, @login_password)
    expect(on(DashboardPage).total_worth_element.when_present(15).visible?).to be_truthy
  end

  def go_to_deals_view
	on(NavigationPage).navigate_to_deals_list
    expect(on(DealsPage).deals_list_element.when_present.visible?).to be_truthy
  end

  it "goes to deals view" do
    go_to_deals_view
  end

  it "adds 10 deals" do
  	contact_name = "John Smith"
 	10.times do |i|
 		deal_name = "Deal #{i}" 
 		on(DealsPage).create_new_deal deal_name, contact_name
 		# how can we avoid this sleep?
 		sleep(2)
  		expect(on(DealsPage).find_deal_on_list_by_name(deal_name)[0]).to be_truthy
   	end
  end

  it "goes to deals view again" do 
    go_to_deals_view
  end

  # selecting deals by name is not always working because some deals are out of window
  it "selects two deals" do
  	deal_0 = on(DealsPage).select_deal_by_name "Deal 0"
  	deal_1 = @current_page.select_deal_by_name "Deal 1"
  	expect(deal_0.checked?).to be_truthy
  	expect(deal_1.checked?).to be_truthy
  end

  it "moves selected deals to next stage" do
  	on(DealsPage).move_to_stage_element.when_present.click
  	@current_page.stage_change_menu_element[1].when_visible.link_element.when_present.click
  	expect(on(DealsPage).alert_success_element.when_visible.visible?).to be_truthy
  end

  it "searches for a deal in global search field" do
  	deal_name = "Deal 1"
  	on(NavigationPage).search_for_deal deal_name
  	# how can we avoid this sleep?
  	sleep(2)
  	expect(on(NavigationPage).search_results_element[0].when_visible.text).to eql(deal_name)
  end
end

