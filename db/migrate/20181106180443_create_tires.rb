class CreateTires < ActiveRecord::Migration[5.2]
  def change
    create_table :tires do |t|
      t.integer :diameter

      t.timestamps
    end
  end
end
