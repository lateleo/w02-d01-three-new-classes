require_relative "../lib/computer.rb"
require_relative "test_helper.rb"

class ComputerTest < Minitest::Test
  def test_can_be_created_under_normal_circustances
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    refute_nil(computer)
  end

  def test_housing_getter
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    assert_equal("laptop", computer.housing)
  end

  def test_os_getter
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    assert_equal("Mac OS X", computer.os)
  end

  def test_cpu_speed_getter
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    assert_equal(2.5, computer.cpu_speed)
  end

  def test_memory_getter
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    assert_equal(16, computer.memory)
  end

  def test_disc_space_getter
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    assert_equal(512, computer.disc_space)
  end

  def test_owner_getter
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    assert_nil(computer.owner)
  end

  def test_owner_setter
    computer = Computer.new(housing: "laptop", os: "Mac OS X", cpu_speed: 2.5, memory: 16, disc_space: 512)
    computer.owner = "Art Burtch"
    assert_equal("Art Burtch", computer.owner)
  end

end
