Rails.application.routes.draw do
  devise_for :users

   scope "(:locale)", locale: /#{I18n.available_locales.map(&:to_s).join("|")}/ do
     root to: "homes#top"
     get 'about' => 'homes#about'
     resources :articles, only: [:new,:index,:show,:edit,:create,:update,:destroy]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
