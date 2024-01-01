class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string     :main
      t.string     :sub_1
      t.string     :sub_2
      t.string     :soup 
      t.date       :date
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
