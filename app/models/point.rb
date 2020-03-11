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

class Point < ApplicationRecord
  belongs_to :user_evaluation
  belongs_to :rubric_item

  validate :weight_in_range

  def weight_in_range
    return if weight >= rubric_item.min_score && weight <= rubric_item.max_score
    errors.add(:weight, 'Invalid weight value')
  end
end
