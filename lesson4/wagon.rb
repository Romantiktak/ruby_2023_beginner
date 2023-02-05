class Wagon
  attr_reader :type
  def initialize(type)
    @type = type
  end

  protected

  # Этот метод используются в других классах, его нельзя менять, поэтому он в protevcted
  # У меня проблема с наследованием этого метода в дочерних классах WagonPassenger & WagonFreight

  def type
    @type
  end
end
