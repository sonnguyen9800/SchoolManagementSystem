class Course < ApplicationRecord

  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :categories, :join_table => 'courses_categories'
  belongs_to :coordinator, :foreign_key => 'coordinator_id', optional: true

  def upvote
    upvotes.count
  end

end
