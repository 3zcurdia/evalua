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

class User < ApplicationRecord
  has_many :user_evaluations, inverse_of: :user
  enum role: %i[user moderator admin]

  def self.from_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider  = auth['provider']
      user.uid       = auth['uid']
      user.email     = auth.dig('info', 'email')
      user.name      = auth.dig('info', 'name')
      user.nickname  = auth.dig('info', 'nickname')
      user.image_url = auth.dig('info', 'image')
      user.role      = :admin if ENV.fetch('GITHUB_ADMINS', '').split(',').include?(user.nickname)
    end
  end
end
