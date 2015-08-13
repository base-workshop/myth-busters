class DealsPage
  include PageObject

  @@count = 0

  page_url "https://core.futuresimple.com/sales/deals"
  
  link(:active_deals_view, :class => 'list-view')
  text_field(:deals_filter, css: ".term-filter > .input")
  link(:create_deal, :id => 'add-deal')
  text_field(:deal_name, :id => 'deal_name')
  text_field(:contact_name, :class => 'span12')
  link(:contact, :class => 'with-icon bg-contact-10-light-gray')
  text_field(:value, :id => 'deal_scope')
  button(:add_deal, :class => 'btn btn-primary btn-large')
  unordered_list(:deals_list, :class => 'deals-list')
  # can we use it in find_deal_on_list_by_name method?
  # link(:deal_name_link, :class => 'name-link')
  button(:move_to_stage, :id => 'deals-move-to-stage')
  unordered_list(:stage_change_menu, :id => 'stage_change_menu')
  paragraph(:alert_success, :class => 'alert-success')

  def create_new_deal deal_name, contact_name
	self.create_deal_element.when_present.click
  	self.deal_name_element.when_present.value = deal_name
  	self.contact_name_element.when_present.value = contact_name
  	# how can we avoid this sleep?
  	sleep(2)
	self.contact_element.click
  	self.value_element.value = rand(1..2000)
  	self.add_deal_element.click
  	deal_name
  end

  # I could not found a solution to get a list of elements from unordered list so I came up with mine
  # Useful implementation:
  # https://www.omniref.com/ruby/gems/page-object/0.2.1/symbols/PageObject::Platforms::Watir::UnorderedList
  def find_deal_on_list_by_name deal_name
  	deal_found = false
  	list_size = self.deals_list_element.when_visible.items

  	list_size.times do |i|
  		if self.deals_list_element[i].when_visible.link_element(:class => 'name-link').when_visible.text.eql? deal_name
  			deal_found = true
  			return deal_found, self.deals_list_element[i]
  		end
  	end

  	# is this solution elegant enough? is it in the right place?
	if not deal_found
		raise Exception, "Deal '#{deal_name}' cannot be found on deals list."
	end
  end

  def select_deal_by_name deal_name
  	found, deal = self.find_deal_on_list_by_name deal_name
  	# can div_element(:class => 'select') be replaced with predefined element in DealsPage?
  	deal.when_present.div_element(:class => 'select').when_visible.hover
  	deal.when_present.div_element(:class => 'select').when_visible.checkbox_element.when_visible.check
  	return deal.when_present.div_element(:class => 'select').checkbox_element
  end
end