Car.delete_all
Engine.delete_all
Tire.delete_all

car1 = Car.new(name: "プリウス", color: "シルバー")
car2 = Car.new(name: "フェラーリ", color: "赤")
engine1 = Engine.create!(name: "エンジン1", power: 120, car: car1)
engine2 = Engine.create!(name: "スーパーエンジン", power: 660, car: car2)
tire1 = Tire.create!(diameter: 60, car: car1)
tire2 = Tire.create!(diameter: 60, car: car1)
tire3 = Tire.create!(diameter: 60, car: car1)
tire4 = Tire.create!(diameter: 60, car: car1)
tire5 = Tire.create!(diameter: 40, car: car2)
tire6 = Tire.create!(diameter: 40, car: car2)
tire7 = Tire.create!(diameter: 40, car: car2)
tire8 = Tire.create!(diameter: 40, car: car2)

car1.tires << tire1
car1.tires << tire2
car1.tires << tire3
car1.tires << tire4
car2.tires << tire5
car2.tires << tire6
car2.tires << tire7
car2.tires << tire8

car1.save
car2.save