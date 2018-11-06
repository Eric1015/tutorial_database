require 'test_helper'

class CarTest < ActiveSupport::TestCase
  test 'valid car' do
    car = Car.new(name: "BMW", color: "黒")
    assert car.valid?
  end

  test 'invalid without name' do
    car = Car.new(color: "黒")
    refute car.valid?
  end

  test 'invalid without color' do
    car = Car.new(name: "BMW")
    refute car.valid?
  end

  test 'invalid duplicate name' do
    car = Car.create!(name: "BMW", color: "黒")
    car = Car.new(name: "BMW", color: "白")
    refute car.valid?
  end
end
