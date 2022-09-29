class AddSkillsToJobRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :job_requests, :skills, :text, array: true, default: [], null: false
  end
end
