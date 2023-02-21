module PurchaseEntryable
  extend ActiveSupport::Concern

  included do
    include Entryable

    def quantity_delta
      quantity
    end

    def quantity_balance
      quantity_previous_balance + quantity
    end

    def quantity_used
      0.to_d
    end

    def amount_delta
      amount
    end

    def amount_balance
      amount_previous_balance + amount
    end

    def amount_used
      0.to_d
    end
  end
end
