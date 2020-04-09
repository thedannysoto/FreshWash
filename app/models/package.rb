class Package < ApplicationRecord
    has_many :washes 
    has_many :cars, through: :washes
end
