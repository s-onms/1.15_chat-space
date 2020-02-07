Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:index, :edit, :update] # 2/5_インクリメンタルサーチでindex追加
  resources :groups, only: [:index , :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
    namespace :api do # 2/5_抜けていたので追記
      resources :messages, only: [:index, :create]

      # 2/6_追記 namespace :ディレクトリ名 do ~ end
      namespace :api do
        resources :messages, only: :index, defaults: { format: 'json' }
      end

  end
end
end