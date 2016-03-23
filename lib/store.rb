require_relative "person.rb"
require_relative "computer.rb"

class Store

  attr_reader :store_name, :questions
  attr_accessor :current_customer

  def initialize(:store_name)
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

#----------------------------------------------------------------
# Methods for new customers

  def recall_responses
    puts "Please take a moment to verify your information:"
    puts "Name: #{@customer_responses[0]}"
    puts "Birthday: #{@customer_responses[1]}"
    puts "Preferred gender pronouns: #{@customer_responses[2]}"
    puts "Address: #{@customer_responses[3]}"
    puts "Is that correct? Please type 'yes' or 'no'."
  end

  def customer_profile_loop
    @questions.each do |question| # Asks each question, and pushes the response to info
      puts question
      add_response(gets.chomp)
    end
    recall_responses
    if gets.chomp.downcase == "yes"
      true
    else
      print "Not a problem! Let's start over, shall we?"
      false
    end
  end

  def create_customer_profile
    puts "Well let's get you signed up!"
    correct = nil
    while !correct
      correct = customer_profile_loop(info)
      clear_responses unless correct
    end
    @current_customer = Person.new(name: info[0], birthday: info[1], pronoun_gender: info[2], address: info[3])
    @customer_profiles.push(@current_customer)
    clear_responses
    print "Alright, you're set. "
  end

#------------------------------------------------------------------------------

  def returning_customer(search_name)
    current_customer = @customer_profiles.select{|profile| profile.name == search_name}.first
  end

  def greet_customer
    new_customer = false
    puts "Hello! Welcome to #{store_name}! Have you shopped with us before?"
    if gets.chomp.downcase == "yes"
      puts "Welcome back! Whats your name?"
      while !@current_customer || !new_customer
        if !returning_customer(gets.chomp)
          puts "I'm sorry, we don't have anyone by that name. Would you like to try another?"
          new_customer = true if gets.chomp.downcase == "no"
        end
      end
    else
      new_customer = true
    end
    new_customer ? create_customer_profile : print "Excellent, you're already in our system! "
    puts "What would you like to do today?"
  end
