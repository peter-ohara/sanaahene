module BalanceEntryable
  extend ActiveSupport::Concern

  included do
    include Entryable

    def quantity_delta
      quantity - quantity_previous_balance
    end

    def quantity_balance
      quantity
    end

    def quantity_used
      return 0.to_d if previous_entry.blank?

      -quantity_delta
    end

    def amount_delta
      amount - amount_previous_balance
    end

    def amount_balance
      amount
    end

    def amount_used
      return 0.to_d if previous_entry.blank?

      -amount_delta
    end
  end
end
