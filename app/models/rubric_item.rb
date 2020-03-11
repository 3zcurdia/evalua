# frozen_string_literal: true

# == Schema Information
#
# Table name: rubric_items
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  rubric_id  :bigint           not null
#  scores     :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RubricItem < ApplicationRecord
  belongs_to :rubric, inverse_of: :rubric_items

  validates :name, :rubric, :scores, presence: true

  after_initialize :set_score_placeholder

  def max_score
    @max_score ||= scores.map { |x| x['weight'] }.max
  end

  def min_score
    @min_score ||= scores.map { |x| x['weight'] }.min
  end

  def set_score_placeholder
    self.scores ||= [
      { weight: 3, name: 'Excelent', summary: '' },
      { weight: 2, name: 'Good', summary: '' },
      { weight: 1, name: 'Regular', summary: '' },
      { weight: 0, name: 'Bad', summary: '' }
    ]
  end
end
