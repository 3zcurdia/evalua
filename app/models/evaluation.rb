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
  validates :name, presence: true

  def completed; end

  def average_user_evaluation; end

  def max_user_evaluation; end

  def min_user_evaluation; end
end
