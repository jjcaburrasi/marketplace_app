class AddTokenToApiUser < ActiveRecord::Migration[6.1]
  def change
    add_column :api_users, :token, :string, null:false
  end
end
