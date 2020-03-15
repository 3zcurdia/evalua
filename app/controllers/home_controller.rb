# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate!
  layout 'landing'

  def index
    redirect_to(dashboard_path) && return if signed_in?
  end
end
