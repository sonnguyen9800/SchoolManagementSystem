class AddDescriptionToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :course, :description, :text

  end
end
