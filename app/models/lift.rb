class Lift < ActiveRecord::Base
    has_many :workout_types
    has_many :workouts, through: :workout_types
end