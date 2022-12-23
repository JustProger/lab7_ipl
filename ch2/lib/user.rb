# frozen_string_literal: true

require_relative 'main'

a = Automobile.new
b = AutomobileExpanded.new

a.print_info
b.print_info

c = AutomobileExpanded.new(owner_fam: 'my friend', mileage: 240_000)
c.print_info
