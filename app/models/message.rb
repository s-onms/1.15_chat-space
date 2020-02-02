class Message < ApplicationRecord
 belongs_to :group
 belongs_to :user
 # 追記記載1/31 Message側から

 validates :content, presence: true, unless: :image?
 # 1/31contentカラムが空の場合は保存しない、というバリデーション
 # imageカラムが空の場合かつcontentカラムも空であれば保存しないという意味
 mount_uploader :image, ImageUploader
end
# 1/31送信機能実装時にここを作成
