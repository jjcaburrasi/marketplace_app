class CreateCandidacies < ActiveRecord::Migration[6.1]
  def change
    create_table :candidacies do |t|
      t.integer :worker_id
      t.integer :job_request_id
      t.string  :status
      t.date    :start_date  

      t.timestamps

      # add_index :candidacies, :worker_id


    end
  end
end
