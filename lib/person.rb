require_relative "computer.rb"
require_relative "car.rb"

class Person

  attr_reader :birthday
  attr_accessor :name, :address

  def initialize(name:, birthday:, address:)
    @name = name
    @birthday = birthday
    @address = address
  end

  def computer
    @computer
  end

  def buy_computer(computer, computer_name = nil)
    if @computer == nil
      @computer = computer
      computer.owner = self
      computer.name = computer_name if computer_name != nil
      "#{name} bought a new #{computer.body_type} with a #{computer.cpu_speed} GHz CPU, #{computer.memory} GB of RAM, and #{computer.disc_space} GB of disc space! Yowzah!"
    else
      "#{name} already owns a computer!"
    end
  end

  def sell_computer
    if @computer != nil
      computer.owner = nil
      old_name = computer.name
      @computer = nil
      "#{name} sold their computer! Bye-bye, #{old_name}!"
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
      "#{name} registered their new #{car.make} #{car.model}! Time to hit the road!"
    else
      "#{name}'s car is already registered!"
    end
  end

  def repaint_car(new_color)
    if @car != nil
      old_color = @car.color
      @car.color = new_color
      "#{name} repainted their car from #{old_color} to #{@car.color}! Lookin' good!"
    else
      "#{name} doesn't have a car to paint!"
    end
  end

end
