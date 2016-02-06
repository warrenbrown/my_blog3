class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, presence: true

  scope :persisted, lambda { where.not(id: nil) }
end
