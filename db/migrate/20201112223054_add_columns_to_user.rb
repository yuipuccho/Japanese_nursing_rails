class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :auth_token, :string, null: false
    add_column :users, :user_name, :string
  end
end
