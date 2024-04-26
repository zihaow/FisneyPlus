class CreateShowCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :show_categories do |t|
      t.references :show, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
