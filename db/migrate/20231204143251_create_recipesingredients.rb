class CreateRecipesingredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipesingredients do |t|
      t.references :recipe,         null: false
      t.integer    :ingredient_id,  null: false
      t.integer    :quantity,       null: false
      t.timestamps
    end
  end
end
