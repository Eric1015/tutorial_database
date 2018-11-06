class Car < ApplicationRecord
    has_one :engine
    has_many :tires
    validates :name, :color, presence: true
    validates :name, uniqueness: true
    validates :tires, length: {in: 4..4}

    
end
