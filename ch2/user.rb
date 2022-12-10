# frozen_string_literal: true

require_relative 'main'

a = Automobile.new
b = Automobile_expanded.new

a.print_info
b.print_info

c = Automobile_expanded.new(owner_fam: 'my friend', mileage: 240000)
c.print_info