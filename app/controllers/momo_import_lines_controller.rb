# frozen_string_literal: true

class MomoImportLinesController < ApplicationController
  before_action :set_momo_import_line, only: %i[show edit update destroy]

  # GET /momo_import_lines
  def index
    @momo_import_lines = MomoImportLine.group_by_day
  end

  # GET /momo_import_lines/1
  def show; end

  # GET /momo_import_lines/new
  def new
    @momo_import_line = MomoImportLine.new
  end

  # GET /momo_import_lines/1/edit
  def edit; end

  # POST /momo_import_lines/import
  def import
    return redirect_to request.referer, notice: 'No files added' if params[:files].nil?

    params[:files].each do |file|
      return redirect_to request.referer, notice: 'Only CSV files allowed' unless file.content_type == 'text/csv'

      CsvImportService.new.call(file, MomoImportLine, mapping: {
                                  transaction_date: 'TRANSACTION DATE',
                                  from_acct: 'FROM ACCT',
                                  from_name: 'FROM NAME',
                                  from_no: 'FROM NO.',
                                  trans_type: 'TRANS. TYPE',
                                  amount: 'AMOUNT',
                                  fees: 'FEES',
                                  e_levy: 'E-LEVY',
                                  bal_before: 'BAL BEFORE',
                                  bal_after: 'BAL AFTER',
                                  to_no: 'TO NO.',
                                  to_name: 'TO NAME',
                                  to_acct: 'TO ACCT',
                                  f_id: 'F_ID',
                                  ref: 'REF',
                                  ova: 'OVA'
                                })
    end

    redirect_to momo_import_lines_url, notice: 'Imported successfully!'
  end

  # POST /momo_import_lines
  def create
    @momo_import_line = MomoImportLine.new(momo_import_line_params)

    if @momo_import_line.save
      redirect_to @momo_import_line, notice: 'Momo import line was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /momo_import_lines/1
  def update
    if @momo_import_line.update(momo_import_line_params)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@momo_import_line)
        end

        format.html { redirect_to @momo_import_line, notice: 'Momo import line was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /momo_import_lines/1
  def destroy
    @momo_import_line.destroy
    redirect_to momo_import_lines_url, notice: 'Momo import line was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_momo_import_line
    @momo_import_line = MomoImportLine.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def momo_import_line_params
    params.require(:momo_import_line).permit(:transaction_date, :from_acct, :from_name, :from_no, :trans_type,
                                             :amount, :fees, :e_levy, :bal_before, :bal_after, :to_no, :to_name,
                                             :to_acct, :f_id, :ref, :ova, :pnl_type, :notes, :category_id)
  end
end
