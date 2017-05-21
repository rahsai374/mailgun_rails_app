Rails.application.routes.draw do
 devise_for :users, controllers: {
        sessions: 'users/sessions',
        confirmations: 'users/confirmations'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome', to: "welcome#show"


  post '/process_mailgun_webhook', to: 'mailgun_webhook#process_mailgun_webhook'
end
