class AddcolomMorimoris < ActiveRecord::Migration[5.0]
  def change
    add_column    :morimoris, :mainsub_id, :integer
    add_column    :morimoris, :mainsub_name, :string
  end
end
