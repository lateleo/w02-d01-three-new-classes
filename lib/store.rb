require_relative "person.rb"
require_relative "computer.rb"

class Store

  attr_reader :store_name, :questions
  attr_accessor :current_customer

  def initialize(store_name:)
    @store_name = store_name
    @inventory = []
    @questions = ["What's your name?",
                  "What is your birthday?",
                  "Regarding gender pronouns, do you prefer male or female?",
                  "Lastly, what is your address?"]
    @customer_responses = []
    @customer_profiles = []
    @current_customer = nil
  end

#----------------------------------------------------------------
#general purpose

  def add_to_inventory(computer)
    @inventory.push(computer)
  end

  def remove_from_inventory(computer)
    @inventory.delete_at(@inventory.index(computer)) #deletes only the first instance of "computer" if there are multiple in stock
  end

  def require_yes_no #stalls until user responds with either "yes" or "no"
    response = gets.chomp.downcase
    while !["yes", "no"].include?(response)
      puts "Please respond with either 'yes' or 'no'."
      response = gets.chomp.downcase
    end
    response
  end

#----------------------------------------------------------------
# Methods for new customers

  def recall_responses
    puts "Please take a moment to verify your information:"
    puts "Name: #{@customer_responses[0]}"
    puts "Birthday: #{@customer_responses[1]}"
    puts "Preferred gender pronouns: #{@customer_responses[2]}"
    puts "Address: #{@customer_responses[3]}"
    puts "Is that correct?(yes/no)."
  end

  def customer_profile_loop
    @questions.each do |question| # Asks each question, and pushes the response to info
      puts question
      @customer_responses.push(gets.chomp)
    end
    recall_responses
    if require_yes_no == "yes"
      true
    else
      print "Not a problem! Let's start over, shall we? "
      false
    end
  end

  def create_customer_profile
    print "Well let's get you signed up! "
    correct = nil
    while !correct
      correct = customer_profile_loop
      @customer_responses.clear unless correct
    end
    @current_customer = Person.new(name: @customer_responses[0], birthday: @customer_responses[1], pronoun_gender: @customer_responses[2], address: @customer_responses[3])
    @customer_profiles.push(@current_customer)
    @customer_responses.clear
    print "Okay, you're all set. "
  end

#------------------------------------------------------------------------------

  def search_for_customer(search_name)
    @current_customer = @customer_profiles.select{|profile| profile.name == search_name}.first
  end

  def greet_customer
    new_customer = false
    puts "Hello! Welcome to #{store_name}! Have you shopped with us before?(yes/no)"
    if require_yes_no == "yes"
      print "Welcome back! "
      until @current_customer || new_customer
        puts "Whats your name?"
        if !search_for_customer(gets.chomp)
          puts "I'm sorry, we don't have anyone by that name. Would you like to try another?(yes/no)"
          new_customer = true if require_yes_no == "no"
        end
      end
    else
      new_customer = true
    end
    if new_customer
      create_customer_profile
    else
      print "Excellent, you're already in our system! "
    end
  end
#-----------------------------------------------------------------------------
  def require_new_used
    response = gets.chomp.downcase
    while !["new", "used"].include?(response)
      puts "Please respond with either 'new' or 'used'."
      response = gets.chomp.downcase
    end
    response
  end

  def search_list_for_choice(list)
    choice = list.select{|model| model.product_name == gets.chomp}.first
    while !choice
      puts "I'm sorry, I don't see that one on here. Which one was it?"
      choice = list.select{|model| model.product_name == gets.chomp}.first
    end
    choice
  end

  def generate_list_from_condition_preference(preference)
    puts "I see. Well, here's a list of information on all of our #{preference} models:"
    list = @inventory.select{|model| model.condition = preference}
    list.each do |model|
      puts "- #{model.product_name}: #{model.housing} with a #{model.cpu_speed} processor, #{model.memory} GB of RAM, and #{model.disc_space} GB of disc space"
    end
    puts "Do you see anything that interests you?(yes/no)"
  end

  def help_customer_buy
    puts "Great! are you interested in our new or used models?"
    preference = require_new_used
    generate_list_from_condition_preference(preference)
    if require_yes_no == "yes"
      puts "Which one?"
      search_list_for_choice
      puts "Ah, yes, that is a very good model." #more here soon
    else
      puts "Well, I'm sorry to hear that. Would you like to look at our #{preference == "new" ? 'used' : 'new'} models?(yes/no)"
    end








#----------------------------------------------------------------------------
  def list_options
    needs_help = true
    counter = 0
    while needs_help
      counter += 1
      puts "Are you interested in buying a computer today?(yes/no)"
      if require_yes_no == "yes"
        counter = 0
        help_customer_buy
      else
        puts "Oh, then do you have a computer you would like to sell?(yes/no)"
        if require_yes_no == "yes"
          counter = 0
          puts "Unfortunately, our appraiser is not in today. He should be back tomorrow, though."
        else
          puts "Well, those are all the services that we offer. Are you sure there's something I can help you with?(yes/no)"
          if require_yes_no == "yes"
            if counter > 3
              puts "I've had just about enough of you. Get out of my store, and don't come back until you've made up your mind!"
              return
            else
              print "Well, then, what is it? "
            end
          else
            needs_help = false
          end
        end
      end
    end
    puts "Well, thanks for stopping by!"
  end
end
