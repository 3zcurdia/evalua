# frozen_string_literal: true

class RubricItemsController < ApplicationController
  def new
    @rubric_item = rubric.rubric_items.new
  end

  def edit
    @rubric_item = rubric.rubric_items.find(params[:id])
  end

  def create
    @rubric_item = rubric.rubric_items.new(rubric_item_params)

    if @rubric_item.save
      redirect_to rubric, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    @rubric_item = RubricItem.find(params[:id])

    if @rubric_item.update(rubric_item_params)
      redirect_to @rubric_item.rubric, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @rubric_item = RubricItem.find(params[:id])
    @rubric_item.destroy
    redirect_to @rubric_item.rubric, notice: 'Item was successfully destroyed.'
  end

  private

  def rubric
    @rubric ||= Rubric.find(params[:rubric_id])
  end

  def rubric_item_params
    params.require(:rubric_item).permit(:name, item_categories_attributes: {})
  end
end
