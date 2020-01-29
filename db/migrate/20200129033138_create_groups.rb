class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|

     t.string :name, null: false
     t.index :name, unique: true
     # 1/28_groupモデルと、中間テーブルとして使用するgroup_userモデルを作成後、マイグレーションファイルの編集

      t.timestamps
    end
  end
end
