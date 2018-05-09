class CreateMorimoriImages < ActiveRecord::Migration[5.0]
  def change
    create_table :morimori_images do |t|
      t.string :picture, null: false
      t.references :morimori
      t.timestamps
    end
  end
end
