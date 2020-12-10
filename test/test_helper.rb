# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

if ENV['COVERAGE'].present?
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_group 'Services', 'app/services'
    add_filter 'vendor'
  end
end

require 'rails/test_help'
require 'minitest/autorun'

class ActiveSupport::TestCase
  parallelize(workers: ENV['COVERAGE'].present? ? 1 : :number_of_processors)
  fixtures :all
end
