class AddDefaultToStatusCandidacies < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:candidacies, :status, 'Application Submitted')
  end
end
