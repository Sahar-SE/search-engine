class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|

      t.timestamps
    end
  end
end
