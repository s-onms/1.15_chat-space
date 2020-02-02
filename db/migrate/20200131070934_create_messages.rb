class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|

     t.string :content
     t.string :image
     t.references :group, foreign_key: true
     t.references :user, foreign_key: true
     # 上記追記1/31 Messageモデルを作成。
     t.timestamps
    end
  end
end
