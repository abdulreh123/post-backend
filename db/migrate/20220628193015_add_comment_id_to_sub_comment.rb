class AddCommentIdToSubComment < ActiveRecord::Migration[7.0]
  def change
    add_column :sub_comments, :comment_id, :integer
    add_index :sub_comments, :comment_id
  end
end
