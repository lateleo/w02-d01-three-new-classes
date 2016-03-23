#require "pry"

class Computer

  attr_accessor :name, :operating_system
  attr_reader :body_type, :cpu_speed, :memory, :disc_space

  def initialize (body_type:, operating_system:, cpu_speed:, memory:, disc_space:)
    @name = nil
    @body_type = body_type
    @operating_system = operating_system
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
