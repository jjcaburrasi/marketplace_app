class AddFilledVacanciesToJobRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :job_requests, :filled_vacancies, :integer, default: 0, null: false
  end
end
