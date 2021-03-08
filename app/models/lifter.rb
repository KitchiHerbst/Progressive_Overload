class Lifter < ActiveRecord::Base
    has_many :workouts 
    has_many :gyms, through: :workouts
    has_many :weights, through: :workouts
    has_many :cardios, through: :workouts 
end