class AddAvailableToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :available, :boolean, default: :true
  end
end
