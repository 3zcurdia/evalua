# frozen_string_literal: true

# == Schema Information
#
# Table name: item_categories
#
#  id             :bigint           not null, primary key
#  name           :string
#  weight         :integer
#  summary        :text
#  rubric_item_id :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class ItemCategoryTest < ActiveSupport::TestCase
  def test_valid
    assert item_categories(:excelent).valid?
  end
end
