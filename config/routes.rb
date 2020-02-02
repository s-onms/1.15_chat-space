Rails.application.routes.draw do
  devise_for :users
  # 1/28確認 ログイン・新規登録で必要なルーティングが生成
  # get 'messages/index
  # 上の行は削除する

  # root "messages#index"
  # 1/21 ルートパスへのアクセスがあったら、messages_controllerのindexアクションが呼び出されるようにする

  root 'groups#index'
  # 1/29_グループ一覧を表示するビュー 左側のサイドバーだけが表示


  resources :users, only: [:edit, :update]
  # 1/28追記 ユーザー情報編集機能を実装

  # resources :groups, only: [:new, :create]
  # resources :groups, only: [:new, :create, :edit, :update]
  # resources :groups, only: [:index, :new, :create, :edit, :update]
  # 1/29 追記→修正_「グループ」の編集機能を実装。更に追記サイドバーにグループ一覧を表示
  resources :groups, only: [:new, :create, :edit, :update] do
   resources :messages, only: [:index, :create]
   # 1/30_4度目の修正
   # 投稿されたメッセージの一覧表示 & メッセージの入力ができる:index
   # メッセージの保存を行う:create
  end

  resources :groups, only: [:new, :create, :edit, :update] do
   # ？なぜ↑のindexが要らなくなったのか？
   resources :messages, only: [:index, :create]
   # 1/31 追記 送信機能実装 
   # 投稿されたメッセージの一覧表示 & メッセージの入力ができる:index
   # メッセージの保存を行う:create
 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  

end
