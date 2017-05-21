Rails.application.routes.draw do
 devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#show"


  post '/process_mailgun_webhook', to: 'mailgun_webhook#process_mailgun_webhook'
end
