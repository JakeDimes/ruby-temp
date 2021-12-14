Rails.application.routes.draw do
  get 'ratings/new'

  get 'tasks/new'

  root 'home#index'

  get 'dashboard/admin' # renders the admin dashboard
  get 'dashboard/student' # renders the student dashboard

  get 'account', to: 'account#index' # accounts management index
  post 'account', to: "account#add_account" # adding an account
  delete 'account/delete/:id', to: "account#delete_account", as: 'account_delete'

  # admin is requesting to edit some account information
  get 'account/edit/:id', to: 'account#edit_account', as: 'account_edit'

  # admin saves edited account information
  put 'account/edit/:id', to: 'account#edit_save', as: 'account_edit_save'

  # routes for the teams controller follow
  get 'teams', to: 'teams#main'

  # user requests to create a new team
  get 'teams/new', to: 'teams#add_team'
  post 'teams/new', to: 'teams#save_team'
  post 'teams/new/num', to: 'teams#change_num'
  delete 'teams/delete/:id', to: 'teams#delete_team', as: 'teams_delete'

  # user requests to session
  get 'session/login', to: 'session#user_name_form'
  get 'session/password', to: 'session#password_form'
  get 'session/auth', to: 'session#create'
  put 'session/logout', to: 'session#destroy'

  get 'session/admin', to: 'session#create_admin_account'# route for when no admin account exists at log in
  post 'session/admin', to: 'session#save_admin_account'

  get 'userspace', to: 'userspace#index' # account management
  put 'userspace', to: 'userspace#update_password'

  get 'tasks', to: 'tasks#new'
  post 'tasks/new', to: 'tasks#create_task'
  delete 'tasks/new', to: 'tasks#delete_task'

  post 'ratings/new', to: 'ratings#create_rating'
  get 'ratings/display'
end
