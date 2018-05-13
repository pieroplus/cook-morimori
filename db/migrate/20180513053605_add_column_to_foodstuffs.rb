class AddColumnToFoodstuffs < ActiveRecord::Migration[5.0]
  def change
    add_column :foodstuffs, :month, :integer
  end
end
