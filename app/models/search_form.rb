# frozen_string_literal: true

class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id, :integer
  attribute :category_ids, array: true, default: []
  attribute :account_types, array: true, default: []
  attribute :start_date, :date, default: -> { 1.year.ago.to_date }
  attribute :end_date, :date, default: -> { Time.current.to_date }

  def to_model
    self
  end

  def to_key
    id
  end

  def persisted?
    false
  end

  def categories
    Category.where(id: category_ids)
  end

  def transactions
    txs = BinanceImportLine.cedi_transactions + MomoImportLine.all + EcobankImportLine.all + NonBankTransaction.all
    txs.select { |tx| belongs_here?(tx) }
  end

  def belongs_here?(transaction)
    return false unless transaction.transaction_date.between?(start_date, end_date)
    return false unless categories.blank? || categories.include?(transaction.category)
    return false unless account_types.blank? || account_types.include?(transaction.account_type)

    true
  end
end
