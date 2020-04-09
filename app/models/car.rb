class Car < ApplicationRecord
    belongs_to :user 
    has_many :washes 
    has_many :packages, through: :washes
end
