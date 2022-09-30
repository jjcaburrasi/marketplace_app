class AddJobRequestToPlacement < ActiveRecord::Migration[6.1]
  def change
    add_reference :placements, :job_request, index: true
    add_foreign_key :placements, :job_requests
  end
end
