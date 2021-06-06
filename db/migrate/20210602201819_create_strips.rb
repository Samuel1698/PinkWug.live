class CreateStrips < ActiveRecord::Migration[6.0]
  def change
    create_table :strips do |t|
      t.string :title
      t.string :subtext
      t.string :image
      t.text :transcript

      t.timestamps
    end
  end
end
