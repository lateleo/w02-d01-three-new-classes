#require "pry"

class Computer

  def initialize (options={})
    @name = options[:name]
    @operating_system = options[:operating_system]
    @cpu_speed = options[:cpu_speed]
    @memory = options[:memory]
    @disc_space = options[:disc_space]
  end

  def name
    @name.dup
  end

  def name=(new_name)
    @name = new_name
  end
# Only one setter, because everything else doesn't change.

  def operating_system
    @operating_system.dup
  end

  def cpu_speed
    @cpu_speed.dup
  end

  def memory
    @memory.dup
  end

  def disc_space
    @disc_space.dup
  end

end
