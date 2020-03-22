# frozen_string_literal: true

class UserEvaluationsController < ApplicationController
  before_action :set_evaluation, except: %i[show create update]
  before_action :set_user_evaluation, only: %i[show edit update destroy]

  def index
    @user_evaluations = @evaluation.user_evaluations
  end

  def show
    @evaluation = @user_evaluation.evaluation
  end

  def new
    @user_evaluation = UserEvaluation.new(evaluation_id: params[:evaluation_id])
  end

  def edit; end

  def create
    @user_evaluation = UserEvaluation.new(user_evaluation_params)
    @user_evaluation.user = current_user

    if @user_evaluation.save
      redirect_to @user_evaluation.evaluation, notice: 'User evaluation was successfully created.'
    else
      render :new
    end
  end

  # TODO: set the policy to only owner is allowed to edit their submition
  def update
    if @user_evaluation.update(user_evaluation_params)
      redirect_to @user_evaluation.evaluation, notice: 'User evaluation was successfully updated.'
    else
      @evaluation = @user_evaluation
      render :edit
    end
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:evaluation_id])
  end

  def set_user_evaluation
    @user_evaluation = UserEvaluation.find(params[:id])
  end

  def user_evaluation_params
    params.require(:user_evaluation).permit(:evaluation_id, :source_url)
  end
end
