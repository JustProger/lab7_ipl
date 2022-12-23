# frozen_string_literal: true

require 'main'

RSpec.describe AutomobileExpanded do
  it 'should be instance of class' do
    auto = Automobile.new
    auto.class.to_s.should == 'Automobile'
    superauto = AutomobileExpanded.new
    superauto.class.to_s.should == 'AutomobileExpanded'
  end

  it 'should inherit behavior from Automobile' do
    expect(AutomobileExpanded.superclass).to eq(Automobile)
    expect(Automobile.subclasses).to eq([AutomobileExpanded])
  end

  it 'should print the same default data as Automobile' do
    # superauto = AutomobileExpanded.new(number: :m671ai21, car_model: :ferrari, owner_fam: 'my friend', year_of_issue: 2015, mileage: 240_000)
    auto = Automobile.new
    superauto = AutomobileExpanded.new
    expect { superauto.print_year_of_issue }.to output(auto.print_year_of_issue).to_stdout
    expect { superauto.print_mileage }.to output(auto.print_mileage).to_stdout
    expect { superauto.print_average_mileage }.to output(auto.print_average_mileage).to_stdout
  end

  it 'should print the same given data as Automobile' do
    auto = Automobile.new(year_of_issue: 2015, mileage: 240_000)
    superauto = AutomobileExpanded.new(year_of_issue: 2015, mileage: 240_000)
    expect { superauto.print_year_of_issue }.to output(auto.print_year_of_issue).to_stdout
    expect { superauto.print_mileage }.to output(auto.print_mileage).to_stdout
    expect { superauto.print_average_mileage }.to output(auto.print_average_mileage).to_stdout
  end
end
