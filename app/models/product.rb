class Product < ApplicationRecord
  mount_uploader :movie, VideoUploader
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :histories
end
