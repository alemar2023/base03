Rails.application.routes.draw do

  devise_for :users , :path_prefix => 'd'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    #devise_for :users
    resources :areas do
      resources :area_labels
    end

    get 'users/:id' => 'users#show', as: :user_show
    root "pages#home", to: redirect("/#{I18n.locale}")
    resources :brands
    resources :users

    get 'pages/home'
    get 'pages/accounts', as: 'accounts'
    get 'pages/user_info', as: 'user_info'
    get 'pages/user_security', as: 'user_security'
    get 'pages/user_addresses', as: 'user_addresses'
    get 'pages/user_orders', as: 'user_orders'
    get 'pages/user_support', as: 'user_support'
    get 'pages/user_wishlist', as: 'user_wishlist'

    get "up" => "rails/health#show", as: :rails_health_check


    # Defines the root path route ("/")

  end

  get 'cookies/create', as: 'set_cookie'
  get 'cookies/show', as: 'get_cookie'
end
