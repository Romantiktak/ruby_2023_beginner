# Сделать хеш, содержащий месяцы и количество дней в месяце.
# цикле выводить те месяцы, у которых количество дней ровно 30

mounths = Hash.new
mounths[:jan] = 31
mounths[:feb] = 28
mounths[:mar] = 31
mounths[:apr] = 30
mounths[:may] = 31
mounths[:jun] = 30
mounths[:jul] = 31
mounths[:aug] = 31
mounths[:sep] = 30
mounths[:oct] = 31
mounths[:nov] = 30
mounths[:dec] = 31

mounths.each do |mounth, days|
  puts mounth if days == 30
end
