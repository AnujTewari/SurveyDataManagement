Rails.application.routes.draw do
  devise_for :users , :skip => :registrations
  resources :survey_users
  resources :manageusers 
  resources :surveys do
    resources :questions do
    end
    resources :response_groups, only: [:new, :create, :show] do
      post 'next_question'
      get 'prev_question'
      get 'summary'
      get 'submit_summary'
    end
    post 'questions_order'
    get 'get_survey_object'
    get 'results'
  end
  post '/surveys/search_surveys'
  root :to => redirect('/surveys')
end
