require 'csv'

namespace :backfill do
  desc "Backfill with past data from csv file"

  task users: :environment do
    puts "Importing users..."
    user_count = 0
    CSV.foreach(ENV['CSV_FILE'], headers: true) do |row|
      User.find_or_create_by!(
        first_name: row['first_name'],
        last_name: row['last_name'],
        other_names: row['other_names'],
        email: row['email'],
        phone_number: row['phone_number']
      )
      user_count += 1
      puts "#{user_count} imported: #{row['email']}"
    end
    puts "Completed importing #{user_count} users!"
  end

  task electricity_meters: :environment do
    puts "Importing electricity_meters..."
    meter_count = 0
    CSV.foreach(ENV['CSV_FILE'], headers: true) do |row|
      ElectricityMeter.find_or_create_by!(
        name: row['Name'],
        meter_number: row['Meter Number'],
        reorder_point: row['Minimum Inventory Level'],
      )
      meter_count += 1
      puts "#{meter_count} imported: #{row['Name']}"
    end
    puts "Completed importing #{meter_count} meters!"
  end

  task electricity_entries: :environment do
    puts "Importing electricity_entries..."
    entry_count = 0
    CSV.foreach(ENV['CSV_FILE'], headers: true) do |row|
      if row['Entry Type'] == 'Purchase'
        ElectricityPurchase.find_or_create_by!(
          happened_at: row['Datetime'],
          meter: ElectricityMeter.find_by!(name: row['Meter']),
          amount: row['Purchased Amount'],
          attendee: User.find_by!(email: row['Attendee']),
          notes: row['Notes']
        )
      elsif row['Entry Type'] == 'Meter Balance'
        ElectricityBalance.find_or_create_by!(
          happened_at: row['Datetime'],
          meter: ElectricityMeter.find_by!(name: row['Meter']),
          amount: row['Meter Balance'],
          attendee: User.find_by!(email: row['Attendee']),
          notes: row['Notes']
        )
      end
      entry_count += 1
      puts "#{entry_count} imported: #{row['Datetime']} #{row['Attendee']} #{row['Entry Type']} #{row['Meter Balance']}"
    end
    puts "Completed importing #{entry_count} electricity_entries!"
  end

end
