class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_users
  has_many :groups, through: :group_users
  # 1/29_アソシエーションを設定(userファイル側で記載)

  has_many :messages
  # 1/30_アソシエーションを設定(userファイル側で記載)
  # userからはメッセージ多数ですよって事
end
