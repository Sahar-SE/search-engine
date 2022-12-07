Rails.application.routes.draw do
  root "pages#search"
  get "search", to: "pages#search", as: :search
  post "enable_analytics", to: "analytics#enable", as: :enable_analytics
  get  "analytics", to: "analytics#index"
  get  "history", to: "pages#history"
end
