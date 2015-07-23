module Automatix
  module Helper
    module Web

      def login_to_autotest(email=@login_email, password=@login_password)
        visit_page(LoginPage)
        on(LoginPage).login_with(email, password)
        on(DashboardPage).wait_until { @current_page.activity_element.visible? }
      end
    end
  end
end
