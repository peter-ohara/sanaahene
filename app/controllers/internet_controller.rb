class InternetController < ApplicationController
  def index
    @internet_entries = InternetEntry.order(happened_at: :desc)
                                     .group_by(&:entry_date)


  end
end
