# frozen_string_literal: true

module Transactionable
  extend ActiveSupport::Concern

  included do
    enum pnl_type: %i[uncategorized income expense transfer].index_with(&:to_s)

    belongs_to :category, optional: true

    delegate :account_type, to: :category, allow_nil: true
    delegate :name, to: :category, prefix: true, allow_nil: true

    scope :group_by_day, -> { all.sort_by(&:sort_order).reverse.group_by(&:transaction_day) }

    def sort_order
      [transaction_date, created_at]
    end

    private

    def number_to_cedis(number)
      helpers.number_to_currency number, unit: '₵'
    end

    def helpers
      ActionController::Base.helpers
    end
  end
end
