# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  provider   :string
#  uid        :string
#  nickname   :string
#  name       :string
#  email      :string
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :integer          default("user")
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
