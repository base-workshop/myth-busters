require 'spec_helper'

describe "caching" do
  before(:all) do
    login_to_autotest
    on(NavigationPage).navigate_to_deals_list
  end

  it "compares deal lists" do
    list_items = @current_page.unordered_list_element(css: ".list-container.deals-list.ui-sortable").when_visible.list_item_elements(css: ".item")
    expect(list_items.map(&:visible?)).to all(be_truthy)
  end
end
