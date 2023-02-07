require_relative 'wagon'

class WagonPassenger

  attr_reader :type

  def initialize
    super
    @type = :passenger
  end

end
