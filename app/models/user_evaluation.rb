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
  has_many :points

  def completed?
    false
  end

  def completed; end

  def average; end

  def calc_total_points; end
end
