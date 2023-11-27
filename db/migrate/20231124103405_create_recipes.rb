class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title,        null: false
      t.json :ingredients,    null: false
      t.json :seasonings,     null: false
      t.text :steps,          null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
