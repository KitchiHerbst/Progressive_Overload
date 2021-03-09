class Workout < ActiveRecord::Base
    belongs_to :gym
    belongs_to :lifter
    # has_many :workout_types
    # has_many :lifts, through: :workout_types 
end
