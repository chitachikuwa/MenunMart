class CreateRecipesseasonings < ActiveRecord::Migration[6.0]
  def change
    create_table :recipesseasonings do |t|
      t.references :recipe,         null: false
      t.integer    :seasoning_id,   null: false
      t.integer    :quantity,       null: false
      t.timestamps
    end
  end
end
