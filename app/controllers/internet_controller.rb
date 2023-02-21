class InternetController < ApplicationController
  def index
    @internet_entries = InternetEntry.group_by_day
  end
end
