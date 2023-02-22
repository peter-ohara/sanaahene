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

    read_csv_file(args[:folder_path], 'electricity_entries') do |i, row|
      if row['Entry Type'] == 'Purchase'
        puts "#{row['Entry Type'].ljust(15)} #{row["Datetime"].to_date.iso8601} #{row['Meter'].rjust(15)} #{row['Purchased Amount'].rjust(9)}  #{row['Attendee']}..."
        ElectricityPurchase.find_or_create_by!(
          happened_at: row['Datetime'],
          meter: ElectricityMeter.find_by!(name: row['Meter']),
          amount: row['Purchased Amount'],
          attendee: User.find_by!(email: row['Attendee']),
          notes: row['Notes']
        )
      elsif row['Entry Type'] == 'Meter Balance'
        puts "#{row['Entry Type'].ljust(15)} #{row["Datetime"].to_date.iso8601} #{row['Meter'].rjust(15)} #{row['Meter Balance'].rjust(9)}  #{row['Attendee']}..."
        ElectricityBalance.find_or_create_by!(
          happened_at: row['Datetime'],
          meter: ElectricityMeter.find_by!(name: row['Meter']),
          amount: row['Meter Balance'],
          attendee: User.find_by!(email: row['Attendee']),
          notes: row['Notes']
        )
      end
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

    # read_csv_file(args[:folder_path], 'internet_entries') do |i, row|
    #   if row['Entry Type'] == 'Bought'
    #     puts "#{row['Entry Type'].ljust(15)} #{row["Datetime"].to_date.iso8601} #{row['Internet Account'].rjust(15)} #{row['Purchased Amount'].rjust(9)}  #{row['Attendee']}..."
    #     InternetPurchase.find_or_create_by!(
    #       happened_at: row['Datetime'],
    #       meter: InternetAccount.find_by!(name: row['Internet Account']),
    #       amount: row['Purchased Amount'],
    #       attendee: User.find_by!(email: row['Attendee']),
    #       notes: row['Notes']
    #     )
    #   elsif row['Entry Type'] == 'Used'
    #     puts "#{row['Entry Type'].ljust(15)} #{row["Datetime"].to_date.iso8601} #{row['Internet Account'].rjust(15)} #{row['Internet Account Balance'].rjust(9)}  #{row['Attendee']}..."
    #     InternetBalance.find_or_create_by!(
    #       happened_at: row['Datetime'],
    #       meter: InternetAccount.find_by!(name: row['Internet Account']),
    #       amount: row['Internet Account Balance'],
    #       attendee: User.find_by!(email: row['Attendee']),
    #       notes: row['Notes']
    #     )
    #   end
    # end

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