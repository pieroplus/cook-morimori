class CreateCooks < ActiveRecord::Migration[5.0]
  def change
    create_table :cooks do |t|
      t.references :morimori
      t.references :foodstuff
      t.timestamps
    end
  end
end
