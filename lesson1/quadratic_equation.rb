# solving of quadro equals
# frozen_string_literal: true

puts 'Введите коэффициент уравнения для икса второй степени'
a = Float(gets.chomp)
puts 'Введите коэффициент уравнения для икса первой степени'
b = Float(gets.chomp)
puts 'Введите коэффициент уравнения для икса нулевой степени'
c = Float(gets.chomp)

d = b**2 - 4 * a * c

if a.zero?
  puts "Нельзя вычислить корень,если a = #{a}"
elsif d.positive?
  x = -b + Math.sqrt(d) / (2 * a)
  y = -b - Math.sqrt(d) / (2 * a)
  puts "Дискриминант = #{d}, корни #{x} и #{y}"
elsif d.zero?
  х = -b / (2 * a)
  puts "Дискриминант = #{d}, корeнь #{x}"
else
  puts "Дискриминант = #{d}, нет корней"
end
