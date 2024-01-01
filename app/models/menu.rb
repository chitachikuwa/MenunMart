class Menu < ApplicationRecord
  has_many :room_users
  has_many :recipes, through: :recipe_menu
end
