Rails.application.routes.draw do
  devise_for :users

  # 1/28確認 ログイン・新規登録で必要なルーティングが生成
  # get 'messages/index
  # 上の行は削除する

  root "messages#index"
  resources :users, only: [:edit, :update]
  # 1/28追記 ユーザー情報編集機能を実装

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "messages#index"
  # 1/21 ルートパスへのアクセスがあったら、messages_controllerのindexアクションが呼び出されるようにする
  

end
