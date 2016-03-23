
#require "pry"

class Car

  attr_reader :make, :model, :year
  attr_accessor :plate_number, :color

  def initialize(make:, model:, year:, color:)
    @make = make
    @model = model
    @year = year
    @color = color
    @plate_number = nil
  end

  def owner
    @owner
  end

  def owner=(owner)
    @owner = owner
  end

end
