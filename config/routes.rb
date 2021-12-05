Rails.application.routes.draw do
  get 'ratings/new'
  get 'tasks/new'
  root 'home#index'


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

  # user requests to session
  get 'session/username', to: 'session#user_name_form'
  get 'session/password', to: 'session#password_form'
  get 'session/auth', to: 'session#create'
  get 'session/setpassword', to: 'session#update_password'
  put 'session/setpassword', to: 'session#confirm_password'

  get 'session/admin', to: 'session#create_admin_account'# route for when no admin account exists at log in
  post 'session/admin', to: 'session#save_admin_account'


end
