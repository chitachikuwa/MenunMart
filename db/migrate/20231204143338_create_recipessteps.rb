class CreateRecipessteps < ActiveRecord::Migration[6.0]
  def change
    create_table :recipessteps do |t|
      t.references :recipe,         null: false
      t.integer    :step_id,   null: false
      t.timestamps
    end
  end
end
