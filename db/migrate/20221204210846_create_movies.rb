class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :country
      t.text :actors
      t.text :description
      t.timestamps
    end
  end
end
