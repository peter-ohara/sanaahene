# frozen_string_literal: true

class EcobankImportLinesController < ApplicationController
  before_action :set_ecobank_import_line, only: %i[show edit update destroy]

  # GET /ecobank_import_lines
  def index
    @ecobank_import_lines = EcobankImportLine.group_by_day
  end

  # GET /ecobank_import_lines/1
  def show; end

  # GET /ecobank_import_lines/new
  def new
    @ecobank_import_line = EcobankImportLine.new
  end

  # GET /ecobank_import_lines/1/edit
  def edit; end

  # POST /ecobank_import_lines/import
  def import
    return redirect_to request.referer, notice: 'No files added' if params[:files].nil?

    params[:files].each do |file|
      return redirect_to request.referer, notice: 'Only CSV files allowed' unless file.content_type == 'text/csv'

      CsvImportService.new.call(file, EcobankImportLine, skip: 6, mapping: {
                                  transaction_date: 'Transaction Date',
                                  description: 'Description',
                                  reference: 'Reference Number',
                                  debit: 'DEBIT',
                                  credit: 'CREDIT',
                                  balance: 'Balance'
                                })
    end

    redirect_to ecobank_import_lines_url, notice: 'Imported successfully!'
  end

  # POST /ecobank_import_lines
  def create
    @ecobank_import_line = EcobankImportLine.new(ecobank_import_line_params)

    if @ecobank_import_line.save
      redirect_to @ecobank_import_line, notice: 'Ecobank import line was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ecobank_import_lines/1
  def update
    if @ecobank_import_line.update(ecobank_import_line_params)
      respond_to do |format|
        format.turbo_stream do
          # TODO Update something to show that the pnl_type was persisted
          # render turbo_stream: turbo_stream.replace(@momo_import_line)
        end

        format.html { redirect_to @ecobank_import_line, notice: 'Ecobank import line was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /ecobank_import_lines/1
  def destroy
    @ecobank_import_line.destroy
    redirect_to ecobank_import_lines_url, notice: 'Ecobank import line was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ecobank_import_line
    @ecobank_import_line = EcobankImportLine.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ecobank_import_line_params
    params.require(:ecobank_import_line).permit(:transaction_date, :description, :reference, :debit, :credit,
                                                :balance, :pnl_type, :notes)
  end
end
