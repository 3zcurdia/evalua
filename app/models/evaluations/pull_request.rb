# frozen_string_literal: true

# == Schema Information
#
# Table name: evaluations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  rubric_id  :bigint           not null
#  repo_url   :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  aasm_state :string
#  closed_at  :datetime
#

module Evaluations
  class PullRequest < Evaluation
    validates :repo_url, presence: true, format: URI.regexp(%w[http https])
  end
end
