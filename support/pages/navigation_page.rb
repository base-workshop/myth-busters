class NavigationPage
  include PageObject

  link(:dashboard, :id => 'nav-dashboard')
  link(:leads, :id => 'nav-leads')
  link(:contacts, :id => 'nav-contacts')
  link(:sales, :id => 'nav-sales')
  link(:tasks, :id => 'nav-tasks')
  link(:comm_center, :id => 'nav-communication-center')
  link(:reports, :id => 'nav-reports')
  text_field(:global_search, :class => 'search-query icn-search-10-light-green')
  ul(:search_results, :class => "search-results")
  link(:trial, :css => '.trial-countdown ')
  link(:notifications_bell, :css => ".base-popover .visibility-toggle")
  link(:settings, :href => '#user-dd')
  link(:active_deals_view, :class => 'list-view')
  link(:deals_list_view, :class => 'stage-view')

  def go_to_settings_page(subpage=nil)
    settings_element.when_visible.click
    link_element(:href => "/settings/profile").when_visible.click
    link_element(:href => "/settings/#{subpage}").when_visible.click if subpage
  end

  def navigate_to_active_deals_view
    sales_element.click
    active_deals_view_element.when_visible(10).hover
    active_deals_view_element.click
  end

  def navigate_to_deals_list
    sales_element.click
    deals_list_view_element.when_visible(10).hover
    deals_list_view_element.click
  end

  def search_for_deal deal_name
    self.global_search_element.when_visible.value = deal_name
  end
end
