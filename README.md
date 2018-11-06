## 注意事項
Rubyのバージョンを自分のに合わせましょう。Gemfileを開いてRubyのバージョンを変更し、
```
bundle install
```
で反映させましょう。

## 制限
ここまでどうやって1対1と1対多の関係性を見てきました。しかし、ただ関係性を持っただけでは面白くないので、データに制限をつけてより現実的なデータベースを作りましょう。<br>
<br>
最初にCarの名前および色が定義されていないという状況を防ぐために<code>models/car.rb</code>に次の制限を追加しましょう。
```ruby
validates :name, :color, presence: true
```
次にCarの名前が重複するのを制限しましょう。ネットで車のリストを見ていて、同じ車が二度も出てくるのは不自然ですよね。
ということで、<code>models/car.rb</code>に制限を追加しましょう。
```ruby
validates :name, uniqueness: true
```
さらに、車のタイヤは四個ですよね。なので、<code>models/car.rb</code>に下記のを追加しましょう。
```ruby
validates :tires, length: {in: 4..4}
```
そしたら、<code>models/car.rb</code>はこんな感じになるでしょう。<br>
```ruby
class Car < ApplicationRecord
    has_one :engine
    has_many :tires
    validates :name, :color, presence: true
    validates :name, uniqueness: true
    validates :tires, length: {in: 4..4}
end
```
<br>
以上になります。お疲れさまでした。