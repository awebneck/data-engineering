require 'rails_helper'

describe UserSession do
  # somewhat tacky, would rather have used the cleaner
  #   it { should be_a Authlogic::Session::Base }
  # syntax, but authlogic throws a fit if you instantiate
  # its session object without a controller doing its magic
  # mustard.
  it 'should be a subclass of Authlogic::Session::Base' do
    expect(UserSession.ancestors).to include Authlogic::Session::Base
  end
end
