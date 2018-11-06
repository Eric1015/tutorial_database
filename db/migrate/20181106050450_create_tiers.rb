class CreateTiers < ActiveRecord::Migration[5.2]
  def change
    create_table :tiers do |t|
      t.integer :diameter

      t.timestamps
    end
  end
end
