class CreateCoursesCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_categories, :id => false do |t|
      t.integer :course_id, null: false
      t.integer :category_id, null: false
    end
    add_index "courses_categories", ["course_id", "category_id"], unique: true
  end
end
