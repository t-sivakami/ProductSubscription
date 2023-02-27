class Product < ApplicationRecord
	mount_uploader :image, ImageUploader

	belongs_to :user
	has_many :depositories
	has_many :added_products, through: :depositories, source: :user
end
