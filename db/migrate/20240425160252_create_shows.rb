class CreateShows < ActiveRecord::Migration[7.1]
  def change
    create_table :shows do |t|
      t.string :name
      t.integer :show_type
      t.integer :year
      t.text :detail

      t.timestamps
    end
  end
end
