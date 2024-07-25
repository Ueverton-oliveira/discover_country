class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :capital, presence: true
  validates :population, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :area, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
