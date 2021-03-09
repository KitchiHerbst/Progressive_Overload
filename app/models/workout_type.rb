class WorkoutType < ActiveRecord::Base
    belongs_to :workout
    belongs_to :lift
end