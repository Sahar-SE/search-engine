Rails.application.routes.draw do
  root "pages#search"
  get "movies/:id", to: "pages#show", as: :movie
  resources :movies, only: [:show]
  get "search", to: "pages#search", as: :search
  post "enable_analytics", to: "analytics#enable", as: :enable_analytics
  get  "analytics", to: "analytics#index"
  get  "history", to: "pages#history"
  get  "trend", to: "pages#trend"
  post  "sign_in", to: "users#sign_in"
  post  "sign_up", to: "users#sign_up"
  get   "sign_up", to: "pages#sign_up"
  get   "sign_in", to: "pages#sign_in"
  get "sign_out", to: "users#sign_out"
  get "delete_account", to: "users#delete_account"
  get "clear_history", to: "users#clear_user_history"

end
