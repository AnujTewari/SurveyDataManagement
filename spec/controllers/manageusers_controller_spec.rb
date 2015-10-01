require 'spec_helper'


describe ManageusersController, type: :controller do 
  include Devise::TestHelpers 
  include FactoryGirl::Syntax::Methods
  before :each do
     #DatabaseCleaner.clean  
     @request.env["devise.mapping"] = Devise.mappings[:user]
     @user = FactoryGirl.create(:user)
     sign_in @user
  end
  it "returns http success" do
     get :index
     expect(response).to have_http_status(:success)
  end

   it "renders template index" do
     get :index
     expect(response).to render_template(:index)
   end
end
