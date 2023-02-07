module ElectricityEntry
  extend ActiveSupport::Concern

  included do
    enum meter: {
      '4006': '4006',
      '4010': '4010',
      '4014': '4014',
      'CityDia': 'citydia',
    }

    attribute :meter, :string, default: '4006'

    after_initialize do
      self.item = Item.find_or_create_by! name: "Electricity"
    end

    def headline_text
      meter
    end

    def trailing_content
      "GHS #{amount}"
    end
  end
end