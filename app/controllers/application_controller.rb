# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate!
  include Pundit

  def authenticate!
    return if signed_in?

    head :unauthorized
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def signed_in?
    session[:user_id].present?
  end
  helper_method :signed_in?
end
