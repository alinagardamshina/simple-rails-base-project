module Devise
  module Confirmations
    class New < SitePrism::Page
      set_url '/users/confirmation/new'

      def submit_form(email)
        fill_in 'user_email', with: email

        click_button 'Resend confirmation instructions'
      end
    end
  end
end
