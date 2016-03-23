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

  def add_customer_profile(customer)
    @customer_profiles.push(customer)
  end

  def add_response(info)
    @customer_responses.push(info)
  end

  def clear_responses
    @customer_responses.clear
  end

  def add_to_inventory(computer)
    @inventory.push(computer)
  end

  def remove_from_inventory(computer)
    @inventory.delete_at(@inventory.index(computer)) #deletes only the first instance of "computer" if there are multiple in stock
  end

  def require_yes_no(response)
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
      add_response(gets.chomp)
    end
    recall_responses
    response = require_yes_no(gets.chomp.downcase)
    if response == "yes"
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
      clear_responses unless correct
    end
    @current_customer = Person.new(name: @customer_responses[0], birthday: @customer_responses[1], pronoun_gender: @customer_responses[2], address: @customer_responses[3])
    @customer_profiles.push(@current_customer)
    clear_responses
    print "Okay, you're all set. "
  end

#------------------------------------------------------------------------------

  def search_for_customer(search_name)
    @current_customer = @customer_profiles.select{|profile| profile.name == search_name}.first
  end

  def greet_customer
    new_customer = false
    puts "Hello! Welcome to #{store_name}! Have you shopped with us before?(yes/no)"
    returning_customer = require_yes_no(gets.chomp.downcase)
    if returning_customer == "yes"
      print "Welcome back! "
      until @current_customer || new_customer
        puts "Whats your name?"
        if !search_for_customer(gets.chomp)
          puts "I'm sorry, we don't have anyone by that name. Would you like to try another?(yes/no)"
          try_again = require_yes_no(gets.chomp.downcase)
          new_customer = true if try_again == "no"
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
    puts "What would you like to do today?"
  end

end
