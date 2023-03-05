# frozen_string_literal: true

class CategorizeController < ApplicationController
  def index
    @transactions = search_form.transactions.sort_by(&:sort_order)
  end

  def overview
    @transactions = search_form.transactions

    @revenue_by_month = helpers.sum_by_month(@transactions.select { |tx| tx.account_type == :revenue.to_s })
    @cost_of_service_by_month = helpers.sum_by_month(@transactions.select { |tx| tx.account_type == :cost_of_service.to_s })

    @profit_by_month = [
      { name: :revenue.to_s.titleize, data: @revenue_by_month },
      { name: :cost_of_service.to_s.titleize, data: @cost_of_service_by_month },
      { name: "Profit", data: @cost_of_service_by_month, visible: false }
    ]

    @costs_breakdown = Category.cost_of_service.map { |category| { name: category.name, data: category.transaction_sum_by_month, visible: false } }

    @assets_by_category = sum_by_categories(Category.fixed_assets + Category.current_assets)
    @liabilities_by_category = sum_by_categories(Category.fixed_liabilities + Category.current_liabilities)
    @equity_by_category = sum_by_categories(Category.owners_equity.all)
  end

  def sum_by_categories(categories)
    categories.group_by(&:name).map { |c, txs| [c, txs.sum(&:delta).abs] }
  end
end
