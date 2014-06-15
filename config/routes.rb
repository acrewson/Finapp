Finapp::Application.routes.draw do

  root :to => 'welcome#main'

  devise_for :users, :controllers => { registrations: 'registrations' }

  # Helpful Devise links
    # On controllers: http://stackoverflow.com/questions/6234045/how-do-you-access-devise-controllers
    # On customizing: http://www.jacopretorius.net/2014/03/adding-custom-fields-to-your-devise-user-model-in-rails-4.html





  # Resources
  resources :logs do
    resources :expenses
  end

end
