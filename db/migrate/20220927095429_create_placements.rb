class CreatePlacements < ActiveRecord::Migration[6.1]
  def change
    create_table :placements do |t|
      t.integer :candidacy_id
      t.integer :worker_id
      t.integer :client_id
      t.date    :start_date
      t.date    :end_date
      t.float   :monthly_salary

      t.timestamps
    end
  end
end
