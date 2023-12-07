class CreateRecipeSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_steps do |t|
      t.references :recipe,         null: false, foreign_key: true
      t.integer    :name,   null: false
      t.timestamps
    end
  end
end
