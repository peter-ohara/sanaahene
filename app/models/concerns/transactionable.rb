# frozen_string_literal: true

module Transactionable
  extend ActiveSupport::Concern

  included do
    enum pnl_type: %i[uncategorized income expense transfer].index_with(&:to_s)

    scope :group_by_day, -> { all.sort_by { |tx| [tx.transaction_date, tx.created_at] }.group_by(&:transaction_day) }

    private

    def number_to_cedis(number)
      helpers.number_to_currency number, unit: '₵'
    end

    def helpers
      ActionController::Base.helpers
    end
  end
end
