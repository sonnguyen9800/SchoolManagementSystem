class AddLikeDislikeToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :like, :integer
    add_column :courses, :dislike, :integer
  end
end
