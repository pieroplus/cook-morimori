class AddColumnToMake < ActiveRecord::Migration[5.0]
  def change
    add_column :makes, :image, :string
  end
end
