# frozen_string_literal: true

require_relative 'main'

puts 'Приняты следующие соглашения:'
puts '1. для отрезка последовательность состоит из 5 чисел: первое число'
puts '— 1, четыре остальных задают концы отрезка (x1;y1) и (x2;y2) соответственно;'
puts '2. для окружности задается четыре числа: первое число — 2, осталь-'
puts 'ные координаты центра (x;y) и радиус r соответственно.'
puts 'Все числа натуральные!'
puts 'Доступные команды'
puts '1 - Записать в файл n строк.'
puts '2 - Вывести данные файла'
puts '3 - Очистить файл'
puts '4 - Выйти из программы'
Main.start
