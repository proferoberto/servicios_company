Rails.application.routes.draw do
  root 'sedes#index'
  resources :sedes do
    resources :empleados
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
