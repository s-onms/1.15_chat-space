class Message < ApplicationRecord
 belongs_to :group
 belongs_to :user
 # 1/30_上記と紐付け？1対1

 validates :content, presence: true, unless: :image?
 # 1/30_記載 意味は？
 # contentカラムが空の場合は保存しない、というバリデーション
 # unless: :image?・・・imageカラムがなかったらという意味
 # 要は、imageカラムが空でcontentカラムも空であれば保存しないという意味

 mount_uploader :image, ImageUploader
 # 1/30_記載
end
