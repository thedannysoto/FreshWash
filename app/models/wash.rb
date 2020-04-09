class Wash < ApplicationRecord
    belongs_to :car 
    belongs_to :package
end
