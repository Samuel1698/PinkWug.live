class AddKeywordsToStrips < ActiveRecord::Migration[6.0]
  def change
    add_column :strips, :keywords, :text, default: [].to_yaml
  end
end
