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

require 'test_helper'

class RubricItemTest < ActiveSupport::TestCase
  def item
    rubric_items(:code)
  end

  def test_valid
    assert item.valid?
  end

  def test_score_weight
    assert_equal 3, item.scores.first['weight']
  end

  def test_score_name
    assert_equal 'Excelent', item.scores.first['name']
  end
end
