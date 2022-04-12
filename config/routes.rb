Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # devise機能
  devise_for :admins, skip: [:registrations, :passwords], controllers: {sessions: "admin/sessions"}
  devise_for :members, skip: [:passwords], controllers: {registrations: "public/registrations", sessions: 'public/sessions'}


  # top.aboutページ
  root "public/homes#top"
  get "/about" => "public/homes#about"

  # public投稿関係
  namespace :public do
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end


end