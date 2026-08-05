class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :featured_image
  has_rich_text :description 
  validates :name, presence: true
end
