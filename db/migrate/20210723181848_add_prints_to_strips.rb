class AddPrintsToStrips < ActiveRecord::Migration[6.0]
  def change
    add_column :strips, :has_print, :boolean
  end
end
