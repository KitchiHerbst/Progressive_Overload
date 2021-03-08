class Workout < ActiveRecord::Base
    belongs_to :gyms
    belongs_to :lifters
end