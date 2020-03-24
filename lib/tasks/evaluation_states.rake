# frozen_string_literal: true

namespace :evaluations do
  desc 'It closes expired in progress evaluations'
  task close: :environment do
    Evaluation.in_progress.where('closed_on <= ?', DateTime.now.end_of_day).each do |evaluation|
      evaluation.close
    end
  end
end
