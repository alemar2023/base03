Rails.application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    devise_for :users do
      collection do
        patch 'update_locale', on: :member
      end
    end
    resources :areas do
      resources :area_labels
    end
    root "pages#home"

    resources :brands

    get 'pages/home'

    get "up" => "rails/health#show", as: :rails_health_check

    # Defines the root path route ("/")

  end

  get 'cookies/create', as: 'set_cookie'
  get 'cookies/show', as: 'get_cookie'
end
