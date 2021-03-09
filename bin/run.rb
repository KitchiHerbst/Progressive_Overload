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

def greeting
    name = Artii::Base.new :font => 'slant'
    puts name.asciify('Progressive Overload')
end

def login_prompt
    prompt = TTY::Prompt.new
    var = prompt.select("Please select an option", %w(login sign_up exit))
    if var == "login"
        login
    end
    if var == "sign_up"
        puts "sorry this feature is currently unavailable"
        login_prompt 
    else
        exit!
    end

end

def login
    lifter_name = Lifter.all.map {|lifter|lifter.name}
    prompt = TTY::Prompt.new 
    username = prompt.ask('What is your username?') 
    if lifter_name.include?(username)
        puts "Welcome #{username}!"
        initial_options
    else
        exit!
    end
    #lifter_object = nil
    

end

def initial_options
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
    #Workout.create(lifter_id: ,gym,_id: ,start_time: ,end_time: ,weights: ,cardio: )
    prompt = TTY::Prompt.new 
    gym_names = Gym.all.map {|gym|gym.name}
    gym = prompt.ask('What gym did you go to?')
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
        Workout.create(lifter_id: ,gym,_id: ,start_time: ,end_time: ,weights: weightb,cardio: cardiob )
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
