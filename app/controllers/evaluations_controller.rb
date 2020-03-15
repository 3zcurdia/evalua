# frozen_string_literal: true

class EvaluationsController < ApplicationController
  def index
    @evaluations = Evaluation.all
  end
end
