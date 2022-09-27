class CreatePlacements < ActiveRecord::Migration[6.1]
  def change
    create_table :placements do |t|
      t.references :client, null: false, foreign_key: true
      t.references :worker, null: false, foreign_key: true
      t.references :candidacy, null: false, foreign_key: true
      t.date    :start_date
      t.date    :end_date
      t.float   :monthly_salary

      t.timestamps
    end
  end
end
