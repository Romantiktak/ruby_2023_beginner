# frozen_string_literal: true

require_relative 'wagon'
require_relative 'manufactured'

# класс пассажирских вагонов
class WagonPassenger < Wagon
  attr_reader :limit_places, :free_places

  def initialize(places = 56)
    super
    @type = :passenger
    @limit_places = places
    @free_places = places
  end

  def one_place_is_busy
    @free_places -= 1 if @free_places.positive?
  end

  def make_one_place
    @free_places += 1 if @free_places < limit_places
  end

  def busy_places
    limit_places - free_places
  end
end
