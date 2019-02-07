class SubComment < ApplicationRecord
  belongs_to :comment

  validates :content, presence: true
end
