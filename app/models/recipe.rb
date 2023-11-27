class Recipe < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category


  validates :image, :title, :ingredients, :seasonings, :steps, presence: true
  validates :category_id, numericality: { other_than: 0 }
end
