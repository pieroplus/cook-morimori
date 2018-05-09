class Change < ActiveRecord::Migration[5.0]
  def change
    add_reference    :site_infomations, :site
  end
end
