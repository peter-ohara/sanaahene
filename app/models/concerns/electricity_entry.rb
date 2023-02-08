module ElectricityEntry
  extend ActiveSupport::Concern

  included do
    enum meter: {
      '4006': '4006',
      '4010': '4010',
      '4014': '4014',
      'CityDia': 'CityDia',
      'Brickhouse': 'Brickhouse',
    }

    attribute :meter, :string, default: '4006'

    after_initialize do
      self.item = Item.find_or_create_by! name: "Electricity"
    end

    def headline_text
      meter
    end

    def meter=(name)
      self.tags = [Tag.find_or_create_by!(name: name)]
    end

    def meter
      self.tags.first&.name
    end

    def trailing_content
      "GHS #{amount}"
    end
  end
end