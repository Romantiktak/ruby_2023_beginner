# треугольник может быть одновременно прямоугольным и равнобедренным,
# я пренебрегая этим и делаю
# один блок  условий if/else
# frozen_string_literal: true

puts 'Введите первую сторону треугольника'
a = gets.chomp.to_f
puts 'Введите вторую сторону треугольникa'
b = gets.chomp.to_f
puts 'Введите третью сторону треугольникa'
c = gets.chomp.to_f

sides = [a, b, c]
hipotenuza = sides.max
sides.delete(hipotenuza)

if sides[0]**2 + sides[1]**2 == hipotenuza**2
  puts 'Треугольник прямоугольный'
elsif a == b && a == c
  puts 'треугольник равносторонний'
elsif a == b || b == c || c == b
  puts 'треугольник равнобедренный'
else
  puts 'рандомный треугольник'
end
