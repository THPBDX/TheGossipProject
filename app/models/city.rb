class City < ApplicationRecord
	has_many :users

  validates :name, presence: true, uniqueness: true, length: { in: 2..30 }
  validates :postal_code, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
