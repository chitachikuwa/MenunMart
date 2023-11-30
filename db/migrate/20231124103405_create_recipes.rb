class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title,        null: false
      t.json :ingredients,    null: false
      t.json :seasonings,     null: false
      t.text :steps,          null: false
      t.integer :category_id, null: false
      t.text :quantity
      t.references :admin,    null: false, foreign_key:true
      t.timestamps
    end
  end
end
