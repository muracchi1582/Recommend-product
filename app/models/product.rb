class Product < ApplicationRecord
  mount_uploader :movie, VideoUploader
  mount_uploader :image, ImageUploader
  has_many :histories
  has_many :users,through: :histories
end
