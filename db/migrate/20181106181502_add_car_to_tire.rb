class AddCarToTire < ActiveRecord::Migration[5.2]
  def change
    add_reference :tires, :car, foreign_key: true, index: true
  end
end
