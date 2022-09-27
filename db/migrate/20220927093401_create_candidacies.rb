class CreateCandidacies < ActiveRecord::Migration[6.1]
  def change
    create_table :candidacies do |t|
      t.references :worker, null: false, foreign_key: true
      t.references :job_request, null: false, foreign_key: true
      t.string  :status
      t.date    :start_date  

      t.timestamps

      # add_index :candidacies, :worker_id


    end
  end
end
