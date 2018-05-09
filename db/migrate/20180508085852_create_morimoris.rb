class CreateMorimoris < ActiveRecord::Migration[5.0]
  def change
    create_table :morimoris do |t|
      t.string :name,            null: false, index: true
      t.references :user
      t.timestamps
    end
  end
end
