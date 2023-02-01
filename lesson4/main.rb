# programming interface

require_relative 'route'
require_relative 'station'
require_relative 'train'

class Main

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

      index_answer = gets.chomp.to_i

      break if index_answer.zero?
      set_command(index_answer)
    end
  end

  def set_command(answer)
    case answer
    when answer == 1
      self.create_train
    when answer == 2
      # create route
    when answer == 3
      # train.route = route
    when answer == 4
      # add wagons to train
    when answer == 5
      # detache wagons
    when answer == 6
      # train goes ahead
    when answer == 7
      # train goes back
    when answer == 8
      # list tyains
    when answer == 9
      # Choice route
      # add statioun to route
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

    train = Train.new(train_number, train_type)
      puts "Создали поезд #{train}"
  end
end

railroad = Main.new
railroad.interface
