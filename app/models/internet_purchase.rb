class InternetPurchase < InternetEntry
  def headline_text
    internet_account.name
  end

  def supporting_text
    "#{attendee.first_name} purchased #{amount} GB"
  end

  def leading_content
    :wifi
  end

  def trailing_content
    "#{amount} GB"
  end

  def delta
    amount
  end

  def used_amount
    delta * -1
  end

  def balance
    previous_balance + amount
  end

end
