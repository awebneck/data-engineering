module LsCodingChallenge
  module SpecHelpers
    module Feature
      def login(user=nil, password='password')
        user ||= FactoryGirl.create :user
        visit '/login'
        fill_in 'Email', :with => user.email
        fill_in 'Password', :with => password
        click_on 'Login'
      end
    end
  end
end
