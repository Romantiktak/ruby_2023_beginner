# programming interface

require_relative 'route'
require_relative 'station'
require_relative 'train'

class Main

  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  def interface
    loop do
      puts "Выберите число, чтобы воспользоваться командой"
      puts "0. Выход из программы"
      puts "1. Создать поезд"
      puts "2. Создать маршрут"
      puts "3. Назначить маршрут поезду"
      puts "4. Добавить вагоны к поезду"
      puts "5. Отцепить вагоны от поезда"
      puts "6. Перемещать поезд по маршруту вперед"
      puts "7. Перемещать поезд по маршруту назад"
      puts "8. Просмотреть список станций"
      puts "9. Просмотреть список поездов на станции"
      puts "10. Управлять станциями на маршруте (добавлять, удалять)"
      puts "11. Создать станции"

      index_answer = gets.chomp.to_i

      break if index_answer.zero?
      set_command(index_answer)
    end
  end

  def set_command(answer)
    case answer
    when 1
      create_train
    when 2
      create_route
    when 3
      set_route_for_train
    when 4
      # add wagons to train
    when 5
      # detache wagons
    when 6
      # train goes ahead
    when 7
      # train goes back
    when 8
      # list tyains
    when 9
      # Choice route
      # add statioun to route
    when 10
      #
    when 11
      create_stantion
    else
      # nothing
    end
  end

  def create_train
    puts "Введите номер поезда"
    train_number = gets.chomp
    puts "Введите тип поезда: 1 - грузовой, 2 - пассажирский"
    train_type = gets.chomp.to_i
    if train_type == 1
      train_type = :freight
    elsif train_type == 2
      train_type == :passenger
    end
    puts "Введите номер поезда"

    @trains << Train.new(train_number, train_type)
      puts "Создали поезд #{@trains.last}"
  end

  def create_route
    display_list_stations
    puts "Выберите начальную станцию маршрута"
    start = gets.chomp.to_i
    puts "Выберите конечную станцию маршрута"
    finish = gets.chomp.to_i
    @routes << Route.new(@stations[start], @stations[finish])
    puts "Маршрут создан #{@routes.last}"
  end

  def create_stantion
    puts "Введите имя станции одним словом"
    @stations << gets.chomp.to_sym
    puts "Станция создана #{@stations.last}"
  end

  def display_list_trains
    i = 0
    @trains.each { |train|  puts "#{i+=1}. № #{train.number}  #{train.type}"}
  end

  def display_list_routes
    i = 0
    @routes.each { |route|  puts "#{i+=1}. #{route}"}
  end

  def display_list_stations
    i = 0
    @stations.each { |station|  puts "#{i+=1}. #{station}"}
  end

  def set_route_for_train
    display_list_trains
    puts "Выберите поезд"
    index_train = gets.chomp.to_i
    display_list_routes
    puts "Выберите маршрут, который назначите для поезда № #{@trains[index_train - 1].number}"
    index_route = gets.chomp.to_i
    @trains[index_train].make_route(@routes[index_route - 1])
  end
end

railroad = Main.new
railroad.interface
