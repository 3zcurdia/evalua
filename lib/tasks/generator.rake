# frozen_string_literal: true

namespace :generate do
  desc 'It generates pull request user evaluations'
  task pull_request: :environment do
    Evaluations::PullRequest.in_progress.each do |evaluation|
      Evaluation::PullRequestGenerator.new(evaluation).call
    end
  end
end
