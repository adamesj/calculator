Rails.application.routes.draw do
  root 'maths#index'
  get '/maths/index', to: 'maths#index'
  get '/calculate', to: 'maths#calculate'
  get '/calculate_poorly', to: 'maths#calculate_poorly'
end
