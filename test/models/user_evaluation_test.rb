# frozen_string_literal: true

# == Schema Information
#
# Table name: user_evaluations
#
#  id            :bigint           not null, primary key
#  evaluation_id :bigint           not null
#  user_id       :bigint           not null
#  total_points  :integer          default("0")
#  source_url    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class UserEvaluationTest < ActiveSupport::TestCase
  def user_evaluation
    user_evaluations(:one)
  end

  def test_valid
    assert user_evaluation.valid?
  end

  def test_update_total_points!
    user_evaluation.update_total_points!
    assert_equal 9, user_evaluation.total_points
  end

  def test_completed?
    assert user_evaluation.completed?
  end

  def test_completion_percent
    assert_equal 1.0, user_evaluation.completion_percent
  end

  def test_average
    user_evaluation.total_points = 10
    assert_equal 2, user_evaluation.average
  end

  def test_calc_total_points
    assert_equal 9, user_evaluation.send(:calc_total_points)
  end
end
