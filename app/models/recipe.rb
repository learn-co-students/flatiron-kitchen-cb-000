class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :ingredients
end
