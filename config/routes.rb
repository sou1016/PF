Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # devise機能
  devise_for :admins, skip: [:registrations, :passwords], controllers: {sessions: "admin/sessions"}
  devise_for :members, skip: [:passwords], controllers: {registrations: "public/registrations", sessions: 'public/sessions'}


  # top.aboutページ
  root "public/homes#top"
  get "/about" => "public/homes#about"

  # 会員
  namespace :public do
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]

    end
    resources :members, only: [:index, :show, :edit, :update]
  end

  # 管理者
  namespace :admin do
    resources :posts, only: [:index, :show]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end


end