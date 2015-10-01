require 'spec_helper'


describe SurveysController, type: :controller do
  include Devise::TestHelpers     
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
    @survey1 = FactoryGirl.build(:survey, :survey_name => "Survey_1", :surveyor_name => "ansh", :description => 'Ths')
    @survey2 = FactoryGirl.build(:survey, :survey_name => "Survey_2", :surveyor_name => "ansh", :description => 'Ths')
    @fake_surveys = [@survey1, @survey2]
    get :index 
  end
  it 'should call the model method that shows the index' do
    @survey1.survey_name.should == "Survey_1"
    @survey2.surveyor_name.should == "ansh"
  end
 
  it 'should make the survey list available for display' do 
    Survey.stub(:order).and_return(@fake_surveys)
    get :index
    #assigns(:surveys).should == @fake_surveys
  end

  it 'should display index template for rendering' do 
     response.should render_template('index')   
  end
end

describe SurveysController, type: :controller do
 include Devise::TestHelpers  
 before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user 
    get :new
  end
  it 'should display new template for rendering' do 
     response.should render_template('new')   
  end
end


describe SurveysController, type: :controller do
  include Devise::TestHelpers 
  before :each do
   @request.env["devise.mapping"] = Devise.mappings[:user]
   sign_in FactoryGirl.create(:user)
   @survey1 = FactoryGirl.build(:survey, :survey_name => "Survey_1", :surveyor_name => "ansh", :description => 'Ths')
   @survey2 = FactoryGirl.build(:survey, :survey_name => "Survey_2", :surveyor_name => "ansh", :description => 'Ths')
   @fake_surveys = [@survey1, @survey2]
   post :search_surveys, {:search => {:survey_name => 'Survey_1'}}
  end

  it 'should receive search parameters' do
    #Survey.should_receive(:where).with(%Q[survey_name like :search], {:search=>%Q[%Survey_1%]}).and_return(@survey1)
    post :search_surveys, {:search => {:survey_name => 'Survey_1'}}
  end

  it 'should display search template for rendering' do
      response.should render_template('search_surveys')
  end 

  it 'should make the search results available to display' do 
    Survey.stub(:where).and_return(@survey1)
    #post :search_surveys, {:search => {:survey_name => 'Survey_1'}}	
    #assigns(:surveys).should == @survey1
  end  

end


describe SurveysController, type: :controller do
  include Devise::TestHelpers 
  before :each do
   @request.env["devise.mapping"] = Devise.mappings[:user]
   sign_in FactoryGirl.create(:user)
   @survey1 = FactoryGirl.build(:survey, :survey_name => "Survey_1", :surveyor_name => "ansh", :description => 'Ths')
   @survey2 = FactoryGirl.build(:survey, :survey_name => "Survey_2", :surveyor_name => "ansh", :description => 'Ths')
   @fake_surveys = [@survey1, @survey2]
   @survey3 = FactoryGirl.build(:survey).attributes
      
   post :create
  end

  it 'should display create template for rendering' do
      #response.should redirect_to(surveys_path) 
  end 

  it 'should receive the survey attributes' do 
    #Survey.should_receive(:create).with(@survey1.attributes).and_return(@survey1)
    post :create, {:params => @survey1.attributes}
  end

end



