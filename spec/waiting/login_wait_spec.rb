describe "Waiting situations" do
  before(:all) { visit(LoginPage) }
  after(:each) { logout }

  context "sleep for n seconds" do 
    let(:wait_time) { 10 }
    
    it "logs in" do 
      login_to_autotest
      sleep wait_time
      expect(@browser.div(css: '.feed-navigation').visible?).to be_truthy
      expect(@browser.div(css: '.s-pipeline-worth-container').visible?).to be_truthy
    end
  end

  context "wait explicitly" do 
    let(:wait_time) { 10 }

    it "logs in" do 
      login_to_autotest
      expect(@browser.div(css: '.feed-navigation').when_present(wait_time).visible?).to be_truthy
      expect(@browser.div(css: '.s-pipeline-worth-container').when_present(wait_time).visible?).to be_truthy
    end
  end
  
  context "wait implicitly" do 
    before(:all) { @browser.driver.manage.timeouts.implicit_wait = 10 }
    after(:all) { @browser.driver.manage.timeouts.implicit_wait = 0 }

    it "logs in" do 
      login_to_autotest
      expect(@browser.div(css: '.feed-navigation').visible?).to be_truthy
      expect(@browser.div(css: '.s-pipeline-worth-container').visible?).to be_truthy
    end
  end

  context "don't wait" do 
    it "logs in" do 
      login_to_autotest
      expect(@browser.div(css: '.feed-navigation').visible?).to be_truthy
      expect(@browser.div(css: '.s-pipeline-worth-container').visible?).to be_truthy
    end
  end
end
