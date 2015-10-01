class ResponseGroupsController < ApplicationController
  @@questions_counter = 0
  @@questions_order = []
  @@response_group
  @@responses = {}
  @dependency_list = []

  def new
    @@questions_counter = 0
    @@questions_order = []
    @@responses = {}
    @survey = Survey.find(params[:survey_id])
    questions_order = @survey.questions_order
    if questions_order == "" || questions_order == nil
      flash[:notice] = "The survey does not have any questions."
      redirect_to surveys_path
    else
      questions_order.split(/,+/).each do |order|
        @@questions_order << order
      end
      @questions = Question.where(survey_id: params[:survey_id])
      @current_question = Question.find(@@questions_order[@@questions_counter])
      redirect_to survey_response_group_path(params[:survey_id], @current_question)   
    end
  end

  def show
    @survey = Survey.find(params[:survey_id])   
    @questions = Question.where(survey_id: params[:survey_id])
    @current_question = Question.find(@@questions_order[@@questions_counter])
  end

  def next_question
    if !params.has_key?(:response)
      flash[:notice] = "Error: Please enter a response"
      Rails.logger.debug("New counter: #{@@questions_counter.inspect}")
      Rails.logger.debug("Next question id: #{@@questions_order[@@questions_counter].inspect}")
      @current_question = Question.find(@@questions_order[@@questions_counter])
      Rails.logger.debug("New question: #{@current_question.inspect}")
      redirect_to survey_response_group_path(params[:survey_id], @current_question)
      return
    end 

    params[:response].each do |key, value|
      @@responses[key] = value
    end
    @@questions_counter = @@questions_counter + 1
    
    while @@questions_counter < @@questions_order.length
      Rails.logger.debug("Responses: #{@@responses.inspect}")
      Rails.logger.debug("Next question id: #{@@questions_order[@@questions_counter].inspect}")
      @current_question = Question.find(@@questions_order[@@questions_counter])
      @dependency_list = []
      if(@current_question.dependency != "" && @current_question.dependency != nil)
        @current_question.dependency.split(/\s*,+\s*/).each do |dep|
          @dependency_list << dep.downcase
        end
        flag = false
        for i in 0..@dependency_list.length - 1
          if i % 2 != 0
             next
          end 
          if @dependency_list[i+1] == @@responses[@dependency_list[i]].downcase ||@current_question.dependency == nil ||@current_question.dependency == ''
            flag = true
            break
          end
        end
      end
      if @current_question.dependency == nil || @current_question.dependency == ''
        flag = true
      end

      if flag
	 redirect_to survey_response_group_path(params[:survey_id], @current_question)
         break;
      else 
         @@questions_counter = @@questions_counter + 1         
      end     
    end
    if @@questions_counter >= @@questions_order.length
       redirect_to survey_response_group_summary_path(params[:survey_id], 999)
    end
  end

  def prev_question    
    Rails.logger.debug("New counter: #{@@questions_counter.inspect}")
    if @@questions_counter > 0
      @@questions_counter = @@questions_counter - 1
      Rails.logger.debug("New question id: #{@@questions_order[@@questions_counter].inspect}")
      @current_question = Question.find(@@questions_order[@@questions_counter])
      Rails.logger.debug("New question: #{@current_question.inspect}")
      redirect_to survey_response_group_path(params[:survey_id], @current_question)
    else
      redirect_to surveys_path(params[:survey_id])
    end
  end

  def summary
    @response_values = @@responses
    @questions = Question.where(survey_id: params[:survey_id])
  end

  def submit_summary
    @survey = Survey.find(params[:survey_id]) 
    @response_group = ResponseGroup.create!(:survey_id => params[:survey_id])
    @@responses.each do |key, value|
      @response = Response.create!(:response_group => @response_group.id, :question_id => key, :answer_text => value)      
    end
    flash[:notice] = "Response for the survey \'#{@survey.survey_name}\' has been submitted."
    redirect_to surveys_path(params[:survey_id])
  end

  def create
    @response_group = ResponseGroup.create!(:survey_id => params[:survey_id])
    @@responses.each do |key, value|
      @response = Response.create!(:response_group => @response_group.id, :question_id => key, :answer_text => value)      
    end
    redirect_to surveys_path(params[:survey_id])
  end
end
