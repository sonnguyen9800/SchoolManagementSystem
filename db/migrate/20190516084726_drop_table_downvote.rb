class DropTableDownvote < ActiveRecord::Migration[5.2]
  def change
    drop_table :downvotes
  end
end
