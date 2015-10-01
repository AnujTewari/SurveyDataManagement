require 'spec_helper'


describe ResponseGroupsController, type: :controller do 
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
    #sign_in :user, @user   # sign_in(scope, resource)
    #sign_in @user    
    #sign_in 
    #get :new
  end
  it 'should display new template for rendering' do 
     #response.should render_template('new')   
  end
end
