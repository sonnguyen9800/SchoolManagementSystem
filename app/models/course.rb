class Course < ApplicationRecord
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :categories, :join_table => 'courses_categories'
  has_and_belongs_to_many :coordinators, :join_table => 'courses_coordinators'

end
