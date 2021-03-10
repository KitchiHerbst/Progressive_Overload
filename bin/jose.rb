# def sign_up
#     prompt = TTY::Prompt.new
#     result = prompt.collect do
#         key(:name).ask('What is your Name?')
#         key(:age).ask('How old are you?', convert: :int)
#         key(:height).ask('How tall are you in inches?', convert: :int)
#         key(:weight).ask('How much do you weight in lbs?', convert: :int)
#             key(:gender).ask('Gender?')
#     end
# end


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
      binding.pry
      
end