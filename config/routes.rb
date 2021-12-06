Rails.application.routes.draw do
  get 'ratings/new'

  get 'tasks/new'

  root 'home#index'


  get 'dashboard/admin'
  get 'dashboard/student'

  get 'account', to: 'account#index' # accounts management index
  post 'account', to: "account#add_account" # adding an account
  delete 'account', to: "account#delete_account"

  # admin is requesting to edit some account information
  get 'account/edit', to: 'account#edit_account'

  # admin saves edited account information
  put 'account/edit', to: 'account#edit_save'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # routes for the teams controller follow
  get 'teams', to: 'teams#main'

  # user requests to create a new team
  get 'teams/new', to: 'teams#add_team'
  post 'teams/new', to: 'teams#save_team'
  delete 'teams', to: 'teams#delete_team'

  # user requests to session
  get 'session/login', to: 'session#user_name_form'
  get 'session/password', to: 'session#password_form'
  get 'session/auth', to: 'session#create'
  get 'session/setpassword', to: 'session#update_password'
  put 'session/setpassword', to: 'session#confirm_password'
  put 'session/logout', to: 'session#destroy'

  get 'session/admin', to: 'session#create_admin_account'# route for when no admin account exists at log in
  post 'session/admin', to: 'session#save_admin_account'

  get 'userspace', to: 'userspace#index' # account management

  get 'tasks', to: 'tasks#new'
  post 'tasks/new', to: 'tasks#create_task'
  delete 'tasks/new', to: 'tasks#delete_task'

  post 'ratings/new', to: 'ratings#create_rating'
end
