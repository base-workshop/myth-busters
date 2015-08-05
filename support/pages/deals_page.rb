class DealsPage
  include PageObject

  page_url "https://core.futuresimple.com/sales/deals"
  
  link(:active_deals_view, :class => 'list-view')
  text_field(:deals_filter, css: ".term-filter > .input")
end
