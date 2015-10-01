class QuestionsController < ApplicationController

  def index
    @questions = Question.where(:survey_id => params[:survey_id])
    @survey = Survey.find(params[:survey_id])
  end  

  def new
    # default: render ’new’ template
  end

  def create
    params[:question][:survey_id] = params[:survey_id]
    #params[:question][:response_type] = Question.response_types[params[:question][:response_type]]/
    @question = Question.new(params[:question])
    if @question.save
      @survey = Survey.find(params[:survey_id])
      Rails.logger.debug("Survey Order: #{@survey.inspect}")
      if @survey.questions_order == "" || @survey.questions_order == nil
        @survey.update(questions_order: @question.id.to_s)
      else
        order = @survey.questions_order + "," + @question.id.to_s
        @survey.update(questions_order: order)
      end
      flash[:notice] = "#{@question.question} was successfully created."
      redirect_to survey_questions_path
    else
      flash[:notice] = "Error: #{@question.errors.full_messages}"
      render 'new'
    end
  end

  def show

  end

  def destroy
    @survey = Survey.find(params[:survey_id])
    questions_order = @survey.questions_order
    list = []
    questions_order.split(/,+/).each do |order|
      list << order
    end
    list.delete(params[:id])
    new_questions_order = ""
    list.each do |item|      
      new_questions_order = new_questions_order + item + ","
    end
    new_questions_order = new_questions_order[0, new_questions_order.length-1]
    @survey.update(questions_order: new_questions_order)
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question ’#{@question.question}’ deleted."
    redirect_to survey_questions_path(@question.survey_id)
  end
end

