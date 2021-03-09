class Workout < ActiveRecord::Base
    belongs_to :gyms
    belongs_to :lifters
    has_many :cardio
    has_many :weights
end