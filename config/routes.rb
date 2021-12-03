Rails.application.routes.draw do
  root 'dashboard#home'
  get 'dashboard/home'
  get 'dashboard/admin'
  get 'dashboard/student'
  post 'dashboard', to: "dashboard#add_account"
  delete 'dashboard', to: "dashboard#delete_account"

  # admin is requesting to edit some account information
  get 'dashboard', to: 'dashboard#edit_account'

  # admin saves edited account information
  put 'dashboard', to: 'dashboard#edit_save'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
