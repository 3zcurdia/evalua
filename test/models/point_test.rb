# frozen_string_literal: true

# == Schema Information
#
# Table name: points
#
#  id                 :bigint           not null, primary key
#  rubric_item_id     :bigint           not null
#  weight             :integer          default("0")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_evaluation_id :bigint
#

require 'test_helper'

class PointTest < ActiveSupport::TestCase
  def point
    points(:code)
  end

  def test_valid
    assert point.valid?
  end

  def test_invalid_weight
    point.weight = 10
    refute point.valid?
  end

  def test_invalid_rubric_item
    point.rubric_item = nil
    refute point.valid?
  end

  def test_invalid_user_evaluation
    point.user_evaluation = nil
    refute point.valid?
  end

  def test_update_user_evluation_update
    point.update(weight: 2)
    assert_equal 10, point.user_evaluation.total_points
  end
end
