class InternetBalance < InternetEntry

  def headline_text
    internet_account.name
  end

  def supporting_text
    "#{attendee.first_name} checked balance. (#{used_amount} GB used)"
  end

  def leading_content
    :wifi
  end

  def trailing_content
    "#{amount} GB"
  end

  def delta
    amount - previous_balance
  end

  def used_amount
    delta * -1
  end

  def balance
    amount
  end

end
