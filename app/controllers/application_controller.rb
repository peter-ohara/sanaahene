class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :search_form


  private

  def search_form
    return SearchForm.new unless params[:search_form]

    SearchForm.new(search_form_params)
  end

  def search_form_params
    params.require(:search_form)
          .permit(:start_date, :end_date, category_ids: [], account_types: [])
  end
end
