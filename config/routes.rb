Finapp::Application.routes.draw do

  root :to => 'welcome#main'

  devise_for :users
  # Helpful Devise links
    # On controllers: http://stackoverflow.com/questions/6234045/how-do-you-access-devise-controllers





  # Resources
  resources :logs do
    resources :expenses
  end

end
