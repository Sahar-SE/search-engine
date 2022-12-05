class CreateVistors < ActiveRecord::Migration[7.0]
  def change
    create_table :vistors do |t|

      t.timestamps
    end
  end
end
