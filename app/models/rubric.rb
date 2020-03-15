# frozen_string_literal: true

# == Schema Information
#
# Table name: rubrics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rubric < ApplicationRecord
  has_many :rubric_items, inverse_of: :rubric, dependent: :destroy
  validates :name, presence: true

  def items_count
    rubric_items.count
  end

  def max_score
    rubric_items.sum(&:max_score)
  end
end
