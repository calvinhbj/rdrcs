class AddFStateAndCommentToOrder < ActiveRecord::Migration
  def change
    add_column :orders , :fstate , :string
    add_column :orders , :comment , :string
  end
end
