class AddColumnsTokenNicknameImageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :token, :string
    add_column :users, :nickname, :string
    add_column :users, :image, :string
  end
end
