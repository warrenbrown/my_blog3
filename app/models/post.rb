class Post < ActiveRecord::Base
  validates :title, presence: true
  has_many :comments, dependent: :destroy

  mount_uploader :attachment, AttachmentUploader
end
