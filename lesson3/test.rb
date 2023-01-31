# frozen_string_literal: true

require './route.rb'
require './station.rb'
require './train.rb'

station = []
station[0] = Station.new(:manchestr)
station[1] = Station.new(:london)
station[2] = Station.new(:wales)
station[3] = Station.new(:liverpool)
station[4] = Station.new(:winchester)
station[5] = Station.new(:oxford)
station[6] = Station.new(:york)

route = []
route[0] = Route.new(station[1], station[4])
route[1] = Route.new(station[2], station[3])

train = []
train[0] = Train.new("123XY", :freight, 24)
train[1] = Train.new("758BV", :passenger, 10)
train[2] = Train.new("125F", :passenger, 7)
train[3] = Train.new("671CB", :freight, 72)
train[4] = Train.new("666S", :passenger, 33)

puts "----------------"
station.each { |st| puts "#{st}" }
puts "----------------"
route.each { |ro| puts "#{ro} stations: #{ro.stations}" }
puts "----------------"
train.each { |tr| puts "Train #{tr} type: #{tr.type}" }
puts "----------------"

# методы route

puts "-------методы route START---------"

route[0].add_station station[3]
route[0].add_station station[2]
route[0].delete_station(station[2])
route[0].list_station

puts "-------методы route END---------"


# методы station

puts "-------методы station START---------"

station[0].arrival(train[0])
station[0].arrival(train[2])
station[0].arrival(train[3])
station[0].departude(train[0])
station[0].list_type_trains(:freight)
station[0].all_trains

puts "-------методы station END---------"

# методы train

puts "-------методы train START---------"

train[2].increase_speed 20
train[2].current_speed
train[2].stop
train[2].count_wagons
train[2].attach_wagon
train[2].dettach_wagon
train[2].make_route(route[1])
train[2].go_ahead
train[2].go_back

puts "-------методы train END---------"
