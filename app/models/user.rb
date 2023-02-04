class User < ApplicationRecord
  def name
    "#{first_name} #{other_names} #{last_name}"
  end
  def creation_date
    created_at.to_date
  end
end
