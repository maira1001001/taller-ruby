class Person
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name=first_name
    @last_name=last_name
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def valid?
    !(@first_name.empty? || @last_name.empty?)
  end

end

