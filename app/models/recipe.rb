class Recipe < ApplicationRecord
  belongs_to :admin
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  has_many :recipe_ingredients, dependent: :destroy
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
  has_many :recipe_seasonings, dependent: :destroy
  accepts_nested_attributes_for :recipe_seasonings, allow_destroy: true
  has_many :recipe_steps, dependent: :destroy
  accepts_nested_attributes_for :recipe_steps, allow_destroy: true
  

  validates :image, :title, presence: true
  validates :category_id, numericality: { other_than: 0 }
end
