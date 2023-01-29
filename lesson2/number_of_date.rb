=begin
 Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
 Найти порядковый номер даты, начиная отсчет с начала года.
 Учесть, что год может быть високосным.
 (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?) Алгоритм опредления високосного года: docs.microsoft.com
=end

puts "Введите день месяца"
day = gets.chomp.to_i
puts "Введите месяц числом"
month = gets.chomp.to_i
puts "Введите год"
year = gets.chomp.to_i

mounths = Hash.new
mounths[1] = 31
if year % 4 == 0
  mounths[2] = 29
else
  mounths[2] = 28
end
mounths[3] = 31
mounths[4] = 30
mounths[5] = 31
mounths[6] = 30
mounths[7] = 31
mounths[8] = 31
mounths[9] = 30
mounths[10] = 31
mounths[11] = 30
mounths[12] = 31

count = 0

for i in (1..month-1) do
 count = count + mounths[i]
end

count = count + day

puts "Порядковый номер даты = #{count}"
