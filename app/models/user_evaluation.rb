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

class UserEvaluation < ApplicationRecord
  belongs_to :evaluation, inverse_of: :user_evaluations
  belongs_to :user, inverse_of: :user_evaluations
  has_many :points, inverse_of: :user_evaluation

  validates :evaluation, :user, presence: true

  def update_total_points!
    update(total_points: calc_total_points)
  end

  def completed?
    completion_percent == 1.0
  end

  def completion_percent
    points.count.to_f / evaluation.rubric_items_count
  end

  def bell
    @bell ||= total_points.to_f / evaluation.max_user_evaluation
  end

  def average
    @average ||= total_points.to_f / evaluation.rubric_items_count
  end

  private

  def calc_total_points
    points.sum(&:weight)
  end
end
