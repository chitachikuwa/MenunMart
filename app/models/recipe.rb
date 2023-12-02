class Recipe < ApplicationRecord
  belongs_to :admin
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  serialize :ingredients, Array
  serialize :seasonings, Array
  serialize :quantity, Array
  serialize :steps, Array

  validates :image, :title, :ingredients, :seasonings, :steps, presence: true
  validates :category_id, numericality: { other_than: 0 }
end
