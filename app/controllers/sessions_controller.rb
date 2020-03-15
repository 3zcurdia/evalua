# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: :create

  def create
    user = User.from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to dashboard_url, notice: 'Signed in successfully!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
