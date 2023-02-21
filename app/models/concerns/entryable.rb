module Entryable
  extend ActiveSupport::Concern

  included do

    def entry_date
      happened_at.to_date
    end

    def quantity_delta
      raise "method should be implemented in concrete class"
    end

    def quantity_balance
      raise "method should be implemented in concrete class"
    end

    def quantity_previous_balance
      return previous_entry.quantity_balance if previous_entry

      0.to_d
    end

    def amount_delta
      raise "method should be implemented in concrete class"
    end

    def amount_balance
      raise "method should be implemented in concrete class"
    end

    def amount_previous_balance
      return previous_entry.amount_balance if previous_entry

      0.to_d
    end

  end
end