module ElectricityEntry
  extend ActiveSupport::Concern

  included do

    after_initialize do
      self.item = Item.find_or_create_by! name: "Electricity"
    end

    def headline_text
      meter.name
    end

    def trailing_content
      "GHS #{amount}"
    end

    def previous_balance
      previous_electricity_balance = self.meter.inventory_entries
                                         .where(happened_at: ...self.happened_at)
                                         .order(:happened_at)
                                         .last
      previous_electricity_balance&.amount || 0.to_d
    end
  end
end