# frozen_string_literal: true

module Evaluations
  class RepositoriesController < ApplicationController
    before_action :set_repository_evaluation, only: %i[show edit update destroy]

    def index
      @evaluations = Evaluations::Repository.all
    end

    def new
      @evaluation = Evaluations::Repository.new
    end

    def edit; end

    def create
      @evaluation = Evaluations::Repository.new(repository_evaluation_params)

      if @evaluation.save
        redirect_to @evaluation, notice: 'Repository evaluation was successfully created.'
      else
        render :new
      end
    end

    def update
      if @evaluation.update(repository_evaluation_params)
        redirect_to @evaluation, notice: 'Repository evaluation was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @evaluation.destroy
      redirect_to evaluations_url, notice: 'Repository evaluation was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_repository_evaluation
      @evaluation = Evaluations::Repository.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def repository_evaluation_params
      params.require(:evaluations_repository).permit(:name, :rubric_id, :closed_on)
    end
  end
end
