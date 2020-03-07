# frozen_string_literal: true

# == Schema Information
#
# Table name: scores
#
#  id            :bigint           not null, primary key
#  evaluation_id :bigint           not null
#  user_id       :bigint           not null
#  total_points  :integer          default(0)
#  source_url    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
