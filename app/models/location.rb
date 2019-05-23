class Location < ApplicationRecord
  has_and_belongs_to_many :courses

  validates :name, presence: true

  def show_name
    name
  end
end
