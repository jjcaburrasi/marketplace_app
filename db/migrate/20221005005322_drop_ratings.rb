class DropRatings < ActiveRecord::Migration[6.1]
  def change
    drop_table :ratings
  end
end
