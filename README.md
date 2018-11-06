## 注意事項
Rubyのバージョンを自分のに合わせましょう。Gemfileを開いてRubyのバージョンを変更し、
```
bundle install
```
で反映させましょう。

## 1対1
まずは基本的な1対1になります。
データベースでテーブルを作るコードがすでに入っているので、下記のコマンドでテーブルを生成しましょう。
```
rake db:migrate
```
まず、シードでデータをテーブルに入れていきましょう。
```
rake db:seed
```
では、下準備ができたので、本題にかかりましょう<br>
まず、現状をローカルで確認してみましょう<br>
下記のようにローカルサーバーを立ち上げて、ホームページに示されたリンクを通して、データベースの内容を見てみましょう。
```
rails s
```
今の状態ですと、CarとEngineの間に1対1の関係性が見えません。本来ならCarに所属しているEngineの方にどのCarに所属しているのかをしめしてくれるIDがあるのですが、ここにはありません。<br>
では、この関係性を足していきましょう。<br>
初めにCarは一つのEngineを持っているので、<code>has_one</code>を<code>models/car.rb</code>に追加しましょう。<br>
そしたら、下記のようになるでしょう。
```ruby
class Car < ApplicationRecord
    has_one :engine
end
```
次に、Engineの方にCarに所属することを示すために<code>belongs_to</code>を<code>models/engine.rb</code>に追加しましょう。<br>
そしたら、下記のようになるでしょう。
```ruby
class Engine < ApplicationRecord
    belongs_to :car
end
```
ここまでやったところで一回ローカルサーバーで見てみましょう<br>
<br>
あれ？まだないなとなったはずです。<br>
そうなんです。Engineの方にどのCarなのかを示すカラムを足す必要があるのです。<br>
データベースでテーブルを作った後に新しいカラムを追加したい場合は新しくマイグレーションを作る必要があります。<br>
下記のように新しいマイグレーションを作りましょう！！
```
rails g migration AddCarToEngine car:references
```
ここで足したのはEngineからCarへのリファレンス、つまり、アクセスです。<br>
<code>db/migrate/<date>_add_car_to_engine.rb</code>というファイルが追加されたと思います。中身はこんな感じ。
```ruby
class AddCarToEngine < ActiveRecord::Migration[5.2]
  def change
    add_reference :engines, :car, foreign_key: true
  end
end
```
ここにインデックスを追加しましょう。下記のようにインデックスを加えます。
```ruby
class AddCarToEngine < ActiveRecord::Migration[5.2]
  def change
    add_reference :engines, :car, foreign_key: true, index: true
  end
end
```
では、新しいアップデートをデータベースに反映させたいので、<br>
```
rake db:migrate
```
これで、作業完了。では、もう一度ローカルサーバーで見てみましょう<br>
<br>
おかしいな。IDが<code>null</code>になってる。<br>
それもそのはず。そもそも最初にテーブル内に作ったこれらのEngineデータはどの車に所属するのか明示していなかったからだ。<br>
そこで、<code>db/seeds.rb</code>を少し編集して、これらのEngineとCarにつながりを持たせましょう。<br>
Engineを生成する部分を下記のように変えましょう。こうすることで生成時にCarへのリファレンスが同時に追加されます。
```ruby
engine1 = Engine.create!(name: "エンジン1", power: 120, car: car1)
engine2 = Engine.create!(name: "スーパーエンジン", power: 660, car: car2)
```
では、気を取り直してローカルサーバーで見てみましょう。今度こそはIDが見れるはずです。