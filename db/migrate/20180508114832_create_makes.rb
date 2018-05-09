class CreateMakes < ActiveRecord::Migration[5.0]
  def change
    create_table :makes do |t|
      t.text :content, null: false
      t.references :morimori
      t.timestamps
    end
  end
end
