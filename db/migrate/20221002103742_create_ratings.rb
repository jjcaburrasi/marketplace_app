class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|

      t.references :client, null: false, foreign_key: true
      t.references :worker, null: false, foreign_key: true
      t.references :placement, null: false, foreign_key: true
      t.integer :worker_rating

      t.timestamps
    end
  end
end
