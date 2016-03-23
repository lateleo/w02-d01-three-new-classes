require_relative "../lib/person.rb"
require_relative "test_helper.rb"

class PersonTest < Minitest::Test

  def test_can_be_created_under_normal_circustances
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    refute_nil(person)
  end

  def test_name_getter
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    assert_equal("Art Burtch", person.name)
  end

  def test_birthday_getter
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    assert_equal("8/22/1991", person.birthday)
  end

  def test_address_getter
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    assert_equal("922 S 11th St", person.address)
  end

  def test_computers_getter
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    assert_equal([], person.computers)
  end

  def test_buy_computer_accepts_valid
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    assert_equal("Art Burtch bought a new laptop with a 2.5 GHz CPU, 16 GB of RAM, and 512 GB of disc space! Yowzah!", person.buy_computer(computer, "Legion"))
  end

  def test_buy_computer_rejects_duplicate_name
   person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
   computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
   person.buy_computer(computer, "Legion")
   replacement = Computer.new(housing: "desktop", os: "Windows 10", cpu_speed: 4.0, memory: 16, disc_space: 1024)
   assert_equal("Art Burtch already has a computer named 'Legion'. Please choose another name.", person.buy_computer(replacement, "Legion"))
  end

  def test_buy_computer_changes_person_attribute
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer, "Legion")
    refute_nil(person.computers[0])
  end

  def test_buy_computer_changes_computer_attribute
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer, "Legion")
    refute_nil(computer.owner)
  end

  def test_sell_computer_accepts_valid_male
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer, "Legion")
    assert_equal("Art Burtch sold his computer! Bye-bye, Legion!", person.sell_computer("Legion"))
  end

  def test_sell_computer_accepts_valid_female
    person = Person.new(name: "Meredith Lee", birthday: "4/12/1992", pronoun_gender: "female", address: "922 S 11th St")
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer, "Legion")
    assert_equal("Meredith Lee sold her computer! Bye-bye, Legion!", person.sell_computer("Legion"))
  end

  def test_sell_computer_rejects_nil
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    assert_equal("Art Burtch doesn't have a computer to sell!", person.sell_computer("Legion"))
  end

  def test_sell_computer_changes_person_attribute
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer, "Legion")
    person.sell_computer("Legion")
    assert_equal([], person.computers)
  end

  def test_sell_computer_changes_computer_attribute
    person = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    person.buy_computer(computer, "Legion")
    person.sell_computer("Legion")
    assert_nil(computer.owner)
  end

end
