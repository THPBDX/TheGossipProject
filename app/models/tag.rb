class Tag < ApplicationRecord
  has_many :join_table_gossip_tags
  has_many :gossips, through: :join_table_gossip_tags

  validates :title, presence: true, uniqueness: true, length: { in: 2..30 }
end
