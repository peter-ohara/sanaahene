# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


def load_fixtures
  Rake::Task["db:fixtures:load"].invoke
end

def confirmed?
  return true if ENV["CONFIRM_FIXTURE_LOAD"]

  puts <<~EXPLAIN
ERROR!

Loading fixtures into the database will clobber all existing data in the tables.
To confirm this is what you want to do, set the environment variable CONFIRM_FIXTURE_LOAD

$ CONFIRM_FIXTURE_LOAD=yeppers bin/rails db:seed
  EXPLAIN

  false
end

load_fixtures if confirmed?

meter = ElectricityMeter.find_or_create_by!(name: '4006', meter_number: 'P171010830', reorder_point: '100.00')
john = User.find_or_create_by!(
  first_name: "John",
  last_name: "Smith",
  other_names: "Adenuga",
  email: "user87@test.com",
  phone_number: "+233123456789",
)
ElectricityPurchase.find_or_create_by!(meter: meter, attendee: john, happened_at: '2023-02-01 07:00:00', amount: 100)

ElectricityBalance.find_or_create_by!(meter: meter, attendee: john, happened_at: '2023-02-01 08:00:00', amount: 70)
ElectricityBalance.find_or_create_by!(meter: meter, attendee: john, happened_at: '2023-02-02 08:00:00', amount: 38)
ElectricityBalance.find_or_create_by!(meter: meter, attendee: john, happened_at: '2023-02-03 08:00:00', amount: 9)

ElectricityPurchase.find_or_create_by!(meter: meter, attendee: john, happened_at: '2023-02-04 07:00:00', amount: 100)
ElectricityBalance.find_or_create_by!(meter: meter, attendee: john, happened_at: '2023-02-04 08:00:00', amount: 109)

ElectricityBalance.find_or_create_by!(meter: meter, attendee: john, happened_at: '2023-02-05 08:00:00', amount: 84)
ElectricityBalance.find_or_create_by!(meter: meter, attendee: john, happened_at: '2023-02-06 08:00:00', amount: 47)
ElectricityBalance.find_or_create_by!(meter: meter, attendee: john, happened_at: '2023-02-07 08:00:00', amount: 37)

