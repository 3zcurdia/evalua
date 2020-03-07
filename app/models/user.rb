# frozen_string_literal: true

class User < ApplicationRecord
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
    end
  end
end
