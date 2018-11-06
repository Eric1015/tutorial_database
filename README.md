## 注意事項
Rubyのバージョンを自分のに合わせましょう。Gemfileを開いてRubyのバージョンを変更し、
```
bundle install
```
で反映させましょう。

## 1対多
では、次はもうちょっと発展ということで1対多をやっていきましょう。<br>
ここでは前で使ってきたCarとEngineを引き続き使っていきます。<br>
<br>
早速、CarがTireをたくさん持っているというものをやっていきましょう。<br>
もしも、ここから始めたのなら、まずは
```
rake db:migrate
```
でテーブルを作成し、
```
rake db:seed
```
でテーブルにデータを出力しましょう。<br>
今回も同様にローカルサーバーで見てみましょう。<br>
```
rails s
```
もちろん関係性は見えてこないが、しっかりとTireがいくつか作られたのが確認できます。<br>
<br>
では、TireとCarに関係性を持たせていきましょう。<br>
まずはCarに<code>has_many</code>を<code>models/car.rb</code>に追加しましょう。<br>
```ruby
class Car < ApplicationRecord
    has_one :engine
    has_many :tires
end
```
次にTireに<code>belongs_to</code>を<code>models/tire.rb</code>に追加しましょう。<br>
```ruby
class Tire < ApplicationRecord
    belongs_to :car
end
```
これで基本的なセットアップは完了。では、またローカルサーバーで見てみましょう。<br>
1対1をやったのなら、これではまだ必要なカラムがTireにないことを知っていることでしょう。<br>
ということで、TireにCarへのリファレンスを追加していきましょう。<br>
まずはコマンドでマイグレーションを作成。<br>
```
rails g migration AddCarToTire car:references
```
ここにインデックスを追加しましょう。<code>db/migrate/<date>_add_car_to_tire.rb</code>
```ruby
class AddCarToTire < ActiveRecord::Migration[5.2]
  def change
    add_reference :tires, :car, foreign_key: true, index: true
  end
end
```
そしたら、データベースに反映させるためにマイグレート
```
rake db:migrate
```
では、<code>db/seeds.rb</code>の内容を少し変えて、リファレンスを追加しましょう。<br>
さらに、Carの方にもTireへのリファレンスを追加しましょう。<br>
```ruby
Car.delete_all
Engine.delete_all
Tire.delete_all

car1 = Car.create!(name: "プリウス", color: "シルバー")
car2 = Car.create!(name: "フェラーリ", color: "赤")
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
```
そしたら、もう一度ローカルサーバーを開いて確認してみましょう。今度は追加されているはずです。<br>

