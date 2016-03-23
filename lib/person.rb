require "pry"
require_relative "computer.rb"
require_relative "car.rb"

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
      "#{name} already has  computer named '#{computer_name}.' Please choose another name."
  end

  def sell_computer(computer_name)
    if @computer != nil
      @computers[@computer_names.index(computer_name)].owner = nil
      @computers.delete_at(@computer_names.index(computer_name))
      @computer_names.delete(computer_name)
      "#{name} sold #{@pronoun_gender == 'male' ? 'his' : 'hers'} computer! Bye-bye, #{old_name}!"
    else
      "#{name} doesn't have a computer to sell!"
    end
  end

  def car
    @car
  end

  def register_vehicle(car, plate_number)
    if @car == nil
      @car = car
      car.plate_number = plate_number
      car.owner = self
      "#{name} registered their new #{car.make} #{car.model}. Time to hit the road!"
    else
      "#{name}'s car is already registered!"
    end
  end

  def repaint_car(new_color)
    if @car != nil
      old_color = @car.color
      @car.color = new_color
      "#{name} repainted #{@pronoun_gender == 'male' ? 'his' : 'hers'} car from #{old_color} to #{@car.color}. Lookin' good!"
    else
      "#{name} doesn't have a car to paint!"
    end
  end

end

binding.pry
