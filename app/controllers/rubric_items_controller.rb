# frozen_string_literal: true

class RubricItemsController < ApplicationController
  before_action :set_rubric_item, only: %i[show edit update destroy]

  # GET /rubric_items
  # GET /rubric_items.json
  def index
    @rubric_items = RubricItem.all
  end

  # GET /rubric_items/1
  # GET /rubric_items/1.json
  def show; end

  # GET /rubric_items/new
  def new
    @rubric_item = RubricItem.new
  end

  # GET /rubric_items/1/edit
  def edit; end

  # POST /rubric_items
  # POST /rubric_items.json
  def create
    @rubric_item = RubricItem.new(rubric_item_params)

    respond_to do |format|
      if @rubric_item.save
        format.html { redirect_to @rubric_item, notice: 'Rubric item was successfully created.' }
        format.json { render :show, status: :created, location: @rubric_item }
      else
        format.html { render :new }
        format.json { render json: @rubric_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rubric_items/1
  # PATCH/PUT /rubric_items/1.json
  def update
    respond_to do |format|
      if @rubric_item.update(rubric_item_params)
        format.html { redirect_to @rubric_item, notice: 'Rubric item was successfully updated.' }
        format.json { render :show, status: :ok, location: @rubric_item }
      else
        format.html { render :edit }
        format.json { render json: @rubric_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rubric_items/1
  # DELETE /rubric_items/1.json
  def destroy
    @rubric_item.destroy
    respond_to do |format|
      format.html { redirect_to rubric_items_url, notice: 'Rubric item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rubric_item
    @rubric_item = RubricItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rubric_item_params
    params.require(:rubric_item).permit(:name)
  end
end
