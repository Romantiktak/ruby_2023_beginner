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
      puts "15. Вывести список вагонов у поезда"
      #puts "16. Занять место или объем в вагоне"

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
      create_passenger_wagons
    when 13
      create_freight_wagons
    when 14
      found_train
    when 15
      show_wagons_of_train
    else
      # nothing
    end
  end

  def create_train
    attempt = 0
    begin
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
    rescue StandardError => e
      attempt += 1
      puts "Описание ошибки создания поезда: #{e.message}"
      retry if attempt < 3
    ensure
      puts "Вы сделали #{attempt} неудачных попыток" if attempt >= 3
    end
  end

  def create_route
    display_list_stations
    puts "Выберите начальную станцию маршрута"
    start = gets.chomp.to_i
    puts "Выберите конечную станцию маршрута"
    finish = gets.chomp.to_i
    begin
      @routes << Route.new(@stations[start], @stations[finish])
      puts "Маршрут создан #{@routes.last}"
    rescue RuntimeError => e
      puts "#{e.message}"
    end

  end

  def create_stantion
    puts "Введите имя станции одним словом"
    @stations << gets.chomp.to_sym
    puts "Станция создана #{@stations.last}"
  end

  def display_list_trains
    #display_list_stations
    #puts "Выберите станцию"
    #num_station = gets.chomp.to_i
    #puts " номер станциии #{num_station + 1}"
    #@stations[num_station].each_with_index{|train, index|  puts "#{index}. № #{train.number}  #{train.type}"}
    @trains.each_with_index{|train, index|  puts "#{index}. № #{train.number}  #{train.type}"}
  end

  def display_list_routes
    @routes.each_with_index { |route, index| puts "#{index}. #{route}" }
  end

  def display_list_stations
    @stations.each_with_index { |station, index|  puts "#{index}. #{station}"}
  end

  def display_list_wagons
    display_list_trains
    puts "Выберите поезд"
    num_train = gets.chomp.to_i
    @trains[num_train].each_wagons{ |wagon|  puts "#{i}. #{wagon} -- #{wagon.type}"}
    #i = 0
    #@wagons.each { |wagon|  puts "#{i+=1}. #{wagon} -- #{wagon.type}"}
  end

  def set_route_for_train
    display_list_trains
    puts "Выберите поезд"
    index_train = gets.chomp.to_i
    display_list_routes
    puts "Выберите маршрут, который назначите для поезда № #{@trains[index_train].number}"
    index_route = gets.chomp.to_i
    @trains[index_train].make_route(@routes[index_route])
  end

  def create_passenger_wagons
    puts "Введите количество пассажирских вагонов"
    count  = gets.chomp.to_i
    puts "Введите количество мест в вагоне"
    places  = gets.chomp.to_i
    count.times { @wagons << WagonPassenger.new(places) }
  end

  def create_freight_wagons
    puts "Введите количество грузовых вагонов"
    count  = gets.chomp.to_i
    puts "Укажите с каким объемом создадутся вагоны"
    volume  = gets.chomp.to_i
    count.times { @wagons << WagonFreight.new(volume) }
  end

  def add_wagon_to_train
    puts "Выберите поезд"
    display_list_trains
    num_train = gets.chomp.to_i
    puts "Выберите вагон"
    display_list_wagons
    num_wagon = gets.chomp.to_i
    @trains[num_train].attach_wagon(@wagons[num_wagon])
  rescue

  end

  def detache_wagon_of_train
    puts "Выберите поезд"
    display_list_trains
    num_train = gets.chomp.to_i
    @trains[num_train].wagons.each { |wagon| puts "#{i}. #{wagon} -- #{wagon.type}" }
    puts "Выберите вагон"
    num_wagon = gets.chomp.to_i
    wagon_detached = @trains[num_train].wagons[num_wagon]
    @trains[num_train].dettach_wagon(wagon_detached)
  end

  def train_goes_ahead
    puts "Выберите поезд"
    display_list_trains
    num_train = gets.chomp.to_i
    puts "Станция отправления  #{@trains[num_train].current_station}"
    @trains[num_train - 1].go_ahead
    puts "Станция прибытия #{@trains[num_train].current_station}"
  end

  def train_goes_back
    puts "Выберите поезд"
    display_list_trains
    num_train = gets.chomp.to_i
    puts "Станция отправления  #{@trains[num_train].current_station}"
    @trains[num_train].go_back
    puts "Станция прибытия #{@trains[num_train].current_station}"
  end

  def add_station_to_route
    puts "Выберите маршрут"
    display_list_routes
    route_num = gets.chomp.to_i
    puts "Выберите станцию для добавления на маршрут"
    display_list_stations
    station_num = gets.chomp.to_i
    @routes[route_num].add_station(@stations[station_num])
  end

  def found_train
    puts "Ввудите номер поезда"
    num_train = gets.chomp
    train = @trains[0].class.superclass.find(num_train)
    puts "Найденный поезд: #{train}"
  end

  def show_wagons_of_train
    display_list_trains
    puts "выберите поезд"
    num_train = gets.chomp.to_i


  end

end

railroad = Main.new
railroad.interface
