class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe,        null: false, foreign_key: true
      t.string     :name,          null: false
      t.string     :quantity,      null: false
      t.timestamps
    end
  end
end
