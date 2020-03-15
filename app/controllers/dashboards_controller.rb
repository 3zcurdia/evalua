# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    @rubric_item_count = RubricItem.count
    @evaluation_count = Evaluation.count
    @user_evaluation_count = UserEvaluation.count
    @user_count = User.count
  end
end
