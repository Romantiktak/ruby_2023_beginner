require_relative 'manufactured'

class Wagon
  include Manufactured::InstanceMethods
  attr_reader :type, :limit_places, :free_places

  def initialize(type, places = 0)
    @type = type
    @company
  end

end
