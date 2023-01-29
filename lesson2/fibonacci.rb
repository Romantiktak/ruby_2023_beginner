# Заполнить массив числами фибоначчи до 100

f = [0, 1]

loop do
  n = f.size
  new_num = f[n - 1] + f[n - 2]
  if new_num <= 100
    f[n] = new_num
  else
    break
  end
end
puts f
