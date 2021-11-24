Rails.application.routes.draw do
  get 'dashboard/admin'
  get 'dashboard/student'
  post 'dashboard', to: "dashboard#add_account"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
