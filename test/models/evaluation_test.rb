# frozen_string_literal: true

# == Schema Information
#
# Table name: evaluations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  rubric_id  :bigint           not null
#  repo_url   :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  aasm_state :string
#  closed_on  :datetime
#

require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  def evaluation
    evaluations(:one)
  end

  def test_valid
    assert evaluations(:one).valid?
    assert evaluations(:two).valid?
  end

  def test_average_user_evaluation
    assert_equal 8.0, evaluation.average_user_evaluation
  end

  def test_completion_percent
    assert_equal 0.8, evaluation.completion_percent
  end

  def test_max_user_evaluation
    assert_equal 10, evaluation.max_user_evaluation
  end

  def test_min_user_evaluation
    assert_equal 6, evaluation.min_user_evaluation
  end
end
