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
#  role       :integer          default("0")
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_valid
    assert users(:one).valid?
  end

  def test_best_name
    user = users(:one)
    assert_equal 'One', user.best_name
    user.name = nil
    assert_equal 'one', user.best_name
  end

  def test_create_from_omniauth
    auth = {
      'provider' => 'github',
      'uid' => '123456789',
      'info' => {
        'email' => 'test@example.com',
        'name' => 'Joe Doe',
        'nickname' => 'test',
        'image' => 'https://example.com/img.png'
      }
    }
    user = User.create_from_omniauth(auth)
    assert_equal 'github', user.provider
    assert_equal '123456789', user.uid
    assert_equal 'Joe Doe', user.name
    assert_equal 'test@example.com', user.email
    assert_equal 'test', user.nickname
    assert_equal 'https://example.com/img.png', user.image_url
  end
end
