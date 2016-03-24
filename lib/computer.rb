#require "pry"

class Computer

  attr_accessor :name
  attr_reader :condition, :product_name, :housing, :os, :cpu_speed, :memory, :disc_space

  def initialize (product_name:, condition:, housing:, os:, cpu_speed:, memory:, disc_space:)
    @name = nil
    @product_name = product_name
    @condition = condition
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
