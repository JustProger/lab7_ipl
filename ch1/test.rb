# frozen_string_literal: true

require 'minitest/autorun'
require 'faker'
require_relative 'main'

# Test func function
class TestFunc < MiniTest::Test
  def setup
    @input = ['2  50 10 2',
              '2 100    100 5',
              '1 0 1 0   5',
              '2 0   0    1',
              '1 -200    -200 -200 -99']
    @output = ['2 50 10 2',
               '2 100 100 5',
               '1 0 1 0 5',
               '2 0 0 1',
               '1 -200 -200 -200 -99']
    @input_range_error1 = ['2  50 10 2',
                           '2 100    100 5',
                           '1 0 1   5', # некорректный ввод: параметров должно быть 4 (отрезок)
                           '2 0   0    1',
                           '1 -200    -200 -200 -99']
    @input_range_error2 = ['2  50 2', # некорректный ввод: параметров должно быть 3 (окружность)
                           '2 100    100 5',
                           '1 0 1 0  5',
                           '2 0   0    1',
                           '1 -200    -200 -200 -99']
    @input_argument_error3 = ['2  50 10 2',
                              '2 100    100 -5', # некорректный ввод: радиус должен быть > 0
                              '1 0 1 0  5',
                              '2 0   0    1',
                              '1 -200    -200 -200 -99']
    @input_argument_error4 = ['2  50 10 2',
                              '20 100    100 5', # некорректный ввод: первый аргумент - целое число 1 или 2
                              '1 0 1 0  5',
                              '2 0   0    1',
                              '1 -200    -200 -200 -99']

    rand_int = Random.rand(3..6)
    @input_with_faker = (1..rand_int).map do
      figure_data = []
      figure_num = Random.rand(1..2)
      case figure_num
      when 1
        figure_data << 1
        4.times { figure_data << Faker::Number.within(range: -500..500) }
      when 2
        figure_data << 2
        2.times { figure_data << Faker::Number.within(range: -500..500) }
        figure_data << Faker::Number.within(range: 1..500)
      end
      figure_data.join(' ')
    end

    @output_with_faker = @input_with_faker
  end

  def test_error1
    assert_raises(RangeError) { Main.process(@input_range_error1) }
  end

  def test_error2
    assert_raises(RangeError) { Main.process(@input_range_error2) }
  end

  def test_error3
    assert_raises(ArgumentError) { Main.process(@input_argument_error3) }
  end

  def test_error4
    assert_raises(ArgumentError) { Main.process(@input_argument_error4) }
  end

  def test_process
    assert_equal @output, Main.process(@input)
  end

  def test_process_with_faker
    p @input_with_faker
    p @output_with_faker
    assert_equal @output_with_faker, Main.process(@input_with_faker)
  end
end
