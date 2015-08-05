class DashboardPage
  include PageObject

  page_url "https://app.futuresimple.com/sales"

  div(:activity, :css => '.feed-navigation')
  div(:total_worth, css: '.span12.stat.s-pipeline-worth-container')
end
