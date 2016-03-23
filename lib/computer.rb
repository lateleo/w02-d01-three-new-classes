#require "pry"

class Computer

  attr_accessor :name, :os
  attr_reader :housing, :cpu_speed, :memory, :disc_space

  def initialize (housing:, os:, cpu_speed:, memory:, disc_space:)
    @name = nil
    @housing = housing
    @os = os
    @cpu_speed = cpu_speed
    @memory = memory
    @disc_space = disc_space
  end

  def owner
    @owner
  end

  def owner=(owner)
    @owner = owner
  end

end
