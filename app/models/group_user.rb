class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
  # アソシエーション設定
end
