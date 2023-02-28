# frozen_string_literal: true

class CsvImportService
  require 'csv'

  def call(file, model, mapping:, skip: 0)
    relevant_rows = File.readlines(file).drop(skip).join
    CSV.parse(relevant_rows, headers: true) do |row|
      row_hash = {}
      mapping.each do |key, value|
        row_hash[key] = row[value]
      end
      model.find_or_create_by!(row_hash)
    end
  end
end
