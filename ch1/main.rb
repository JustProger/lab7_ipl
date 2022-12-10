# frozen_string_literal: true

# Description of Main
class Main
  @f_file_name = "#{File.dirname(__FILE__)}/temp.txt"

  def self.check_line(str_new)
    raise RangeError, 'Для отрезка должны быть заданы координаты начала и конца!' unless str_new.size == 5
  end

  def self.check_circle(str_new)
    raise RangeError, 'Для окружности должны быть заданы координаты центра и радиус!' unless str_new.size == 4
    raise ArgumentError, 'Радиус должен быть больше нуля!' unless (str_new[-1]).positive?
  end

  def self.check_input(strs)
    strs.map do |str|
      str_arr = str.split.map(&:to_i)
      case str_arr[0]
      when 1
        check_line(str_arr)
      when 2
        check_circle(str_arr)
      else
        raise ArgumentError, 'Первое число должно быть 1 или 2!'
      end
      str_arr.join(' ')
    end
  end

  def self.write_to_f_file(strs)
    strs = check_input(strs)
    File.open(@f_file_name, 'a') do |file|
      strs.each { |str| file.puts(str) }
    end
  end

  def self.rewrite()
    File.open(@f_file_name, 'w') { |file| }
  end

  def self.print_f_file_data
    File.open(@f_file_name, 'r') do |file|
      puts '< -- Содержимое файла F, Begin -- >'
      file.each { |line| puts line }
      puts '< -- End -- >'
    end
  end

  def self.f_file_data
    File.open(@f_file_name, 'r') do |file|
      file.readlines.map(&:chomp)
    end
  end

  def self.process(strs) # Для тестов
    rewrite
    write_to_f_file(strs)
    f_file_data
  end

  def self.start() # Для пользователя
    loop do
      puts 'Что выполнить?'
      n = 0
      loop do
        n = gets.chomp.to_i
        break if n in 1..4
        puts 'Такой команды нет в списке!'
      end
      case n
      when 1
        puts 'Количество геометрических фигур:'
        n = gets.chomp.to_i
        puts "Введите #{n} строк c параметрами геометрических фигур:"
        strs = []
        n.times { strs << gets.chomp }
        write_to_f_file(strs)
      when 2
        print_f_file_data
      when 3
        rewrite
      when 4
        exit
      end 
    end 
  end
end
