require_relative '../config/environment'
require "artii"
require "tty-prompt"


puts "HELLO WORLD"


#Allow a user to create account or login
#allow a user to add a workout 
#allow a user to update a workout
#update the cardio/weight tables when a new workout is created 
#create a new instance of a cardio or weight (lift) assign a workout_id 

def greeting
    a = Artii::Base.new :font => 'slant'
    a.asciify('Progressive Overload')
end

def login
    lifter_name = Lifter.all.map {|lifter|lifter.name}
    prompt = TTY::Prompt.new 
    username = prompt.ask('What is your username?') 
    if lifter_name.include?(username)
        puts "Welcome"
    else
        exit!
    end
end

def initial_options
    prompt = TTY::Prompt.new 
    var = prompt.select("What would you like to do", %w(add_workout update_workout exit))
        if var == "add_workout"
            add_workout
        elsif var == "update_workout"
            puts "nice one"
        else 
            exit!
        end
end

def add_workout
    prompt = TTY::Prompt.new 
    gym_names = Gym.all.map {|gym|gym.name}
    gym = prompt.ask('What gym did you go to?')
    if gym_names.include?(gym)
        puts "good choice"
    else
        exit
    end
    weight = prompt.ask('Did you lift weights?')
        if weight == "yes" 
            puts "gainz"
            # call add_weights method
        elsif
            puts "next time"
        end
    cardio = prompt.ask('Did you do cardio?')
        if cardio == "yes" 
            puts "nice"
            #call add_cardio method
        elsif
            puts "next time"
        end
end

def update_workout
    prompt = TTY::Prompt.new 
    workout_id = prompt.ask('What workout would you like to update?')

end

# def add_weights
#     Weight.create(name: ,workout_id: ,lifter_id: ,first_reps: ,first_weight: ,second_reps: ,second_weight: ,third_reps: ,third_weight:)
# end














greeting

login

initial_options
