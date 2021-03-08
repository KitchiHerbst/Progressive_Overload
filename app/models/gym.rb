class Gym < ActiveRecord::Base
    has_many :workouts 
    has_many :lifters, through: :workouts 
end