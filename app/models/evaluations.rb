# frozen_string_literal: true

module Evaluations
  def self.build(type, params = {})
    case type
    when 'pull_request'
      PullRequest
    when 'repository'
      Repository
    else
      raise NotImplementedError
    end.new(params)
  end
end
