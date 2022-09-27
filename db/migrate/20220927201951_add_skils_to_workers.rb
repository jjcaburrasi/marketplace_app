class AddSkilsToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :skills, :text, array: true, default: [], null: false
  end
end
