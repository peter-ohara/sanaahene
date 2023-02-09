class InventoryEntriesController < ApplicationController
  before_action :set_inventory_entry, only: %i[ show edit update destroy ]

  # GET /inventory_entries
  def index
    @inventory_entries = InventoryEntry.all
  end

  # GET /inventory_entries/1
  def show
  end

  # GET /inventory_entries/new
  def new
    @inventory_entry = InventoryEntry.new(happened_at: Time.zone.now)
  end

  # GET /inventory_entries/1/edit
  def edit
  end

  # POST /inventory_entries
  def create
    @inventory_entry = InventoryEntry.new(inventory_entry_params)

    if @inventory_entry.save
      redirect_to @inventory_entry, notice: "Inventory entry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inventory_entries/1
  def update
    if @inventory_entry.update(inventory_entry_params)
      redirect_to @inventory_entry, notice: "Inventory entry was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /inventory_entries/1
  def destroy
    @inventory_entry.destroy
    redirect_to inventory_entries_url, notice: "Inventory entry was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_entry
      @inventory_entry = InventoryEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_entry_params
      params.require(:inventory_entry).permit(:happened_at, :item_id, :amount, :quantity, :attendee_id, :notes, :type)
    end
end
