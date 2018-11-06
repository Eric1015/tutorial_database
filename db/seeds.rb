# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Car.delete_all
Engine.delete_all

car1 = Car.create!(name: "プリウス", color: "シルバー")
car2 = Car.create!(name: "フェラーリ", color: "赤")
engine1 = Engine.create!(name: "エンジン1", power: 120, car: car1)
engine2 = Engine.create!(name: "スーパーエンジン", power: 660, car: car2)