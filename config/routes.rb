Rails.application.routes.draw do
  get 'messages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "messages#index"
  # 1/21 ルートパスへのアクセスがあったら、messages_controllerのindexアクションが呼び出されるようにする
  
end
