class Car < ApplicationRecord
    belongs_to :user 
    has_many :washes 
    has_many :packages, through: :washes

    validates :make, :model, :year, :license_plate, presence: true
    validates :make, :model, :license_plate, length: { minimum: 2 }
    validates :year, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year + 1 }
    validates :year, format: { with: /(19|20)\d{2}/i }
    

    def get_errors
        error = self.errors.messages.keys[0]
        if error == :make
            "Make #{self.errors.messages[:make][0]}"
        elsif error == :model
            "Model #{self.errors.messages[:model][0]}"
         elsif error == :year
            "Year #{self.errors.messages[:year][0]}"
        elsif error == :license_plate
            "License Plate #{self.errors.messages[:year][0]}"
        end
    end
end
