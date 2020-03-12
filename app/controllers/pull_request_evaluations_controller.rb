# frozen_string_literal: true

class PullRequestEvaluationsController < ApplicationController
  before_action :set_pull_request_evaluation, only: %i[show edit update destroy]

  # GET /pull_request_evaluations/new
  def new
    @pull_request_evaluation = PullRequestEvaluation.new
  end

  # GET /pull_request_evaluations/1/edit
  def edit; end

  # POST /pull_request_evaluations
  # POST /pull_request_evaluations.json
  def create
    @pull_request_evaluation = PullRequestEvaluation.new(pull_request_evaluation_params)

    respond_to do |format|
      if @pull_request_evaluation.save
        format.html { redirect_to @pull_request_evaluation, notice: 'Pull request evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @pull_request_evaluation }
      else
        format.html { render :new }
        format.json { render json: @pull_request_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pull_request_evaluations/1
  # PATCH/PUT /pull_request_evaluations/1.json
  def update
    respond_to do |format|
      if @pull_request_evaluation.update(pull_request_evaluation_params)
        format.html { redirect_to @pull_request_evaluation, notice: 'Pull request evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @pull_request_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @pull_request_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pull_request_evaluation
    @pull_request_evaluation = PullRequestEvaluation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pull_request_evaluation_params
    params.require(:pull_request_evaluation).permit(:name, :rubric_id, :repo_url)
  end
end
