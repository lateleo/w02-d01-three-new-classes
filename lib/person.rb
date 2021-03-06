require "pry"
require_relative "computer.rb"

class Person

  attr_reader :birthday
  attr_accessor :name, :address, :pronoun_gender

  def initialize(name:, birthday:, pronoun_gender:, address:)
    @name = name
    @birthday = birthday
    @pronoun_gender = pronoun_gender
    @address = address
    @computers = []
    @computer_names = []
  end

  def computers
    @computers
  end

  def buy_computer(computer, computer_name)
    if !@computer_names.include?(computer_name)
      @computers.push(computer)
      @computer_names.push(computer_name)
      computer.owner = self
      computer.name = computer_name
      "#{name} bought a new #{computer.housing} with a #{computer.cpu_speed} GHz CPU, #{computer.memory} GB of RAM, and #{computer.disc_space} GB of disc space! Yowzah!"
    else
      "#{name} already has a computer named '#{computer_name}'. Please choose another name."
    end
  end

  def sell_computer(computer_name)
    if @computers != []
      @computers[@computer_names.index(computer_name)].owner = nil
      @computers.delete_at(@computer_names.index(computer_name))
      @computer_names.delete(computer_name)
      "#{name} sold #{@pronoun_gender == 'male' ? 'his' : 'her'} computer! Bye-bye, #{computer_name}!"
    else
      "#{name} doesn't have a computer to sell!"
    end
  end

end

#binding.pry
