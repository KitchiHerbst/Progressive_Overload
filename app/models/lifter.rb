class Lifter < ActiveRecord::Base
    has_many :workouts 
    has_many :gyms, through: :workouts
    # has_many :lifts, through: :workouts
end