class CreateJobRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :job_requests do |t|
      t.integer :client_id
      t.date    :start_date
      t.date    :end_date
      t.string  :job_function
      t.string  :address
      t.integer :vacancies_count
      t.float   :monthly_salary


      t.timestamps

      # add_index :job_requests, :client_id
    end
  end
end
