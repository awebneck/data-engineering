require 'spec_helper'

describe DataController do
  it 'should route GET /data/new to data#new' do
    expect(get: '/data/new').to route_to :controller => 'data', :action => 'new'
  end

  it 'should route POST /data to data#create' do
    expect(post: '/data').to route_to :controller => 'data', :action => 'create'
  end
end
