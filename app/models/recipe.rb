class Recipe < ApplicationRecord
  belongs_to :admin
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipe_seasonings, dependent: :destroy
  has_many :recipe_steps, dependent: :destroy
  has_many :menus

  accepts_nested_attributes_for :recipe_ingredients,
                                :recipe_seasonings,
                                :recipe_steps, reject_if: :all_blank, allow_destroy: true
  
  validates :image, :title, presence: true
  validates :category_id, numericality: { other_than: 0 }
end
