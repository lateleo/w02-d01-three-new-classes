require_relative "../lib/person.rb"
require_relative "test_helper.rb"

class PersonTest < Minitest::Test

  def test_can_be_created_under_normal_circustances
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    refute_nil(person)
  end

  def test_name_getter
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    assert_equal("Art Burtch", person.name)
  end

  def test_birthday_getter
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    assert_equal("8/22/1991", person.birthday)
  end

  def test_address_getter
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    assert_equal("922 S 11th St", person.address)
  end

  def test_computer_getter
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    assert_nil(person.computer)
  end

  def test_buy_computer_accepts_valid
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    computer = Computer.new(body_type: "laptop", operating_system: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    assert_equal("Art Burtch bought a new laptop with a 2.5 GHz CPU, 16 GB of RAM, and 512 GB of disc space! Yowzah!", person.buy_computer(computer))
  end

  def test_buy_computer_rejects_multiple
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    computer = Computer.new(body_type: "laptop", operating_system: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer)
    replacement = Computer.new(body_type: "desktop", operating_system: "Windows 10", cpu_speed: 4.0, memory: 16, disc_space: 1024)
    assert_equal("Art Burtch already owns a computer!", person.buy_computer(replacement))
  end

  def test_buy_computer_changes_person_attribute
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    computer = Computer.new(body_type: "laptop", operating_system: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer)
    refute_nil(person.computer)
  end

  def test_buy_computer_changes_computer_attribute
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    computer = Computer.new(body_type: "laptop", operating_system: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer)
    refute_nil(computer.owner)
  end

  def test_sell_computer_accepts_valid
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    computer = Computer.new(body_type: "laptop", operating_system: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer, "Legion")
    assert_equal("Art Burtch sold their computer! Bye-bye, Legion!", person.sell_computer)
  end

  def test_sell_computer_accepts_no_name
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    computer = Computer.new(body_type: "laptop", operating_system: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer)
    assert_equal("Art Burtch sold their computer!", person.sell_computer)
  end

  def test_sell_computer_rejects_nil
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    assert_equal("Art Burtch doesn't have a computer to sell!", person.sell_computer)
  end

  def test_sell_computer_changes_person_attribute
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    computer = Computer.new(body_type: "laptop", operating_system: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer, "Legion")
    person.sell_computer
    assert_nil(person.computer)
  end

  def test_sell_computer_changes_computer_attribute
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    computer = Computer.new(body_type: "laptop", operating_system: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer, "Legion")
    person.sell_computer
    assert_nil(computer.owner)
  end

  def test_register_vehicle_accepts_valid
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    assert_equal("Art Burtch registered their new Toyota Camry! Time to hit the road!", person.register_vehicle(car, "20-AP21"))
  end

  def test_register_vehicle_rejects_already_registered
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    person.register_vehicle(car, "20-AP21")
    assert_equal("Art Burtch's car is already registered!", person.register_vehicle(car, "20-AP21"))
  end

  def test_register_vehicle_changes_person_attribute
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    person.register_vehicle(car, "20-AP21")
    refute_nil(person.car)
  end

  def test_register_vehicle_changes_car_attribute
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    person.register_vehicle(car, "20-AP21")
    refute_nil(car.owner)
  end

  def test_repaint_car_accepts_valid
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    person.register_vehicle(car, "20-AP21")
    assert_equal("Art Burtch repainted their car from red to black! Lookin' good!", person.repaint_car("black"))
  end

  def test_repaint_car_rejects_nil
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    assert_equal("Art Burtch doesn't have a car to paint!", person.repaint_car("black"))
  end

  def test_repaint_car_accepts_valid
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", address: "922 S 11th St")
    car = Car.new(make: "Toyota", model: "Camry", year: 2010, color: "red")
    person.register_vehicle(car, "20-AP21")
    person.repaint_car("black")
    assert_equal("black", car.color)
  end

end
