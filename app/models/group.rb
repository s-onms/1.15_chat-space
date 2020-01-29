class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
   # 1/28_has_many :through関連付け多対多」を使用する時によく使われる記述
   # 
  validates :name, presence: true, uniqueness: true
 end
  # 1/28_アソシエーションを設定することでgroupsテーブルとusersテーブルを関連付ける（group側から記載 user側からの記載とセット 恐らく）
  # 1/28_has_manyの引数に「アソシエーションを組みたいテーブル名」:throughのバリューに「中間テーブル名」を指定
