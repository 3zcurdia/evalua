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
  belongs_to :rubric

  after_initialize :set_score_placeholder

  def set_score_placeholder
    self.scores ||= [
      { weight: 3, name: 'Excelent', summary: '' },
      { weight: 2, name: 'Good', summary: '' },
      { weight: 1, name: 'Regular', summary: '' },
      { weight: 0, name: 'Bad', summary: '' }
    ]
  end
end
