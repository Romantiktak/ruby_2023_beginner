# frozen_string_literal: true

require 'route.rb'
require 'station.rb'
require 'train.rb'

station1 = Station.new(:london)
station2 = Station.new(:wales)
station3 = Station.new(:liverpool)
station4 = Station.new(:winchester)
station5 = Station.new(:oxford)
station6 = Station.new(:york)

route1 = Route.new(station1, station4)
route2 = Route.new(station2, station3)

train1 = Train.new("758BV", :passenger, 10)
train2 = Train.new("125F", :passenger, 7)
train3 = Train.new("671CB", :freight, 72)
train4 = Train.new("666S", :passenger, 33)
