# frozen_string_literal: true

module Evaluations
  class PullRequestsController < ApplicationController
    before_action :set_pull_request_evaluation, only: %i[show edit update destroy]

    def index
      @evaluations = Evaluations::PullRequest.all
    end

    def new
      @evaluation = Evaluations::PullRequest.new
    end

    def edit; end

    def create
      @evaluation = Evaluations::PullRequest.new(pull_request_evaluation_params)

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

    def set_pull_request_evaluation
      @evaluation = Evaluations::PullRequest.find(params[:id])
    end

    def pull_request_evaluation_params
      params.require(:evaluations_pull_request).permit(:name, :rubric_id, :repo_url)
    end
  end
end
