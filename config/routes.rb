Expense::Application.routes.draw do

  root :to => 'welcome#main'

  devise_for :users

  # Resources
  resources :logs, shallow: true do
    resources :expenses
  end

end
