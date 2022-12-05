Rails.application.routes.draw do
  root "pages#search"
  get "search", to: "pages#search", as: :search
  post "sign_up", to: "pages#sign_up", as: :sign_up
  post "sign_in", to: "pages#sign_in", as: :sign_in
  post "enable_analytics", to: "analytics#enable", as: :enable_analytics
end
