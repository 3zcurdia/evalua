# frozen_string_literal: true

class RepositoryEvaluationsController < ApplicationController
  before_action :set_repository_evaluation, only: %i[show edit update destroy]

  # GET /repository_evaluations/new
  def new
    @repository_evaluation = RepositoryEvaluation.new
  end

  # GET /repository_evaluations/1/edit
  def edit; end

  # POST /repository_evaluations
  # POST /repository_evaluations.json
  def create
    @repository_evaluation = RepositoryEvaluation.new(repository_evaluation_params)

    respond_to do |format|
      if @repository_evaluation.save
        format.html { redirect_to @repository_evaluation, notice: 'Repository evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @repository_evaluation }
      else
        format.html { render :new }
        format.json { render json: @repository_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repository_evaluations/1
  # PATCH/PUT /repository_evaluations/1.json
  def update
    respond_to do |format|
      if @repository_evaluation.update(repository_evaluation_params)
        format.html { redirect_to @repository_evaluation, notice: 'Repository evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @repository_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @repository_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_repository_evaluation
    @repository_evaluation = RepositoryEvaluation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def repository_evaluation_params
    params.require(:repository_evaluation).permit(:name, :rubric_id)
  end
end
