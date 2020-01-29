Rails.application.routes.draw do
  devise_for :users
  # 1/28確認 ログイン・新規登録で必要なルーティングが生成
  # get 'messages/index
  # 上の行は削除する

  root "messages#index"
  # 1/21 ルートパスへのアクセスがあったら、messages_controllerのindexアクションが呼び出されるようにする

  root 'groups#index'
  # 1/29_グループ一覧を表示するビュー 左側のサイドバーだけが表示


  resources :users, only: [:edit, :update]
  # 1/28追記 ユーザー情報編集機能を実装

  # resources :groups, only: [:new, :create]
  # resources :groups, only: [:new, :create, :edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update]
  # 1/29 追記→修正_「グループ」の編集機能を実装。更に追記サイドバーにグループ一覧を表示

 



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  

end
