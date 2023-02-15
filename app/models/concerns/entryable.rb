module Entryable
  extend ActiveSupport::Concern

  included do

    def creation_date
      happened_at.to_date
    end

    def delta
      0.to_d
    end

    def balance
      0.to_d
    end

    def previous_balance
      0.to_d
    end
  end
end