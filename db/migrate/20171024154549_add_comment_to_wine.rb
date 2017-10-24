class AddCommentToWine < ActiveRecord::Migration
  def change
    add_column :wines , :comment, :text
  end
end
