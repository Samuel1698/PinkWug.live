class AddLinksToStrips < ActiveRecord::Migration[6.0]
  def change
    add_column :strips, :links, :text
  end
end
