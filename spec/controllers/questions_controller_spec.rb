require 'spec_helper'


describe QuestionsController, type: :controller do 
  include Devise::TestHelpers 
  include FactoryGirl::Syntax::Methods
  before :each do
    #DatabaseCleaner.clean
     @request.env["devise.mapping"] = Devise.mappings[:user]
     @user = FactoryGirl.create(:user)
     sign_in @user  
    #get :new
  end
  it 'should display new template for rendering' do 
     #response.should render_template('new')   
  end
end

describe QuestionsController, type: :controller do 
 #fixtures :questions 
  include Devise::TestHelpers 
  include FactoryGirl::Syntax::Methods
  before :each do
     @request.env["devise.mapping"] = Devise.mappings[:user]
     @user = FactoryGirl.create(:user)
     sign_in @user 
    #@question1 = FactoryGirl.build(:survey_id => 1, :question => "First question")
    #@question2 = FactoryGirl.build(:survey_id => 2, :question => "Second Question")
    #@fake_questions = [@question1, @question2]
    #get :show, {:id => '1'}
  end
  it 'should display show template for rendering' do 
     #response.should render_template('show')   
  end
end

describe QuestionsController, type: :controller do
  include Devise::TestHelpers 
  include FactoryGirl::Syntax::Methods 
  before :each do
     @request.env["devise.mapping"] = Devise.mappings[:user]
     @user = FactoryGirl.create(:user)
     sign_in @user 
    #post :create, {:question => {:survey_id => '1'}}
  end 
  it 'should redirect to show template for rendering' do 
     #response.should redirect_to( question_path(1))   
  end
end

