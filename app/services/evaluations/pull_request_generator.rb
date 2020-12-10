# frozen_string_literal: true

module Evaluations
  class PullRequestGenerator < ApplicationService
    attr_reader :evaluation, :repo

    def initialize(evaluation)
      regex = %r{github.com/([\w\-]*)/([\w\-]*)/?}
      @evaluation = evaluation
      @repo = evaluation.repo_url.match(regex) { "#{Regexp.last_match(1)}/#{Regexp.last_match(2)}" }
    end

    def call
      submits.map do |submit|
        find_or_create_by(submit)
      end.to_a.compact
    end

    private

    def find_or_create_by(attributes)
      UserEvaluation.find_or_create_by(attributes.merge(evaluation_id: evaluation.id))
    end

    def submits
      client.pulls(repo).map do |pr|
        user = User.find_by(nickname: pr.user.login)
        next unless user

        {
          source_url: pr.url,
          title: pr.title,
          user_id: user.id
        }
      end.lazy
    end

    def client
      @client ||= Octokit::Client.new(client_id: ENV['GITHUB_ID'], client_secret: ENV['GITHUB_SECRET'], per_page: 100)
    end
  end
end
