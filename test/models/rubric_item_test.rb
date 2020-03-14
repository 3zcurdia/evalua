# frozen_string_literal: true

# == Schema Information
#
# Table name: rubric_items
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  rubric_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  min_score  :integer          default("0")
#  max_score  :integer          default("3")
#

require 'test_helper'

class RubricItemTest < ActiveSupport::TestCase
  def item
    rubric_items(:code)
  end

  def test_valid
    assert item.valid?
  end

  def test_initialize_categories
    assert item.item_categories.any?
  end

  def test_initialize_categories_default
    first_category = item.item_categories.first
    assert 'Excelent', first_category.name
    assert 3, first_category.weight
  end
end
