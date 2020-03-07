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
  # test "the truth" do
  #   assert true
  # end
end
