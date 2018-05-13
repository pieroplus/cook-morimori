class AddColumnToMorimoris < ActiveRecord::Migration[5.0]
  def change
    add_column :morimoris, :image, :string
  end
end
