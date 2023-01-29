# Сумма покупок
# название товара, цену за единицу и кол-во купленного товара

products = {}
loop do
  puts "Введите название товара для заполнения или 'стоп' для прекращения"
  name_product = gets.chomp
  break if name_product == "стоп"
  puts "Введите цену единицы товара"
  price_product = gets.chomp.to_f
  puts "Введите количество товара"
  quantity_product = gets.chomp.to_f
  products[name_product.to_sym] = {}
  products[name_product.to_sym] = {:price => price_product, :quantity => quantity_product}
end

puts "-----------------"
total = 0
products.each do |name_product, detail_buy|
  sum = detail_buy[:price] * detail_buy[:quantity]
  puts "Товар #{name_product} позиция в чеке #{detail_buy} на общую сумму = #{sum}"
  total += sum
end

puts "Итоговая сумма чека: #{total}"
