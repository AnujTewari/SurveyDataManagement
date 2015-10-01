class SurveyUsersController < ApplicationController

  def index
    @users = User.all
  end 

  def show
    @user = User.find(params[:id])
    @surveyuser = SurveyUser.where(userid: params[:id])
    @choices = Survey.all
    if @surveyuser != nil
      @surveyuser.each do |surveyuser|
        @choices = @choices - Survey.where(id: surveyuser.surveyid)
      end
    end
    #@choices = Survey.all - @surveys
    @namechoices = []
    @choices.each do |choice|
      @namechoices.push (choice.id.to_s + ','+choice.survey_name)
    end
  end

  def create
    @userid = params[:userid].to_i
    @email = User.find(@userid).email
    @surveyid = params[:suser][:surveyid].split(',').first.to_i
    @survey_name = Survey.find(@surveyid).survey_name
    @entry = SurveyUser.create(:userid => @userid, :surveyid => @surveyid, :email => @email, :survey_name => @survey_name)
    if @entry.save
      flash[:notice] = "Successfully Added."
    end 
    redirect_to survey_user_path(User.find(@userid))
  end

  def destroy
    @suser = SurveyUser.find(params[:id])
    @suser.destroy
    redirect_to survey_user_path(User.find(@suser.userid))
  end

end
