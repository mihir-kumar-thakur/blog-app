Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, controllers: {
        sessions: "api/v1/sessions",
        registrations: "api/v1/registrations"
      }

      resources :posts do
        post :like, to: "likes#like_on_post"
        resources :comments do
          post :like, to: "likes#like_on_comment"
        end
      end
    end
  end
end
