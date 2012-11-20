Request::Application.routes.draw do
  resources :projects do
    resources :issues
  end

  root :to => 'projects#index'
end
