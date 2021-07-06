class AddCommentToStrips < ActiveRecord::Migration[6.0]
  def change
    add_column :strips, :comment, :text
  end
end
