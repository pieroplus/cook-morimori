class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :morimoris_count, :integer
  end
end
