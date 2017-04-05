class AddCommentToChain < ActiveRecord::Migration[5.0]
  def change
    add_column :chains, :comment, :text
  end
end
