class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe,         null: false, foreign_key: true
      t.integer    :name,  null: false
      t.integer    :quantity,       null: false
      t.timestamps
    end
  end
end
