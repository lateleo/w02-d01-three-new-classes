require_relative "person.rb"

def personal_info_loop(info)
  print "What's your name? "
  info.push(gets.chomp)
  print "What is your birthday? "
  info.push(gets.chomp)
  print "Regarding gender pronouns, do you prefer male or female? "
  info.push(gets.chomp)
  print "Lastly, what is your address? "
  info.push(gets.chomp)
  print "Please take a moment to verify your information: \n name: #{info[0]} \n birthday: #{info[1]} \n preferred pronoun gender: #{info[2]} \n address: #{info[3]} \n Is that correct? please type 'yes' or 'no'. "
end

def get_personal_info
  correct = nil
  info = []
  print "Hello! Welcome to the store! Why don't you tell us about yourself? \n"
  while !correct
    personal_info_loop(info)
    gets.chomp.downcase == "yes" ? correct = true : correct = false
    print "Not a problem! Let's start over, shall we? \n"
    info.clear
  end
  person = Person.new(name: info[0], birthday: info[1], pronoun_gender: info[2], address: info[3])
  print "Fantastic! \n \n"
end

def offer_menu
  
end
get_personal_info
