#require "pry"

class Car

  def initialize(options={})
    @make = options[:make]
    @model = options[:model]
    @year = options[:year]
    @color = options[:color]
    @plate_number = options[:plate_number]
  end

  def make
    @make.dup
  end

  def model
    @model.dup
  end

  def year
    @year.dup
  end

  def color
    @color.dup
  end

  def plate_number
    @plate_number.dup
  end

  def plate_number=(new_plate_number)
    @plate_number = new_plate_number
  end

  # only one setter, because everything else should stay the same.

end
