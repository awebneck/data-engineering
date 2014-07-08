require 'spec_helper'

describe UserSessionController do
  it 'should route GET /login to user_session#new' do
    expect(get: '/login').to route_to :controller => 'user_session', :action => 'new'
  end

  it 'should route POST /login to user_session#create' do
    expect(post: '/login').to route_to :controller => 'user_session', :action => 'create'
  end

  it 'should route DELETE /logout to user_session#destroy' do
    expect(delete: '/logout').to route_to :controller => 'user_session', :action => 'destroy'
  end
end
