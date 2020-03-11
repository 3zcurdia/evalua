# frozen_string_literal: true

# == Schema Information
#
# Table name: points
#
#  id             :bigint           not null, primary key
#  score_id       :bigint           not null
#  rubric_item_id :bigint           not null
#  weight         :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Point < ApplicationRecord
  belongs_to :user_evaluation
  belongs_to :rubric_item
end
