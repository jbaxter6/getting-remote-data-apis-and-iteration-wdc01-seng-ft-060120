def welcome
  # puts out a welcome message here!
  puts "Hello welcome to our Star Wars character glossary"
end

def get_character_from_user
  puts "please enter a character name"
  gets.chomp()
  # use gets to capture the user's input. This method should return that input, downcased.
end
