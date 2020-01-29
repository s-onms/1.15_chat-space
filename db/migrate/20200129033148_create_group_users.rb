class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      # 1/28_groupモデルと、中間テーブルとして使用するgroup_userモデルを作成後、マイグレーションファイルを編集
      t.timestamps
    end
  end
end
