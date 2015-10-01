# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the surveys home\s?page$/
      '/surveys'
    when /^the Create New Survey page/
      '/surveys/new'
    when /^the Questions page for (.*)$/
      @survey =  Survey.where(survey_name: $1).first
      survey_questions_path(@survey.id)
    when /^the New Questions page for (.*)$/
      @survey =  Survey.where(survey_name: $1).first
      new_survey_question_path(@survey.id)
    when /^the Response page for (.*)$/
      @survey =  Survey.where(survey_name: $1).first
      new_survey_response_group_path(@survey)#.id)
    when /^the alloted surveys page for (.*)$/
      @user = User.where(email: $1).first
      survey_user_path(@user)
    when /^the Summary page for (.*)$/
      @survey =  Survey.where(survey_name: $1).first
      
    when /^the search results page/
      '/surveys/search_surveys' 
    when /^the Manage Users page/
      '/manageusers'
    when /^the Create New User page/
      '/manageusers/new'
    when /^the Survey Users Page/
      '/survey_users'
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
