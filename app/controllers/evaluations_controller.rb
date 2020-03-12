# frozen_string_literal: true

class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: %i[show edit update destroy]

  def index
    @evaluations = Evaluation.all
  end

  def show; end

  def new
    @evaluation = Evaluation.new
  end

  def edit; end

  def create
    @evaluation = Evaluation.new(evaluation_params)

    if @evaluation.save
      redirect_to @evaluation, notice: 'Evaluation was successfully created.'
    else
      render :new
    end
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to @evaluation, notice: 'Evaluation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @evaluation.destroy
    redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.'
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:name)
  end
end
