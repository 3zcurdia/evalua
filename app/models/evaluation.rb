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

class Evaluation < ApplicationRecord
  include AASM
  belongs_to :rubric
  has_many :user_evaluations, inverse_of: :evaluation

  validates :name, :rubric, presence: true
  delegate :items_count, to: :rubric, prefix: true

  aasm do
    state :draft, initial: true
    state :in_progress, :review, :done

    event :open do
      transitions from: :todo, to: :in_progress
    end

    event :close do
      transitions from: :in_progress, to: :review
    end

    event :finish do
      transitions from: :review, to: :done, guard: :completed?
    end
  end

  def completed?
    completion_percent == 1.0
  end

  def completion_percent
    user_evaluations.sum(&:completion_percent) / user_evaluations.count
  rescue ZeroDivisionError
    0
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
