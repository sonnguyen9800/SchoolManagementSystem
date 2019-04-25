class CreateCoursesLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_locations, :id => false do |t|
      t.integer :course_id, null: false
      t.integer :location_id, null: false
    end
    add_index "courses_locations", ["course_id", "location_id"], unique: true
  end
end
