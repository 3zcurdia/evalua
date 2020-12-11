# frozen_string_literal: true

class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: %i[show edit update destroy]

  def index
    @evaluations = Evaluation.all
  end

  def new
    @evaluation = Evaluations.build(params[:type])
  end

  def show; end

  def edit; end

  def create
    @evaluation = Evaluations.build(params[:type], evaluation_params)

    if @evaluation.save
      redirect_to @evaluation, notice: 'Pull request evaluation was successfully created.'
    else
      render :new
    end
  end

  def update
    if @evaluation.update(pull_request_evaluation_params)
      redirect_to @evaluation, notice: 'Pull request evaluation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @evaluation.destroy
    redirect_to evaluations_url, notice: 'Pull request evaluation was successfully destroyed.'
  end

  private

  def set_evaluation
    @evaluation = Evaluations.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:name, :rubric_id, :repo_url)
  end
end
