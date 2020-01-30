class Group < ApplicationRecord
  has_many :group_users
  has_many :messages
  # 1/30_アソシエーションを設定 gruoupからはメッセージ多数ですよって事

  has_many :users, through: :group_users
   # 1/28_has_many :through関連付け多対多」を使用する時によく使われる記述
   # 1/28_アソシエーションを設定することでgroupsテーブルとusersテーブルを関連付ける（group側から記載 user側からの記載とセット 恐らく）
   # 1/28_has_manyの引数に「アソシエーションを組みたいテーブル名」:throughのバリューに「中間テーブル名」を指定
   
  validates :name, presence: true, uniqueness: true
  def show_last_message
   if (last_message = messages.last).present?
     if last_message.content?
       last_message.content
     else
       '画像が投稿されています'
     end
   else
     'まだメッセージはありません。'
   end
 end
 # 1/30_11行目から追記
 # サイドバーのグループ部分に最新のメッセージが表示
 # show_last_messageメソッドでは、メッセージが投稿されている場合、されていない場合で処理を分けている
 # メッセージがないときは「まだメッセージはありません。」と表示
end
