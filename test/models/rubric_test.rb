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

require 'test_helper'

class RubricTest < ActiveSupport::TestCase
  def test_valid
    assert rubrics(:one).valid?
  end
end
