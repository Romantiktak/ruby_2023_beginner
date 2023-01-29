# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

vowels = Hash.new
i = 1
for letter in ('a'..'z') do
  vowels[letter] = i if ['a', 'e', 'i', 'o', 'u', 'y'].include?(letter)
  i += 1
end

puts vowels
