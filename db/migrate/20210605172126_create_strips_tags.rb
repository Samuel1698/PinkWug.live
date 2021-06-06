class CreateStripsTags < ActiveRecord::Migration[6.0]
  def change
    create_table :strips_tags do |t|
      t.references :strip, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
