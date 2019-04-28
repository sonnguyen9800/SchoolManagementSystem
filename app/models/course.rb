class Course < ApplicationRecord
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :categories, :join_table => 'courses_categories'
  belongs_to :coordinator, :foreign_key => 'coordinator_id', optional: true
end
