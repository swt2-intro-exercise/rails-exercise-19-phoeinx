class Paper < ApplicationRecord
  has_and_belongs_to_many :authors
  accepts_nested_attributes_for :authors

  validates :title, :venue, :year, presence: true
  validates :year, numericality: true
end
