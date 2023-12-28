class CreateRecipeMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_menus do |t|

      t.timestamps
    end
  end
end
