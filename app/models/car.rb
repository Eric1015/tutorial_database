class Car < ApplicationRecord
    has_one :engine
    has_many :tires
end
