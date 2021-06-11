class CreateStripTags < ActiveRecord::Migration[6.0]
  def change
    create_table :strip_tags do |t|
      t.references :strip, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
