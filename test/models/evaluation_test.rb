# frozen_string_literal: true

# == Schema Information
#
# Table name: evaluations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  rubric_id  :bigint           not null
#  repo_url   :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
