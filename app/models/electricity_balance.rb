class ElectricityBalance < ElectricityEntry
  include BalanceEntryable

  alias_attribute :meter_balance, :amount

  def supporting_text
    "#{number_to_cedis amount} at #{happened_at.to_time.strftime("%l:%M %P")}"
  end

  def leading_content
    :create
  end

  def trailing_content
    amount_delta
  end
end
