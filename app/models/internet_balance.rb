class InternetBalance < InternetEntry
  include BalanceEntryable

  alias_attribute :data_balance, :quantity

  def supporting_text
    "#{attendee.first_name} checked balance. (#{quantity_used} GB used)"
  end

  def leading_content
    :wifi
  end

  def trailing_content
    "#{amount} GB"
  end

end
