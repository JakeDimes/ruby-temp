Rails.application.routes.draw do
  get 'tasks/new'
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

  # routes for the teams controller follow
  get 'dashboard/admin/teams', to: 'teams#main'

  # user requests to create a new team
  get 'dashboard/admin/teams/new', to: 'teams#add_team'
  post 'dashboard/admin/teams/new', to: 'teams#save_team'
  delete 'dashboard/admin/teams', to: 'teams#delete_team'


end
