class AddSlugToStrips < ActiveRecord::Migration[6.0]
  def change
    add_column :strips, :slug, :string
    add_index :strips, :slug, unique: true
  end
end
