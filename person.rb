class Person

  def initialize(options={})
    @name = options[:name]
    @birthday = options[:birthday]
    @ethnicity = options[:ethnicity]
    @gender = options[:gender]
    @address = options[:address]
  end

  def name
    @name.dup
  end

  def name=(new_name)
    @name = new_name
  end

  def birthday
    @birthday.dup
  end

  def ethnicity
    @ethnicity.dup
  end

# no setters for birthday or ethnicity, because those shouldn't change.

  def gender
    @gender.dup
  end

  def gender=(new_gender)
    @gender = new_gender
  end

  def address
    @address.dup
  end

  def address=(new_address)
    @address = new_address
  end

end
