# programming interface
require_relative 'manufactured'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'freight_train'
require_relative 'wagon'
require_relative 'wagon_freight'
require_relative 'wagon_passenger'


class Main

  attr_reader :wagons

  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
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
      puts "12. Создать пассажирские вагоны"
      puts "13. Создать грузовые вагоны"
      puts "14. Найти поезд по номеру"

      index_answer = gets.chomp.to_i

      break if index_answer.zero?
      set_command(index_answer)
    end
  end

  private

  def set_command(answer)
    case answer
    when 1
      create_train
    when 2
      create_route
    when 3
      set_route_for_train
    when 4
      add_wagon_to_train
    when 5
      detache_wagon_of_train
    when 6
      train_goes_ahead
    when 7
      train_goes_back
    when 8
      display_list_stations
    when 9
      add_station_to_route
    when 10
      add_station_to_route
    when 11
      create_stantion
    when 12
      create_passenger_train
    when 13
      create_freight_train
    when 14
      found_train
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
      @trains << FreightTrain.new(train_number)
    elsif train_type == 2
      @trains << PassengerTrain.new(train_number)
    end
    puts "Создали поезд #{@trains.last}"
  end

  def create_route
    display_list_stations
    puts "Выберите начальную станцию маршрута"
    start = gets.chomp.to_i
    puts "Выберите конечную станцию маршрута"
    finish = gets.chomp.to_i
    @routes << Route.new(@stations[start - 1], @stations[finish - 1])
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

  def display_list_wagons
    i = 0
    @wagons.each { |wagon|  puts "#{i+=1}. #{wagon} -- #{wagon.type}"}
  end

  def set_route_for_train
    display_list_trains
    puts "Выберите поезд"
    index_train = gets.chomp.to_i
    display_list_routes
    puts "Выберите маршрут, который назначите для поезда № #{@trains[index_train - 1].number}"
    index_route = gets.chomp.to_i
    @trains[index_train -1].make_route(@routes[index_route - 1])
  end

  def create_passenger_train
    puts "Введите количество пассажирских вагонов"
    count  = gets.chomp.to_i
    count.times { @wagons << WagonPassenger.new }
  end

  def create_freight_train
    puts "Введите количество грузовых вагонов"
    count  = gets.chomp.to_i
    count.times { @wagons << WagonFreight.new }
  end

  def add_wagon_to_train
    puts "Выберите поезд"
    display_list_trains
    num_train = gets.chomp.to_i
    puts "Выберите вагон"
    display_list_wagons
    num_wagon = gets.chomp.to_i
    @trains[num_train - 1].attach_wagon(@wagons[num_wagon - 1])
  end

  def detache_wagon_of_train
    puts "Выберите поезд"
    display_list_trains
    num_train = gets.chomp.to_i
    i = 0
    @trains[num_train - 1].wagons.each { |wagon| puts "#{i+=1}. #{wagon} -- #{wagon.type}" }
    puts "Выберите вагон"
    num_wagon = gets.chomp.to_i
    wagon_detached = @trains[num_train - 1].wagons[num_wagon - 1]
    @trains[num_train - 1].dettach_wagon(wagon_detached)
  end

  def train_goes_ahead
    puts "Выберите поезд"
    display_list_trains
    num_train = gets.chomp.to_i
    puts "Станция отправления  #{@trains[num_train - 1].current_station}"
    @trains[num_train - 1].go_ahead
    puts "Станция прибытия #{@trains[num_train - 1].current_station}"
  end

  def train_goes_back
    puts "Выберите поезд"
    display_list_trains
    num_train = gets.chomp.to_i
    puts "Станция отправления  #{@trains[num_train - 1].current_station}"
    @trains[num_train - 1].go_back
    puts "Станция прибытия #{@trains[num_train - 1].current_station}"
  end

  def add_station_to_route
    puts "Выберите маршрут"
    display_list_routes
    route_num = gets.chomp.to_i
    puts "Выберите станцию для добавления на маршрут"
    display_list_stations
    station_num = gets.chomp.to_i
    @routes[route_num - 1].add_station(@stations[station_num - 1])
  end

  def found_train
    puts "Ввудите номер поезда"
    num_train = gets.chomp
    train = @trains[0].class.superclass.find(num_train)
    puts "Найденный поезд: #{train}"
  end

end

railroad = Main.new
railroad.interface
