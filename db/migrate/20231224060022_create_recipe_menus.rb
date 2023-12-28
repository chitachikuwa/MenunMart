class CreateRecipeMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_menus do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.timestamps
    end
  end
end
