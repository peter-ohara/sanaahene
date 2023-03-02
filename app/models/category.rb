# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :binance_import_lines
  has_many :ecobank_import_lines
  has_many :momo_import_lines
end
