class CreateCoursesCoordinators < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_coordinators, :id => false do |t|
      t.integer :course_id, null: false
      t.integer :coordinator_id, null: false
    end
    add_index "courses_coordinators", ["course_id", "coordinator_id"], unique: true
  end
end
