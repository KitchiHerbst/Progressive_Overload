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


# result = prompt.collect do
#     key(:name).ask('Name?')
  
#     key(:age).ask('Age?', convert: :int)
  
#     key(:address) do
#       key(:street).ask('Street?', required: true)
#       key(:city).ask('City?')
#       key(:zip).ask('Zip?', validate: /\A\d{3}\Z/)
#     end
#   end
  # =>
  # {:name => "Piotr", :age => 30, :address => {:street => "Street", :city => "City", :zip => "123"}}