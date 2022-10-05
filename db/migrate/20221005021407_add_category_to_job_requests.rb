class AddCategoryToJobRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :job_requests, :category, :string
  end
end
