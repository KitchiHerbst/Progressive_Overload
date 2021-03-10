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
$workout_object = nil
$lift_object = nil
$workout_type_object = nil

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
        sign_up #takes you to a sign up method
    else
        exit
    end
end

def sign_up
    lifter_name = Lifter.all.map {|lifter|lifter.name}
    prompt = TTY::Prompt.new
    result = prompt.collect do
        name = key(:name).ask('What do you want your username to be?')
            if lifter_name.include?(name)
                puts "this name is already associated with an account"
                login_prompt
            end
        key(:age).ask('How old are you?', convert: :int)
        key(:height).ask('How tall are you in inches?', convert: :int)
        key(:weight).ask('How much do you weight in lbs?', convert: :int)
        key(:gender).ask('Gender?')
    end
        $lifter_object = Lifter.create(name: result[:name], age: result[:age], height: result[:height], weight: result[:weight], gender: result[:gender])    
        initial_options
end

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
        puts "sorry that username was not found"
        login_prompt
         #if you put in an invalid username it sends you back to the login_prompt method
    end
end

def initial_options
    # binding.pry
    prompt = TTY::Prompt.new 
    var = prompt.select("What would you like to do", %w(add_workout update_workout view_all_workouts add_gym exit))
        if var == "add_workout"
            add_workout
        elsif var == "update_workout"
            puts "sorry this feature is currently unavailable"
            initial_options
        elsif var == "view_all_workouts"
            view_all_workouts
        elsif var == "add_gym"
            add_gym
        elsif exit
           exit!
        end
end

def add_gym
    gym_name = Gym.all.map {|gym| gym.name}
    prompt = TTY::Prompt.new
    result = prompt.collect do
       name = key(:name).ask('What is the name of the gym you want to add?')
    if gym_name.include?(name)
        puts "This gym is already in your account."
        initial_options
    end
        key(:location).ask('What is your gyms location?')
    end
        $gym_object = Gym.create(name: result[:name], location: result[:location])  
        initial_options   
end

def view_all_workouts
    prompt = TTY::Prompt.new 
    var = Workout.all.select {|workout|workout.lifter == $lifter_object}
    var.each {|workout_object|
    puts workout_object.name
    }
    select_workout
    options_after_add_lifts
end

def add_workout
    prompt = TTY::Prompt.new 
    gym_names = Gym.all.map {|gym|gym.name}
    workout_name = prompt.ask('What would you like to call this workout?')
    gym = prompt.ask('What gym did you go to?') 
    #setting the $gym_object variable equal to the gym object that has the name of what the lifter puts as the gym they went to
    $gym_object = Gym.all.find {|gym_object|gym_object.name==gym}
    if gym_names.include?(gym)
        puts "Great Choice"
        $workout_object = Workout.create(name: workout_name, lifter_id: $lifter_object.id , gym_id: $gym_object.id)
        add_lifts
    else
        unknown_gym = prompt.select("this isnt a gym we have on file would you like to create a new gym?", %w(yes no))
        if unknown_gym == "yes"
            add_gym
        else
            exit!
        end
    end
end

def add_lifts
    if $workout_object == nil
        puts "must select a workout or create a new workout"
        initial_options
    else
    prompt = TTY::Prompt.new 
    lift_name = prompt.ask('What exercise did you preform?')
    st_reps = prompt.ask('How many reps for your first set?').to_i
    st_weight = prompt.ask('What weight did you use for your first set').to_i
    nd_reps = prompt.ask("How many reps for your second set?").to_i
    nd_weight = prompt.ask('What weight did you use for your second set').to_i
    rd_reps = prompt.ask("How many reps for your third set?").to_i
    rd_weight = prompt.ask('What weight did you use for your third set').to_i
    $lift_object = Lift.create(name: lift_name ,first_reps: st_reps,
    first_weight: st_weight,second_reps: nd_reps,second_weight: nd_weight,third_reps: rd_reps,third_weight: rd_weight)
    $workout_type_object = WorkoutType.create(workout_id: $workout_object.id,lift_id: $lift_object.id)
    options_after_add_lifts
    end
    #binding.pry
end

def options_after_add_lifts
    prompt = TTY::Prompt.new 
    var = prompt.select("What would you like to do?", %w(add_lift update_workout view_all_workouts view_this_workouts_lifts exit))
        if var == "add_lift"
            add_lifts
        elsif var == "update_workout"
            update_workout
        elsif var == "view_all_workouts"
            view_all_workouts
        elsif var == "view_this_workouts_lifts"
            b = prompt.select("Is the workout you want to see #{$workout_object.name}", %w(yes no))
            if b == "yes"
                all_lifts_associated_with_workout($workout_object.id)
            elsif b == "no"
                select_workout
            end
        else
            exit!
        end
end

def update_workout
    prompt = TTY::Prompt.new 
    workout_id = prompt.ask('What workout would you like to update?')
end

def all_lifts_associated_with_workout(workout_id)
    workouttypes = WorkoutType.all.select {|workouttype|workouttype.workout_id == workout_id}
    array = workouttypes.map {|v|v.lift_id}
    lift_array = []
        Lift.all.each do |lift_object|
            if array.include?(lift_object.id)
                lift_array << lift_object
            end
        end  
        lift_array.each {|lift|print "LIFT NAME #{lift.name}, 1ST SET REPS #{lift.first_reps}, WEIGHT #{lift.first_weight}, 2ND SET REPS #{lift.second_reps}, WEIGHT #{lift.second_weight}, 3RD SET REPS #{lift.third_reps}, WEIGHT #{lift.third_weight}\n"}  
        initial_options
end

def select_workout
    prompt = TTY::Prompt.new
    var = Workout.all.select {|workout|workout.lifter == $lifter_object} 
    var_name = var.map {|workout|workout.name}
    b = prompt.select("What workout do you want to select?", var_name)
    var.each do |work|
        if b == work.name
            $workout_object = work 
        end
    end
    options_after_add_lifts
end







greeting

login_prompt

#login

# initial_options
