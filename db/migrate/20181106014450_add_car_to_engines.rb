class AddCarToEngines < ActiveRecord::Migration[5.2]
  def change
    add_reference :engines, :car, foreign_key: true, index: true
  end
end
