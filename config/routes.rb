Rails.application.routes.draw do
  resources :type_of_activities
  resources :projects
  resources :collegials
  resources :type_of_movements
  resources :decisions
  resources :financial_indicators
  resources :indicator_values
  resources :inflows_outflows
  resources :type_of_decisions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
