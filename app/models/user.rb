class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable,
         :validatable, :trackable, :timeoutable

  has_many :electricity_entries, foreign_key: :attendee_id, dependent: :destroy
  has_many :internet_entries, foreign_key: :attendee_id, dependent: :destroy

  def name
    "#{first_name} #{other_names} #{last_name}"
  end

end
