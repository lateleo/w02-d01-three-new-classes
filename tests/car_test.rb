require_relative "../lib/car.rb"
require_relative "test_helper.rb"

class CarTest < Minitest::Test

  def test_can_be_created_under_normal_circustances
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    refute_nil(car)
  end

  def test_make_getter
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    assert_equal("Toyota", car.make)
  end

  def test_model_getter
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    assert_equal("Camry", car.model)
  end

  def test_year_getter
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    assert_equal(2010, car.year)
  end

  def test_color_getter
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    assert_equal("red", car.color)
  end

  def test_color_setter
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    car.color = "black"
    assert_equal("black", car.color)
  end

  def test_plate_number_setter
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    car.plate_number = "20-AP21"
    assert_equal("20-AP21", car.plate_number)
  end

  def test_owner_getter
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    assert_nil(car.owner)
  end

  def test_owner_setter
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    car.owner = "Art Burtch"
    assert_equal("Art Burtch", car.owner)
  end

end
