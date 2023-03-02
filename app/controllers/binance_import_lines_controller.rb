# frozen_string_literal: true

class BinanceImportLinesController < ApplicationController
  before_action :set_binance_import_line, only: %i[show edit update destroy]

  # GET /binance_import_lines
  def index
    @binance_import_lines = BinanceImportLine.group_by_day
  end

  # GET /binance_import_lines/1
  def show; end

  # GET /binance_import_lines/new
  def new
    @binance_import_line = BinanceImportLine.new
  end

  # GET /binance_import_lines/1/edit
  def edit; end

  # POST /ecobank_import_lines/import
  def import
    return redirect_to request.referer, notice: 'No files added' if params[:files].nil?

    params[:files].each do |file|
      return redirect_to request.referer, notice: 'Only CSV files allowed' unless file.content_type == 'text/csv'

      CsvImportService.new.call(file, BinanceImportLine, mapping: {
                                  order_number: 'Order Number',
                                  order_type: 'Order Type',
                                  asset_type: 'Asset Type',
                                  fiat_type: 'Fiat Type',
                                  total_price: 'Total Price',
                                  price: 'Price',
                                  quantity: 'Quantity',
                                  exchange_rate: 'Exchange rate',
                                  couterparty: 'Couterparty',
                                  status: 'Status',
                                  created_time: 'Created Time'
                                })
    end

    redirect_to binance_import_lines_url, notice: 'Imported successfully!'
  end

  # POST /binance_import_lines
  def create
    @binance_import_line = BinanceImportLine.new(binance_import_line_params)

    if @binance_import_line.save
      redirect_to @binance_import_line, notice: 'Binance import line was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /binance_import_lines/1
  def update
    if @binance_import_line.update(binance_import_line_params)
      redirect_to @binance_import_line, notice: 'Binance import line was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /binance_import_lines/1
  def destroy
    @binance_import_line.destroy
    redirect_to binance_import_lines_url, notice: 'Binance import line was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_binance_import_line
    @binance_import_line = BinanceImportLine.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def binance_import_line_params
    params.require(:binance_import_line).permit(:order_number, :order_type, :asset_type, :fiat_type, :total_price,
                                                :price, :quantity, :exchange_rate, :couterparty, :status, :created_time,
                                                :pnl_type, :notes, :category_id)
  end
end
