class Wash < ApplicationRecord
    belongs_to :car 
    belongs_to :package

    default_scope { order(updated_at: :desc) }
    scope :ordered_by_price, -> { joins(:package).reorder('packages.price').order(updated_at: :desc) }
    scope :ordered_by_car, -> { joins(:car).reorder('cars.make').order(updated_at: :desc) }
end
