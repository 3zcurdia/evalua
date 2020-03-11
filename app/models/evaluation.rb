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
#

class Evaluation < ApplicationRecord
  belongs_to :rubric
  has_many :user_evaluations, inverse_of: :evaluation

  validates :name, :rubric, presence: true
  delegate :items_count, to: :rubric, prefix: true

  def completed?
    completion_percent == 1.0
  end

  def completion_percent
    user_evaluations.sum(&:completion_percent) / user_evaluations.count
  end

  def average_user_evaluation
    user_total_points.sum.to_f / user_evaluations.count
  end

  def max_user_evaluation
    user_total_points.max
  end

  def min_user_evaluation
    user_total_points.min
  end

  private

  def user_total_points
    user_evaluations.map(&:total_points)
  end
end
