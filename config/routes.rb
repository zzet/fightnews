Fightnews::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  scope module: :web do
    root to: "welcome#index"

    get :sign_in, controller: :session, action: :show

    resources :pages, only: [] do
      collection do
        get :about
        get :contacts
        get :faq
        get :help
      end
    end

    resource :search, only: [:show]

    resources :news, only: [:index, :show]
    resources :interviews, only: [:index, :show]
    resources :articles, only: [:index, :show]
    resources :biographies, only: [:index, :show]
    resources :videos, only: [:index, :show]
    resources :photos, only: [:index, :show]

    namespace :admin do
      root to: "welcome#index"

      resources :news
      resources :interviews
      resources :articles
      resources :biographies
      resources :videos
      resources :posts
      resources :categories
      resources :tags
      resources :users
    end
  end
  #  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #resources :users, :only => [:index, :destroy]
  #  root :to => 'users#index'
end
