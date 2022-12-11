# frozen_string_literal: true

# Description of Automobile
class Automobile
  attr_reader :year_of_issue, :mileage

  def initialize(year_of_issue: 2017, mileage: 100_000)
    @year_of_issue = year_of_issue
    @mileage = mileage
  end

  def print_info
    puts "Информация об экземпляре класса #{self.class}"
    print ' --- Год выпуска: '
    print_year_of_issue
    print ' --- Пробег: '
    print_mileage
    print ' --- Средний пробег: '
    print_average_mileage
  end

  def print_average_mileage
    puts average_mileage
  end

  def print_year_of_issue
    puts @year_of_issue
  end

  def print_mileage
    puts @mileage
  end

  private

  def average_mileage
    @mileage / (Time.new.year - @year_of_issue).to_f
  end
end

# Description of AutomobileExpanded
class AutomobileExpanded < Automobile
  attr_reader :number, :car_model, :owner_name

  def initialize(number: :а123бв06, car_model: :bmw, owner_fam: 'Owner\'s name', year_of_issue: 2017, mileage: 100_000)
    super(year_of_issue: year_of_issue, mileage: mileage)
    @number = number
    @car_model = car_model
    @owner_fam = owner_fam
  end

  def print_info
    super
    print ' --- Номер: '
    print_number
    print ' --- Марка: '
    print_car_model
    print ' --- Владелец: '
    print_owner_fam
  end

  def print_number
    puts "\033[3;4;36m#{@number.to_s}\033[0m"
  end

  def print_car_model
    puts @car_model.to_s
  end

  def print_owner_fam
    puts "\033[3;34m#{@owner_fam}\033[0m"
  end
end
