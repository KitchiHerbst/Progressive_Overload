require_relative '../config/environment'
require "artii"
require "tty-prompt"


puts "HELLO WORLD"
#binding.pry

#Allow a user to create account or login
#allow a user to add a workout 
#allow a user to update a workout
#update the cardio/weight tables when a new workout is created 
#create a new instance of a cardio or weight (lift) assign a workout_id 

$lifter_object = nil
$gym_object = nil 

def greeting
    name = Artii::Base.new :font => 'slant'
    puts name.asciify('Progressive Overload')
end

def login_prompt
    prompt = TTY::Prompt.new
    var = prompt.select("Please select an option", %w(login sign_up exit))
    if var == "login"
        login #takes you to the login method
    end
    if var == "sign_up"
        puts "sorry this feature is currently unavailable"
        login_prompt #takes you back to the login_prompt method for now
    else
        exit!
    end
end

#we need to be able to retreive the lifter object when they pass in the Lifter.name during the prompt 
#so we can access the other attributes for the lifter
def login
    lifter_name = Lifter.all.map {|lifter|lifter.name}
    prompt = TTY::Prompt.new 
    username = prompt.ask('What is your username?') 
        #setting the lifter_object variable to equal the Lifter whos name is equal the username that is passed into the prompt
    $lifter_object = Lifter.all.find {|lifter|lifter.name==username}
    if lifter_name.include?(username)
        puts "Welcome #{username}!"
        initial_options #takes you to the initial options method
    else
        exit! #if you put in an invalid username it exits the program
    end
    #binding.pry
end

def initial_options
    # binding.pry
    prompt = TTY::Prompt.new 
    var = prompt.select("What would you like to do", %w(add_workout update_workout exit))
        if var == "add_workout"
            add_workout
        elsif var == "update_workout"
            puts "sorry this feature is currently unavailable"
            initial_options
        else 
            exit!
        end
end

def add_workout
    prompt = TTY::Prompt.new 
    gym_names = Gym.all.map {|gym|gym.name}
    gym = prompt.ask('What gym did you go to?') 
    #setting the $gym_object variable equal to the gym object that has the name of what the lifter puts as the gym they went to
    $gym_object = Gym.all.find {|gym_object|gym_object.name==gym}
    if gym_names.include?(gym)
        puts "good choice"
    else
        exit
    end
    weight = prompt.ask('Did you lift weights?')
    weightb = nil
        if weight == "yes" 
            weightb = true
            puts "gainz"
            # call add_weights method
        elsif
            puts "next time"
            weightb = false
        end
    cardio = prompt.ask('Did you do cardio?')
        cardiob = nil
        if cardio == "yes"
            cardiob = true
            puts "nice"
            #call add_cardio method
        elsif
            puts "next time"
            cardiob = false
        end 
        #binding.pry
        Workout.create(lifter_id: $lifter_object.id , gym_id: $gym_object.id , weights: weightb, cardio: cardiob )
        binding.pry
end

def update_workout
    prompt = TTY::Prompt.new 
    workout_id = prompt.ask('What workout would you like to update?')
end

# def add_weights
#     Weight.create(name: ,workout_id: ,lifter_id: ,first_reps: ,first_weight: ,second_reps: ,second_weight: ,third_reps: ,third_weight:)
# end














greeting

login_prompt
#login

#initial_options
