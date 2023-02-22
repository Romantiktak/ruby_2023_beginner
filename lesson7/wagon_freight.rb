require_relative 'wagon'
require_relative 'manufactured'

class WagonFreight < Wagon
  attr_reader :free_volume

  def initialize(volume_wagon = 100)
    super
    @type = :freight
    @limit_volume = volume_wagon
    @free_volume = volume_wagon
  end

  def fill_volume(volume = 10)
    @free_volume -= volume
  end

  def busy_volume
    @limit_volume - self.free_volume
  end



end
