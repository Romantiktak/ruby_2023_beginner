require_relative 'wagon'

class WagonFreight

  attr_reader :type

  def initialize
    super
    @type = :freight
  end

end
