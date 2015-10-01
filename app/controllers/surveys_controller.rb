require 'csv'

class SurveysController < ApplicationController
  def index
    if current_user.admin != 0
      @surveys = Survey.order(created_at: :desc) 
    else
      @surveys = []
      @alloted = SurveyUser.where(userid: current_user.id)
      if @alloted != nil
        @alloted.each do |alloted|
          @surveys.push Survey.where(id: alloted.surveyid).first
       end
      end
    end
  end

  def new
    # default: render ’new’ template
  end

  def create   
    #@survey = Survey.create!(params[:survey])
    @survey = Survey.new(params[:survey])
    if @survey.save 
     flash[:notice] = "#{@survey.survey_name} was successfully created."
     redirect_to surveys_path
    else
     flash[:notice] = "Error: #{@survey.errors.full_messages}"
     render 'new'
     #session[:survey] = params[:survey]
     #redirect_to :action => 'new' #new_survey_path(survey: params[:survey])
    end  
  end

  def search_surveys
    search_term = params[:search][:survey_name].downcase
    @surveys = Survey.where("LOWER(survey_name) like :search", search: "%"+search_term+"%")
    if @surveys.empty?
      flash[:notice] = "Error: No matching survey found!!"
    end
  end

  def results    
    respond_to do |format|
      @survey = Survey.find(params[:survey_id])
      format.html     
      format.csv {send_data to_csv(params[:survey_id]), :filename => @survey.survey_name+' Results '+Time.new.strftime("%m-%d-%Y %H:%M:%S")+".csv"}
    end    
  end

  def questions_order
    survey = Survey.find(params[:survey_id])
    if !params[:question][:questions_order].empty?
      survey.update(questions_order: params[:question][:questions_order])
    end
    redirect_to survey_questions_path(survey)
  end

  def get_survey_object
    survey = Survey.find(params[:survey_id])
    @questions = Question.where(:survey_id => params[:survey_id	])
    respond_to do |format|
      format.html {render :nothing => true}
      format.json {render :json => @questions}
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    @users = SurveyUser.where(surveyid: params[:id])
    @users.each do |user|
     user.destroy
    end
    flash[:notice] = "Survey ’#{@survey.survey_name}’ deleted."
    redirect_to surveys_path
  end

  def to_csv(survey_id)
    CSV.generate do |csv|
      csv_headers = []
      questions = Question.where(:survey_id => survey_id)
      questions.each do |question|
        csv_headers << question.question
      end
      csv << csv_headers ## Header values of CSV
      response_groups = ResponseGroup.where(:survey_id => survey_id)
      response_groups.each do |response_group|
        responses = Response.where(:response_group => response_group.id)
        answers_list = []
        responses.each do |response|
          answers_list << response.answer_text
        end
        csv << answers_list
      end
    end
  end
end
