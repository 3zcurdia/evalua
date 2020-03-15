# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate!
  layout 'landing'
  def index; end
end
