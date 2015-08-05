require 'spec_helper'

describe 'Benchmark' do
  before(:all) do 
    login_to_autotest
    visit(DashboardPage)
  end
  
  context 'div' do
    let(:tag) { :div }
    let(:repeats) { 500 }

    let(:css_long) { { css: "div.row-fluid.total-pipeline-worth" } }
    let(:css_short) { { css: ".total-pipeline-worth" } }
    let(:id) { { id: "total-pipeline-worth" } }
    let(:xpath_css) { { xpath: "//div[@class='row-fluid total-pipeline-worth']" } }
    let(:xpath_id) { { xpath: "//*[@id='total-pipeline-worth']" } }
    let(:xpath_ugly) { { xpath: "//*[@id='container']/div[2]/div[1]/div[1]/div[1]" } }

    it "" do
      benchmark(tag, css_long, repeats)
      benchmark(tag, css_short, repeats)
      benchmark(tag, id, repeats)
      benchmark(tag, xpath_css, repeats)
      benchmark(tag, xpath_id, repeats)
      benchmark(tag, xpath_ugly, repeats)
    end
  end

  context "h6" do
    let(:repeats) { 500 }
    let(:tag) { :h6 }
    
    let(:css) { {css: ".total-pipeline-worth > h6"} }
    let(:regexp) { {text: /TOTAL PIPELINE WORTH/ } }
    let(:text) { {text: "Total Pipeline Worth" } }

    it "" do
      benchmark(tag, css, repeats)
      benchmark(tag, regexp, repeats)
      benchmark(tag, text, repeats)
    end
  end
end

def benchmark(type, selector, repeats)
  t1 = Time.now
  repeats.times { @current_page.element(type, selector).visible? }
  puts "For #{repeats}x #{selector} - #{Time.now - t1} seconds"
end
