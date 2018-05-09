class CreateMakeImages < ActiveRecord::Migration[5.0]
  def change
    create_table :make_images do |t|
      t.string :picture, null: false
      t.references :make
      t.timestamps
    end
  end
end
