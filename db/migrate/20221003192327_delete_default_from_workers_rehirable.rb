class DeleteDefaultFromWorkersRehirable < ActiveRecord::Migration[6.1]
  def change
    change_column_default( :workers, :rehirable, from: false, to: nil )
  end
end
