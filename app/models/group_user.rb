class GroupUser < ApplicationRecord
 belongs_to :group
 belongs_to :user
 # 1/28_アソシエーションを設定
end
