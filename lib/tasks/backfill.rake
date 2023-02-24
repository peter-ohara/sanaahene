require 'csv'
require 'securerandom'


namespace :backfill do
  desc "Backfill with past data from csv file"

  task :from_csv, [:folder_path] =>  [:environment] do |t, args|
    read_csv_file(args[:folder_path], 'users') do |i, row|
      puts "#{row['email']}..."
      User.create_with(
        first_name: row['first_name'],
        last_name: row['last_name'],
        other_names: row['other_names'],
        email: row['email'],
        password: SecureRandom.hex(8),
        phone_number: row['phone_number']
      ).find_or_create_by!(
        first_name: row['first_name'],
        last_name: row['last_name'],
        other_names: row['other_names'],
        email: row['email'],
        phone_number: row['phone_number']
      )
    end

    read_csv_file(args[:folder_path], 'electricity_meters') do |i, row|
      puts "#{row['Name']}..."
      ElectricityMeter.find_or_create_by!(
        name: row['Name'],
        meter_number: row['Meter Number'],
        reorder_point: row['Minimum Inventory Level'],
        )
    end

    read_csv_file(args[:folder_path], 'internet_accounts') do |i, row|
      puts "#{row['Name']}..."
      InternetAccount.find_or_create_by!(
        name: row['Name'],
        usage_type: row['Usage Type'],
        account_number: row['Account Number'],
        phone_number: row['Phone number'],
        service_name: row['Service Name'],
        reorder_point: row['Minimum Inventory Level'],
        )
    end
  end
end


def read_csv_file(folder_path, name)
  filepath = "#{folder_path}/#{name}.csv"

  row_count = `wc -l #{filepath}`.to_i
  puts "Importing #{row_count} rows from #{name}..."

  i = 1
  CSV.foreach(filepath, headers: true) do |row|
    print "#{i}/#{row_count}  "
    yield i, row
    i += 1
  end

  puts
end