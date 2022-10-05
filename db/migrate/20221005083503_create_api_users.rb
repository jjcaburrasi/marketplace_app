class CreateApiUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :api_users do |t|
      t.string :api_user, null:false

      t.timestamps
    end
  end
end
