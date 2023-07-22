Rails.application.routes.draw do
  devise_for :users

   scope "(:locale)", locale: /#{I18n.available_locales.map(&:to_s).join("|")}/ do
     root to: "homes#top"
     get 'about' => 'homes#about'
      get 'articles/new'
      post 'articles' => 'articles#create'   #ここを追記します
      get 'articles/index' 
      get 'articles/show'
      get 'articles/edit'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
